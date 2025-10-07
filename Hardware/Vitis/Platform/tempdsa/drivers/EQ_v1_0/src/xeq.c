// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xeq.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XEq_CfgInitialize(XEq *InstancePtr, XEq_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XEq_Start(XEq *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL) & 0x80;
    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XEq_IsDone(XEq *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XEq_IsIdle(XEq *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XEq_IsReady(XEq *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XEq_EnableAutoRestart(XEq *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL, 0x80);
}

void XEq_DisableAutoRestart(XEq *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_AP_CTRL, 0);
}

void XEq_Set_sample_rate(XEq *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_SAMPLE_RATE_DATA, Data);
}

u32 XEq_Get_sample_rate(XEq *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_SAMPLE_RATE_DATA);
    return Data;
}

void XEq_InterruptGlobalEnable(XEq *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_GIE, 1);
}

void XEq_InterruptGlobalDisable(XEq *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_GIE, 0);
}

void XEq_InterruptEnable(XEq *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_IER);
    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_IER, Register | Mask);
}

void XEq_InterruptDisable(XEq *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_IER);
    XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_IER, Register & (~Mask));
}

void XEq_InterruptClear(XEq *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XEq_WriteReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_ISR, Mask);
}

u32 XEq_InterruptGetEnabled(XEq *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_IER);
}

u32 XEq_InterruptGetStatus(XEq *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XEq_ReadReg(InstancePtr->Ctrl_BaseAddress, XEQ_CTRL_ADDR_ISR);
}

