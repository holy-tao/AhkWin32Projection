#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCP_CONNECTION_OFFLOAD_STATE.ahk" { TCP_CONNECTION_OFFLOAD_STATE }
#Import ".\MIB_TCPROW2.ahk" { MIB_TCPROW2 }

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
 */
export default struct MIB_TCPTABLE2 {
    #StructPack 4

    /**
     * The number of entries in the table.
     */
    dwNumEntries : UInt32

    /**
     * A pointer to a table of TCP connections implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcprow2">MIB_TCPROW2</a> structures.
     */
    table : MIB_TCPROW2[1]

}
