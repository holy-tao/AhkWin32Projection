#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DHCP_ADDR_PATTERN.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information regarding the link-layer filter to be added to the allow and deny filter list.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_filter_add_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FILTER_ADD_INFO extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that contains the address/pattern-related information of the link-layer filter.
     * @type {DHCP_ADDR_PATTERN}
     */
    AddrPatt{
        get {
            if(!this.HasProp("__AddrPatt"))
                this.__AddrPatt := DHCP_ADDR_PATTERN(this.ptr + 0)
            return this.__AddrPatt
        }
    }

    /**
     * Pointer to a Unicode string that contains a text comment for the filter.
     * @type {PWSTR}
     */
    Comment{
        get {
            if(!this.HasProp("__Comment"))
                this.__Comment := PWSTR(this.ptr + 272)
            return this.__Comment
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_filter_list_type">DHCP_FILTER_LIST_TYPE</a> enumeration value that specifies the list type to which the filter is to be added.
     * @type {Integer}
     */
    ListType {
        get => NumGet(this, 280, "int")
        set => NumPut("int", value, this, 280)
    }
}
