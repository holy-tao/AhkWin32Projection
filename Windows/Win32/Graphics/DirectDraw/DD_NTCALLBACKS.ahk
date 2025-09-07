#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_NTCALLBACKS structure contains entry pointers to Microsoft Windows 2000 and later Microsoft DirectDraw callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_NTCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_ntcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_NTCALLBACKS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_NTCALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates what Windows 2000 and later callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_NTCB32_FREEDRIVERMEMORY</dt>
     * <dt>DDHAL_NTCB32_SETEXCLUSIVEMODE</dt>
     * <dt>DDHAL_NTCB32_FLIPTOGDISURFACE</dt>
     * </dl>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_freedrivermemory">DdFreeDriverMemory</a> callback.
     * @type {Pointer<Ptr>}
     */
    FreeDriverMemory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_setexclusivemode">DdSetExclusiveMode</a> callback.
     * @type {Pointer<Ptr>}
     */
    SetExclusiveMode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_fliptogdisurface">DdFlipToGDISurface</a> callback.
     * @type {Pointer<Ptr>}
     */
    FlipToGDISurface {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
