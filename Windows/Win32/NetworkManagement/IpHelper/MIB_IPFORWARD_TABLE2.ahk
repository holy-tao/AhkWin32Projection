#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include .\IP_ADDRESS_PREFIX.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\MIB_IPFORWARD_ROW2.ahk

/**
 * Contains a table of IP route entries.
 * @remarks
 * 
  * The <b>MIB_IPFORWARD_TABLE2</b> structure is defined on Windows Vista and later. 
  * 
  * The <b>GetIpForwardTable2</b> function enumerates the IP route entries on a local system and returns this information in a <b>MIB_IPFORWARD_TABLE2</b> structure. 
  * 
  * 
  * 
  * The <b>GetIpForwardEntry2</b> function retrieves a single IP route entry and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure.
  * 
  * The <b>MIB_IPFORWARD_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPFORWARD_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPFORWARD_ROW2</b> array entry should assume  padding may exist. 
  * 
  * 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ns-netioapi-mib_ipforward_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPFORWARD_TABLE2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that specifies the number of IP route entries in the array.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structures containing IP route entries.
     * @type {Array<MIB_IPFORWARD_ROW2>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_IPFORWARD_ROW2, "")
            return this.__TableProxyArray
        }
    }
}
