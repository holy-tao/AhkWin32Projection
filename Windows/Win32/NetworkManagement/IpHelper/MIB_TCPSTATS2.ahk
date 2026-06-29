#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCP_RTO_ALGORITHM.ahk" { TCP_RTO_ALGORITHM }

/**
 * Contains statistics for the TCP protocol running on the local computer. (MIB_TCPSTATS2)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatisticsex2">GetTcpStatisticsEx2</a> function returns a pointer to a <b>MIB_TCPSTATS2</b> structure. 
 * 
 *  This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcpstats2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_TCPSTATS2 {
    #StructPack 8

    RtoAlgorithm : TCP_RTO_ALGORITHM

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum RTO value in milliseconds.
     */
    dwRtoMin : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum RTO value in milliseconds.
     */
    dwRtoMax : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of connections. If this member is -1, the maximum number of connections is variable.
     */
    dwMaxConn : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of active opens. In an active open, the client is initiating a connection with the server.
     */
    dwActiveOpens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of passive opens. In a passive open, the server is listening for a connection request from a client.
     */
    dwPassiveOpens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of failed connection attempts.
     */
    dwAttemptFails : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of established connections that were reset.
     */
    dwEstabResets : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of currently established connections.
     */
    dwCurrEstab : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments received.
     */
    dw64InSegs : Int64

    /**
     * Type: <b>DWORD64</b>
     * 
     * The number of segments transmitted. This number does not include retransmitted segments.
     */
    dw64OutSegs : Int64

    /**
     * Type: <b>DWORD64</b>
     * 
     * The number of segments retransmitted.
     */
    dwRetransSegs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of errors received.
     */
    dwInErrs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments transmitted with the reset flag set.
     */
    dwOutRsts : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections that are currently present in the system. This total number includes connections in all states except listening connections.
     */
    dwNumConns : UInt32

}
