#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_IPNET_ROW2.ahk

/**
 * Contains a table of neighbor IP address entries.
 * @remarks
 * The <b>MIB_IPNET_TABLE2</b> structure is defined on Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function enumerates the neighbor IP addresses on a local system and returns this information in an <b>MIB_IPNET_TABLE2</b> structure. 
  * 
  * For IPv4, this includes addresses determined used the Address Resolution Protocol (ARP). For IPv6, this includes addresses determined using the Neighbor Discovery (ND) protocol for IPv6 as specified in RFC 2461. For more information, see <a href="https://www.ietf.org/rfc/rfc2461.txt">http://www.ietf.org/rfc/rfc2461.txt</a>. 
  * 
  * The <b>MIB_IPNET_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPNET_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPNET_ROW2</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ipnet_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPNET_TABLE2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies the number of IP network neighbor address entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structures containing IP network neighbor address entries.
     * @type {Array<MIB_IPNET_ROW2>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 8, MIB_IPNET_ROW2, "")
            return this.__TableProxyArray
        }
    }
}
