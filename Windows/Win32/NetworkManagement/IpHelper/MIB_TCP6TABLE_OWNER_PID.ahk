#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_TCP6ROW_OWNER_PID.ahk" { MIB_TCP6ROW_OWNER_PID }

/**
 * Contains a table of process IDs (PIDs) and the IPv6 TCP links that are context bound to these PIDs.
 * @remarks
 * The <b>MIB_TCP6TABLE_OWNER_PID</b> structure is returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getextendedtcptable">GetExtendedTcpTable</a> with the <i>TableClass</i> parameter set to <b>TCP_TABLE_OWNER_PID_LISTENER</b>, <b>TCP_TABLE_OWNER_PID_CONNECTIONS</b>, or <b>TCP_TABLE_OWNER_PID_ALL</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration and the <i>ulAf</i> parameter set to <b>AF_INET6</b>.
 * 
 * The <b>MIB_TCP6TABLE_OWNER_PID</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_pid">MIB_TCP6ROW_OWNER_PID</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_TCP6ROW_OWNER_PID</b> array entries in the <b>table</b> member. Any access to a <b>MIB_TCP6ROW_OWNER_PID</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_TCP6TABLE_OWNER_PID {
    #StructPack 4

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_pid">MIB_TCP6ROW_OWNER_PID</a> elements in the <b>table</b>.
     */
    dwNumEntries : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6row_owner_pid">MIB_TCP6ROW_OWNER_PID</a> structures returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getextendedtcptable">GetExtendedTcpTable</a>.
     */
    table : MIB_TCP6ROW_OWNER_PID[1]

}
