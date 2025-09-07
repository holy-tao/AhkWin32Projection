#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * Contains the term or value on which the DHCPv6 server database will be searched.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SEARCH_INFO_V6 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Enumeration value that selects the type of the value on which the DHCPv6 database will be searched.
     * @type {Integer}
     */
    SearchType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DHCP_IPV6_ADDRESS}
     */
    ClientIpAddress{
        get {
            if(!this.HasProp("__ClientIpAddress"))
                this.__ClientIpAddress := DHCP_IPV6_ADDRESS(this.ptr + 8)
            return this.__ClientIpAddress
        }
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    ClientDUID{
        get {
            if(!this.HasProp("__ClientDUID"))
                this.__ClientDUID := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__ClientDUID
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ClientName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
