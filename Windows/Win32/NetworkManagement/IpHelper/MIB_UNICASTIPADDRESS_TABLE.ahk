#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_UNICASTIPADDRESS_ROW.ahk

/**
 * Contains a table of unicast IP address entries.
 * @remarks
 * The <b>MIB_UNICASTIPADDRESS_TABLE</b> structure is defined on Windows Vista and later. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getunicastipaddresstable">GetUnicastIpAddressTable</a> function enumerates the unicast IP addresses on a local system and returns this information in an <b>MIB_UNICASTIPADDRESS_TABLE</b> structure. 
  * 
  * 
  * 
  * The <b>MIB_UNICASTIPADDRESS_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_UNICASTIPADDRESS_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_UNICASTIPADDRESS_ROW</b> array entry should assume  padding may exist.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_unicastipaddress_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UNICASTIPADDRESS_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies the number of unicast IP address entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_unicastipaddress_row">MIB_UNICASTIPADDRESS_ROW</a> structures containing unicast IP address entries.
     * @type {Array<MIB_UNICASTIPADDRESS_ROW>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 8, MIB_UNICASTIPADDRESS_ROW, "")
            return this.__TableProxyArray
        }
    }
}
