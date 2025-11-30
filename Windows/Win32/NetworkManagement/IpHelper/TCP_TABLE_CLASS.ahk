#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of values used to indicate the type of table returned by calls to GetExtendedTcpTable.
 * @remarks
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>TCP_TABLE_CLASS</b> enumeration  is defined in the <i>Iprtrmib.h</i> header file, not in the <i>Iphlpapi.h</i> header file. Note that the <i>Iprtrmib.h</i> header file is automatically included in <i>Iphlpapi.h</i> header file. The <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iprtrmib/ne-iprtrmib-tcp_table_class
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_TABLE_CLASS extends Win32Enum{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> table that contains all listening (receiving only) TCP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_BASIC_LISTENER => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> table that contains all connected TCP endpoints  on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_BASIC_CONNECTIONS => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable">MIB_TCPTABLE</a> table that contains all TCP endpoints  on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_BASIC_ALL => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a> that contains all listening (receiving only) TCP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_PID_LISTENER => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a> that structure that contains all connected TCP endpoints  on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_PID_CONNECTIONS => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_pid">MIB_TCPTABLE_OWNER_PID</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_pid">MIB_TCP6TABLE_OWNER_PID</a> structure that contains all TCP endpoints  on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_PID_ALL => 5

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a> structure that contains all listening (receiving only) TCP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_MODULE_LISTENER => 6

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a> structure that contains all connected TCP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_MODULE_CONNECTIONS => 7

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable_owner_module">MIB_TCPTABLE_OWNER_MODULE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcp6table_owner_module">MIB_TCP6TABLE_OWNER_MODULE</a> structure that contains all  TCP endpoints on the local computer is returned to the caller.
     * @type {Integer (Int32)}
     */
    static TCP_TABLE_OWNER_MODULE_ALL => 8
}
