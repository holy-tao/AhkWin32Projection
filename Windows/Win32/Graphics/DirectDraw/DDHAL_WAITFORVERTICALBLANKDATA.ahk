#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The DD_WAITFORVERTICALBLANKDATA structure contains information necessary to obtain the monitor's vertical blank information. (DDHAL_WAITFORVERTICALBLANKDATA)
 * @see https://learn.microsoft.com/windows/win32/api/ddrawi/ns-ddrawi-ddhal_waitforverticalblankdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_WAITFORVERTICALBLANKDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DDRAWI_DIRECTDRAW_GBL.Ptr

    dwFlags : UInt32

    /**
     * Indicates the status of the vertical blank. A value of <b>TRUE</b> indicates that the device is in a vertical blank; <b>FALSE</b> means that it is not. The driver should return the current vertical blanking status in this member when <b>dwFlags</b> is DDWAITVB_I_TESTVB.
     */
    bIsInVB : UInt32

    /**
     * Handle for the event that should be triggered when the vertical blank begins. The event is triggered on an interrupt, so if your hardware is able to generate an interrupt on the vertical blank, you should pass this event handle to your <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/video/nc-video-pvideo_hw_interrupt">HwVidInterrupt</a> function so that the event is triggered when the interrupt fires. This member is currently unsupported and should be ignored by the driver.
     */
    hEvent : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_waitforverticalblank">DdWaitForVerticalBlank</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    WaitForVerticalBlank : IntPtr

}
