#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_WAITFORVERTICALBLANKDATA structure contains information necessary to obtain the monitor's vertical blank information. (DDHAL_WAITFORVERTICALBLANKDATA)
 * @see https://learn.microsoft.com/windows/win32/api/ddrawi/ns-ddrawi-ddhal_waitforverticalblankdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_WAITFORVERTICALBLANKDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Indicates the status of the vertical blank. A value of <b>TRUE</b> indicates that the device is in a vertical blank; <b>FALSE</b> means that it is not. The driver should return the current vertical blanking status in this member when <b>dwFlags</b> is DDWAITVB_I_TESTVB.
     * @type {Integer}
     */
    bIsInVB {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Handle for the event that should be triggered when the vertical blank begins. The event is triggered on an interrupt, so if your hardware is able to generate an interrupt on the vertical blank, you should pass this event handle to your <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/video/nc-video-pvideo_hw_interrupt">HwVidInterrupt</a> function so that the event is triggered when the interrupt fires. This member is currently unsupported and should be ignored by the driver.
     * @type {Pointer}
     */
    hEvent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_waitforverticalblank">DdWaitForVerticalBlank</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<LPDDHAL_WAITFORVERTICALBLANK>}
     */
    WaitForVerticalBlank {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
