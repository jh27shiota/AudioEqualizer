/*
 * dma.c
 *
 *  Created on: Jan 20, 2015
 *      Author: ROHegbeC
 */

#include "dma.h"
#include "../demo.h"

/************************** Variable Definitions *****************************/

extern volatile sDemo_t Demo;
extern XAxiDma_Config *pCfgPtr;
#define BYTES_PER_SAMPLE 4
/******************************************************************************
 * This is the Interrupt Handler from the Stream to the MemoryMap. It is called
 * when an interrupt is trigger by the DMA
 *
 * @param	Callback is a pointer to S2MM channel of the DMA engine.
 *
 * @return	none
 *
 *****************************************************************************/
void fnS2MMInterruptHandler (void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;
	//Read all the pending DMA interrupts
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	//Acknowledge pending interrupts
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	//If there are no interrupts we exit the Handler
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK))
	{
		return;
	}

	// If error interrupt is asserted, raise error flag, reset the
	// hardware to recover from the error, and return with no further
	// processing.
	if (IrqStatus & XAXIDMA_IRQ_ERROR_MASK)
	{
		Demo.fDmaError = 1;
		XAxiDma_Reset(AxiDmaInst);
		TimeOut = 1000;
		while (TimeOut)
		{
			if(XAxiDma_ResetIsDone(AxiDmaInst))
			{
				break;
			}
			TimeOut -= 1;
		}
		return;
	}

	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK))
	{
		Demo.fDmaS2MMEvent = 1;
	}
}

/******************************************************************************
 * This is the Interrupt Handler from the MemoryMap to the Stream. It is called
 * when an interrupt is trigger by the DMA
 *
 * @param	Callback is a pointer to MM2S channel of the DMA engine.
 *
 * @return	none
 *
 *****************************************************************************/
void fnMM2SInterruptHandler (void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	//Read all the pending DMA interrupts
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);
	//Acknowledge pending interrupts
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);
	//If there are no interrupts we exit the Handler
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK))
	{
		return;
	}

	// If error interrupt is asserted, raise error flag, reset the
	// hardware to recover from the error, and return with no further
	// processing.
	if (IrqStatus & XAXIDMA_IRQ_ERROR_MASK){
		Demo.fDmaError = 1;
		XAxiDma_Reset(AxiDmaInst);
		TimeOut = 1000;
		while (TimeOut)
		{
			if(XAxiDma_ResetIsDone(AxiDmaInst))
			{
				break;
			}
			TimeOut -= 1;
		}
		return;
	}
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK))
	{
		Demo.fDmaMM2SEvent = 1;
	}
}

/******************************************************************************
 * Function to configure the DMA in Interrupt mode, this implies that the scatter
 * gather function is disabled. Prior to calling this function, the user must
 * make sure that the Interrupts and the Interrupt Handlers have been configured
 *
 * @return	XST_SUCCESS - if configuration was successful
 * 			XST_FAILURE - when the specification are not met
 *****************************************************************************/
XStatus fnConfigDma(XAxiDma *AxiDma)
{
	int Status;
	XAxiDma_Config *pCfgPtr;

	//Make sure the DMA hardware is present in the project
	//Ensures that the DMA hardware has been loaded
	pCfgPtr = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (!pCfgPtr)
	{
		if (Demo.u8Verbose)
		{
			xil_printf("\r\nNo config found for %d", XPAR_AXIDMA_0_DEVICE_ID);
		}
		return XST_FAILURE;
	}

	//Initialize DMA
	//Reads and sets all the available information
	//about the DMA to the AxiDma variable
	Status = XAxiDma_CfgInitialize(AxiDma, pCfgPtr);
	if (Status != XST_SUCCESS)
	{
		if (Demo.u8Verbose)
		{
			xil_printf("\r\nInitialization failed %d");
		}
		return XST_FAILURE;
	}

	//Ensures that the Scatter Gather mode is not active
	if(XAxiDma_HasSg(AxiDma))
	{
		if (Demo.u8Verbose)
		{

			xil_printf("\r\nDevice configured as SG mode");
		}
		return XST_FAILURE;
	}

	//Disable all the DMA related Interrupts
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Enable all the DMA Interrupts
	XAxiDma_IntrEnable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrEnable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	return XST_SUCCESS;
}

