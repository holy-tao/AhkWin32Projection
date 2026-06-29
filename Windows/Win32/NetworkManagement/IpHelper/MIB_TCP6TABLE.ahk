#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_TCP_STATE.ahk" { MIB_TCP_STATE }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\MIB_TCP6ROW.ahk" { MIB_TCP6ROW }

/**
 * Contains a table of TCP connections for IPv6 on the local computer.
 * @remarks
 * The <b>MIB_TCP6TABLE</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcp6table">GetTcp6Table</a> function retrieves the IPv6 TCP connection table on the local computer and returns this information in a <b>MIB_TCP6TABLE</b> structure. 
 * 
 * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structures are contained in the <b>MIB_TCP6TABLE</b> structure. 
 * 
 * The <b>MIB_TCP6TABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCP6ROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCP6ROW</b> array entry should assume  padding may exist.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcp6table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_TCP6TABLE {
    #StructPack 4

    /**
     * A value that specifies the number of TCP connections in the array.
     */
    dwNumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row">MIB_TCP6ROW</a> structures containing TCP connection entries.
     */
    table : MIB_TCP6ROW[1]

}
