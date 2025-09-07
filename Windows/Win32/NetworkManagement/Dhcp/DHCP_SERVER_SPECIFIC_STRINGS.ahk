#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the default string values for user and vendor class names.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_specific_strings
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_SPECIFIC_STRINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies the default vendor class name for the DHCP server.
     * @type {Pointer<Ptr>}
     */
    DefaultVendorClassName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a Unicode string that specifies the default user class name for the DHCP server.
     * @type {Pointer<Ptr>}
     */
    DefaultUserClassName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
