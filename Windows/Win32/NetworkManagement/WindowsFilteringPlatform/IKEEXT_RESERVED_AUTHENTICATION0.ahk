#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reserved for internal use.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_reserved_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_RESERVED_AUTHENTICATION0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
