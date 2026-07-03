#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_MISCELLANEOUSCALLBACKS structure contains an entry pointer to the memory query callback that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_MiscellaneousCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_miscellaneouscallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MISCELLANEOUSCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_MISCELLANEOUSCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates whether the device supports the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback. The driver sets this member to DDHAL_MISCCB32_GETAVAILDRIVERMEMORY when it implements the callback.
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback.
     */
    GetAvailDriverMemory : IntPtr

}
