#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_RESERVED_AUTHENTICATION_FLAGS.ahk

/**
 * Reserved for internal use.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_reserved_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_RESERVED_AUTHENTICATION0 extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * @type {IKEEXT_RESERVED_AUTHENTICATION_FLAGS}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