// DMA初期化（EQチェーン用）: タイムアウト付き
int fnConfigDmaEq(XAxiDma *InstancePtr, u16 DeviceId) {
    XAxiDma_Config *CfgPtr;
    int Status;

    CfgPtr = XAxiDma_LookupConfig(DeviceId);
    if (!CfgPtr) {
        xil_printf("No config found for DMA EQ\r\n");
        return XST_FAILURE;
    }

    Status = XAxiDma_CfgInitialize(InstancePtr, CfgPtr);
    if (Status != XST_SUCCESS) {
        xil_printf("DMA EQ initialization failed\r\n");
        return XST_FAILURE;
    }

    if (XAxiDma_HasSg(InstancePtr)) {
        xil_printf("DMA EQ configured for SG mode, expected simple mode\r\n");
        return XST_FAILURE;
    }

    XAxiDma_Reset(InstancePtr);
    int timeout = 1000000;
    while (!XAxiDma_ResetIsDone(InstancePtr) && timeout--);
    if (timeout <= 0) {
        xil_printf("DMA EQ Reset timeout!\n");
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

// FFT→EQ→IFFTのチェーン処理（1フレーム＝1025ワード）
void fnAudioProcess(XAxiDma *InstancePtr, u32 NumSamples) {
#define EQ_CTRL_BASEADDR XPAR_EQ_0_S_AXI_CTRL_BASEADDR
#define AP_START 0x01

    xil_printf("[fnAudioProcess] Start: NumSamples=%u\r\n", NumSamples);

    u32 size = NumSamples * sizeof(u32);
    u32 bufferAddr = MEM_BASE_ADDR;

    xil_printf("[fnAudioProcess] Transfer size=%u bytes (buffer=0x%08x)\r\n",
               size, bufferAddr);

    Xil_DCacheFlushRange(bufferAddr, size);

    Xil_Out32(EQ_CTRL_BASEADDR, AP_START);
    xil_printf("[fnAudioProcess] ap_start set\r\n");

    xil_printf("[fnAudioProcess] MM2S start (size=%u)\r\n", size);
    int status = XAxiDma_SimpleTransfer(InstancePtr, bufferAddr, size,
                                        XAXIDMA_DMA_TO_DEVICE);
    if (status != XST_SUCCESS) {
        xil_printf("[fnAudioProcess] MM2S transfer failed: %d\r\n", status);
        return;
    }

    xil_printf("[fnAudioProcess] S2MM start (size=%u)\r\n", size);
    status = XAxiDma_SimpleTransfer(InstancePtr, bufferAddr, size,
                                    XAXIDMA_DEVICE_TO_DMA);
    if (status != XST_SUCCESS) {
        xil_printf("[fnAudioProcess] S2MM transfer failed: %d\r\n", status);
        return;
    }

    xil_printf("[fnAudioProcess] Waiting for MM2S done...\r\n");
    int timeout = 10000000;
    while (XAxiDma_Busy(InstancePtr, XAXIDMA_DMA_TO_DEVICE) && timeout--);
    if (timeout <= 0) {
        xil_printf("[fnAudioProcess] Timeout MM2S\r\n");
        return;
    }

    xil_printf("[fnAudioProcess] Waiting for S2MM done...\r\n");
    timeout = 10000000;
    while (XAxiDma_Busy(InstancePtr, XAXIDMA_DEVICE_TO_DMA) && timeout--);
    if (timeout <= 0) {
        xil_printf("[fnAudioProcess] Timeout S2MM\r\n");
        return;
    }

    Xil_DCacheInvalidateRange(bufferAddr, size);
    xil_printf("[fnAudioProcess] Done. NumSamples=%u\r\n", NumSamples);
}
