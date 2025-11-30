#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible TCP offload states for a TCP connection.
 * @remarks
 * 
 * The <b>TCP_CONNECTION_OFFLOAD_STATE</b> enumeration is defined on Windows Server 2003 and later. 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>TCP_CONNECTION_OFFLOAD_STATE</b> enumeration  is defined in the <i>Tcpmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpmib/ne-tcpmib-tcp_connection_offload_state
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_CONNECTION_OFFLOAD_STATE extends Win32Enum{

    /**
     * The TCP connection is currently owned by the network stack on the local computer, and is not offloaded
     * @type {Integer (Int32)}
     */
    static TcpConnectionOffloadStateInHost => 0

    /**
     * The TCP connection is in the process of being offloaded, but the offload has not been completed.
     * @type {Integer (Int32)}
     */
    static TcpConnectionOffloadStateOffloading => 1

    /**
     * The TCP connection is offloaded to the network interface controller.
     * @type {Integer (Int32)}
     */
    static TcpConnectionOffloadStateOffloaded => 2

    /**
     * The TCP connection is in the process of being uploaded back to the network stack on the local computer, but the reinstate-to-host process has not completed.
     * @type {Integer (Int32)}
     */
    static TcpConnectionOffloadStateUploading => 3

    /**
     * The maximum possible value for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tcpmib/ne-tcpmib-tcp_connection_offload_state">TCP_CONNECTION_OFFLOAD_STATE</a> enumeration type. This is not a legal value for the possible TCP connection offload state.
     * @type {Integer (Int32)}
     */
    static TcpConnectionOffloadStateMax => 4
}
