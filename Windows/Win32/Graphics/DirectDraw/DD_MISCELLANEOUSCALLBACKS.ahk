#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_MISCELLANEOUSCALLBACKS structure contains an entry pointer to the memory query callback that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_MiscellaneousCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_miscellaneouscallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MISCELLANEOUSCALLBACKS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_MISCELLANEOUSCALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether the device supports the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback. The driver sets this member to DDHAL_MISCCB32_GETAVAILDRIVERMEMORY when it implements the callback.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback.
     * @type {Pointer<Ptr>}
     */
    GetAvailDriverMemory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
