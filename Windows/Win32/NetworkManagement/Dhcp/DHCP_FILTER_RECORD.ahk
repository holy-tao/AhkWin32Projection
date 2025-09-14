#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_ADDR_PATTERN.ahk

/**
 * Contains information for a specific link-layer filter.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_record
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FILTER_RECORD extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that contains the address/pattern related information of the link-layer filter.
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
     * Pointer to a null-terminated Unicode string which contains the comment associated with the address/pattern.
     * @type {Pointer<PWSTR>}
     */
    Comment {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }
}
