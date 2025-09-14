#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * The DHCP_SEARCH_INFO structure defines the DHCP client record data used to search against for particular server operations.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SEARCH_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_search_info_type">DHCP_SEARCH_INFO_TYPE</a> enumeration value that specifies the data included in the subsequent member of this structure.
     * @type {Integer}
     */
    SearchType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ClientIpAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    ClientHardwareAddress{
        get {
            if(!this.HasProp("__ClientHardwareAddress"))
                this.__ClientHardwareAddress := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__ClientHardwareAddress
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    ClientName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
