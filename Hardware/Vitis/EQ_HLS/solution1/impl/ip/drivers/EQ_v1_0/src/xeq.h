// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XEQ_H
#define XEQ_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xeq_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Ctrl_BaseAddress;
} XEq_Config;
#endif

typedef struct {
    u64 Ctrl_BaseAddress;
    u32 IsReady;
} XEq;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XEq_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XEq_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XEq_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XEq_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XEq_Initialize(XEq *InstancePtr, u16 DeviceId);
XEq_Config* XEq_LookupConfig(u16 DeviceId);
int XEq_CfgInitialize(XEq *InstancePtr, XEq_Config *ConfigPtr);
#else
int XEq_Initialize(XEq *InstancePtr, const char* InstanceName);
int XEq_Release(XEq *InstancePtr);
#endif

void XEq_Start(XEq *InstancePtr);
u32 XEq_IsDone(XEq *InstancePtr);
u32 XEq_IsIdle(XEq *InstancePtr);
u32 XEq_IsReady(XEq *InstancePtr);
void XEq_EnableAutoRestart(XEq *InstancePtr);
void XEq_DisableAutoRestart(XEq *InstancePtr);

void XEq_Set_sample_rate(XEq *InstancePtr, u32 Data);
u32 XEq_Get_sample_rate(XEq *InstancePtr);

void XEq_InterruptGlobalEnable(XEq *InstancePtr);
void XEq_InterruptGlobalDisable(XEq *InstancePtr);
void XEq_InterruptEnable(XEq *InstancePtr, u32 Mask);
void XEq_InterruptDisable(XEq *InstancePtr, u32 Mask);
void XEq_InterruptClear(XEq *InstancePtr, u32 Mask);
u32 XEq_InterruptGetEnabled(XEq *InstancePtr);
u32 XEq_InterruptGetStatus(XEq *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
