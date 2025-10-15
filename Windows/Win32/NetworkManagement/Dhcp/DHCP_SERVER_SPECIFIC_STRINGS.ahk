#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the default string values for user and vendor class names.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_server_specific_strings
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_SPECIFIC_STRINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies the default vendor class name for the DHCP server.
     * @type {PWSTR}
     */
    DefaultVendorClassName{
        get {
            if(!this.HasProp("__DefaultVendorClassName"))
                this.__DefaultVendorClassName := PWSTR(this.ptr + 0)
            return this.__DefaultVendorClassName
        }
    }

    /**
     * Pointer to a Unicode string that specifies the default user class name for the DHCP server.
     * @type {PWSTR}
     */
    DefaultUserClassName{
        get {
            if(!this.HasProp("__DefaultUserClassName"))
                this.__DefaultUserClassName := PWSTR(this.ptr + 8)
            return this.__DefaultUserClassName
        }
    }
}
