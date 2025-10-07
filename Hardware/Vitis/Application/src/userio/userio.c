/******************************************************************************
 * @file userio.c  (switch-polling minimal version for CH1=SW, CH2 unused)
 *
 * 本ファイルは GPIO を初期化し、CH1 を入力（スイッチ）として設定します。
 * 割り込みは使用せず、スイッチ読み取りは demo.c 側で
 *   XGpio_DiscreteRead(&sUserIO, 1)
 * を用いてポーリングで行います。
 ******************************************************************************/

#include <stdio.h>
#include "xparameters.h"
#include "userio.h"
#include "../demo.h"

#define USERIO_DEVICE_ID   0

/* あなたの設計が「CH1=スイッチ」の場合 */
#define USERIO_SW_CH       1   // スイッチのあるチャネル（demo.c と一致させること）

extern volatile sDemo_t Demo;

/*-----------------------------------------------------------------------------
 * 初期化：GPIO の初期化と方向設定のみ。割り込みは使わない。
 *---------------------------------------------------------------------------*/
XStatus fnInitUserIO(XGpio *psGpio)
{
    int Status;

    /* Initialize & Self-test */
    Status = XGpio_Initialize(psGpio, USERIO_DEVICE_ID);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    Status = XGpio_SelfTest(psGpio);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    /* 方向設定：
     * CH1=スイッチ入力（0xFF: 全ビット入力）。CH2は未使用なら設定不要。
     */
    XGpio_SetDataDirection(psGpio, USERIO_SW_CH, 0xFF);

    /* 互換目的：旧来のボタンイベント系フラグを無効化 */
    Demo.fUserIOEvent = 0;
    Demo.chBtn        = 0;

    /* 割り込みは使わない（登録・有効化しない） */
    // XGpio_InterruptDisable(psGpio, ...);
    // XGpio_InterruptGlobalDisable(psGpio);

    return XST_SUCCESS;
}

/*-----------------------------------------------------------------------------
 * 互換のため残すダミーISR（今回は割り込み未使用なので何もしない）
 *---------------------------------------------------------------------------*/
void fnUserIOIsr(void *pvInst)
{
    (void)pvInst;
    /* 未使用：スイッチは demo.c 側でポーリングします */
}
