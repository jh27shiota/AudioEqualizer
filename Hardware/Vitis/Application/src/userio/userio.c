/******************************************************************************
 * @file userio.c  (switch-polling minimal version for CH1=SW, CH2 unused)
 *
 * �{�t�@�C���� GPIO �����������ACH1 ����́i�X�C�b�`�j�Ƃ��Đݒ肵�܂��B
 * ���荞�݂͎g�p�����A�X�C�b�`�ǂݎ��� demo.c ����
 *   XGpio_DiscreteRead(&sUserIO, 1)
 * ��p���ă|�[�����O�ōs���܂��B
 ******************************************************************************/

#include <stdio.h>
#include "xparameters.h"
#include "userio.h"
#include "../demo.h"

#define USERIO_DEVICE_ID   0

/* ���Ȃ��̐݌v���uCH1=�X�C�b�`�v�̏ꍇ */
#define USERIO_SW_CH       1   // �X�C�b�`�̂���`���l���idemo.c �ƈ�v�����邱�Ɓj

extern volatile sDemo_t Demo;

/*-----------------------------------------------------------------------------
 * �������FGPIO �̏������ƕ����ݒ�̂݁B���荞�݂͎g��Ȃ��B
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

    /* �����ݒ�F
     * CH1=�X�C�b�`���́i0xFF: �S�r�b�g���́j�BCH2�͖��g�p�Ȃ�ݒ�s�v�B
     */
    XGpio_SetDataDirection(psGpio, USERIO_SW_CH, 0xFF);

    /* �݊��ړI�F�����̃{�^���C�x���g�n�t���O�𖳌��� */
    Demo.fUserIOEvent = 0;
    Demo.chBtn        = 0;

    /* ���荞�݂͎g��Ȃ��i�o�^�E�L�������Ȃ��j */
    // XGpio_InterruptDisable(psGpio, ...);
    // XGpio_InterruptGlobalDisable(psGpio);

    return XST_SUCCESS;
}

/*-----------------------------------------------------------------------------
 * �݊��̂��ߎc���_�~�[ISR�i����͊��荞�ݖ��g�p�Ȃ̂ŉ������Ȃ��j
 *---------------------------------------------------------------------------*/
void fnUserIOIsr(void *pvInst)
{
    (void)pvInst;
    /* ���g�p�F�X�C�b�`�� demo.c ���Ń|�[�����O���܂� */
}
