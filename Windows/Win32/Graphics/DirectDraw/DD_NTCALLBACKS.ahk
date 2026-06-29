#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_NTCALLBACKS structure contains entry pointers to Microsoft Windows 2000 and later Microsoft DirectDraw callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_NTCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_ntcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_NTCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_NTCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates what Windows 2000 and later callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_NTCB32_FREEDRIVERMEMORY</dt>
     * <dt>DDHAL_NTCB32_SETEXCLUSIVEMODE</dt>
     * <dt>DDHAL_NTCB32_FLIPTOGDISURFACE</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_freedrivermemory">DdFreeDriverMemory</a> callback.
     */
    FreeDriverMemory : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_setexclusivemode">DdSetExclusiveMode</a> callback.
     */
    SetExclusiveMode : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_fliptogdisurface">DdFlipToGDISurface</a> callback.
     */
    FlipToGDISurface : IntPtr

}
