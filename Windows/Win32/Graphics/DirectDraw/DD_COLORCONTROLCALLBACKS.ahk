#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_COLORCONTROLCALLBACKS structure contains an entry pointer to the Microsoft DirectDraw color control callback that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_ColorControlCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_colorcontrolcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_COLORCONTROLCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_COLORCONTROLCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates whether the device supports the color control callback identified by <b>ColorControl</b>. The driver should set this member to be DDHAL_COLOR_COLORCONTROL when it implements the color control callback.
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_colorcb_colorcontrol">DdControlColor</a> callback.
     */
    ColorControl : IntPtr

}
