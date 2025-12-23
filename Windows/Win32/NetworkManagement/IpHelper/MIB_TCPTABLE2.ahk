#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_TCPROW2.ahk

/**
 * Contains a table of IPv4 TCP connections on the local computer.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable2">GetTcpTable2</a> function retrieves the IPv4 TCP connection table on the local computer and returns this information in a <b>MIB_TCPTABLE2</b> structure. An array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow2">MIB_TCPROW2</a> structures are contained in the <b>MIB_TCPTABLE2</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_TCPTABLE2</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow2">MIB_TCPROW2</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCPROW2</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCPROW2</b> array entry should assume  padding may exist.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcptable2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPTABLE2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the table.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a table of TCP connections implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow2">MIB_TCPROW2</a> structures.
     * @type {Array<MIB_TCPROW2>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_TCPROW2, "")
            return this.__tableProxyArray
        }
    }
}
