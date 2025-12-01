#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPV6_STATELESS_PARAMS structure defines the DHCPv6 stateless client inventory configuration settings at server and scope level.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6_STATELESS_PARAMS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * If <b>TRUE</b> the stateless client inventory is maintained by the DHCPv6 server. Otherwise, it is  <b>FALSE</b>. The default value is <b>FALSE</b>, which indicates that the stateless client inventory is disabled and is not maintained the by the server.
     * @type {BOOL}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Integer that specifies the maximum time interval, in hours, that stateless IPv6 DHCP client lease records can persist before being deleted from the DHCP server database.
     * @type {Integer}
     */
    PurgeInterval {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
