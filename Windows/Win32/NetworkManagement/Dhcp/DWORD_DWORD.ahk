#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWORD_DWORD structure defines a 64-bit integer value.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dword_dword
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DWORD_DWORD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the upper 32 bits of the value.
     * @type {Integer}
     */
    DWord1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the lower 32 bits of the value.
     * @type {Integer}
     */
    DWord2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
