#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of values used to indicate the type of table returned by calls to GetExtendedUdpTable.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>UDP_TABLE_CLASS</b> enumeration  is defined in the <i>Iprtrmib.h</i> header file, not in the <i>Iphlpapi.h</i> header file. Note that the <i>Iprtrmib.h</i> header file is automatically included in <i>Iphlpapi.h</i> header file. The <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ne-iprtrmib-udp_table_class
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class UDP_TABLE_CLASS{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a> structure that contains all UDP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static UDP_TABLE_BASIC => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_pid">MIB_UDPTABLE_OWNER_PID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_pid">MIB_UDP6TABLE_OWNER_PID</a> structure that contains all UDP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static UDP_TABLE_OWNER_PID => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable_owner_module">MIB_UDPTABLE_OWNER_MODULE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_module">MIB_UDP6TABLE_OWNER_MODULE</a> structure that contains all  UDP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static UDP_TABLE_OWNER_MODULE => 2
}
