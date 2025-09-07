#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides attributes of a helper.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-ns_helper_attributes
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_HELPER_ATTRIBUTES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    _ullAlign {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The GUID of the helper.
     * @type {Pointer<Guid>}
     */
    guidHelper {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_helper_start_fn">NS_HELPER_START_FN</a> entry point (the start function) of the helper.
     * @type {Pointer<Ptr>}
     */
    pfnStart {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_helper_stop_fn">NS_HELPER_STOP_FN</a> entry point (the stop function) of the helper. Set to null if no stop function is implemented.
     * @type {Pointer<Ptr>}
     */
    pfnStop {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
