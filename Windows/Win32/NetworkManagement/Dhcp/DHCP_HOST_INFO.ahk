#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_HOST_INFO structure defines information on a DHCP server (host).
 * @remarks
 * 
  * When this structure is populated by the DHCP Server, the <b>HostName</b> and <b>NetBiosName</b> members may be set to <b>NULL</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_host_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_HOST_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the DHCP server.
     * @type {Integer}
     */
    IpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unicode string that contains the NetBIOS name of the DHCP server.
     * @type {Pointer<Char>}
     */
    NetBiosName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unicode string that contains the network name of the DHCP server.
     * @type {Pointer<Char>}
     */
    HostName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
