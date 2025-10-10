#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_MULTICASTIPADDRESS_ROW.ahk

/**
 * Contains a table of multicast IP address entries.
 * @remarks
 * 
  * The <b>MIB_MULTICASTIPADDRESS_TABLE</b> structure is defined on Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddresstable">GetMulticastIpAddressTable</a> function enumerates the multicast IP addresses on a local system and returns this information in an <b>MIB_MULTICASTIPADDRESS_TABLE</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_MULTICASTIPADDRESS_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_MULTICASTIPADDRESS_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_MULTICASTIPADDRESS_ROW</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_multicastipaddress_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_MULTICASTIPADDRESS_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies the number of multicast IP address entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_row">MIB_MULTICASTIPADDRESS_ROW</a> structures containing multicast IP address entries.
     * @type {Array<MIB_MULTICASTIPADDRESS_ROW>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_MULTICASTIPADDRESS_ROW, "")
            return this.__TableProxyArray
        }
    }
}
