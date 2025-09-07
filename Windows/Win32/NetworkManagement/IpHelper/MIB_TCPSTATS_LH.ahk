#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MIB_TCPSTATS_LH (tcpmib.h) contains statistics for the TCP protocol running on the local computer.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatistics">GetTcpStatistics</a> function returns a pointer to a <b>MIB_TCPSTATS</b> structure. 
  * 
  * The <b>MIB_TCPSTATS</b> structure changed slightly on Windows Vista and later. On Windows Vista and later, the <b>dwRtoAlgorithm</b> member is replaced by  a union that contains the following members.
  * 
  * 
  * 
  * <table>
  * <tr>
  * <th>Member</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="DWORD_dwRtoAlgorithm"></a><a id="dword_dwrtoalgorithm"></a><a id="DWORD_DWRTOALGORITHM"></a>DWORD dwRtoAlgorithm
  * 
  * </td>
  * <td width="60%">
  * The retransmission time-out (RTO) algorithm in use. 
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="TCP_RTO_ALGORITHM_RtoAlgorithm"></a><a id="tcp_rto_algorithm_rtoalgorithm"></a><a id="TCP_RTO_ALGORITHM_RTOALGORITHM"></a>TCP_RTO_ALGORITHM RtoAlgorithm
  * 
  * </td>
  * <td width="60%">
  * The retransmission time-out (RTO) algorithm in use.  This member can be one of the values from the <b>TCP_RTO_ALGORITHM</b> enumeration type defined in the <i>Tcpmib.h</i> header file. The possible values are the same as those defined for the <b>dwRtoAlgorithm</b> member. 
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * In the Windows SDK, the version of the structure for use on Windows Vista and later is  defined as <b>MIB_TCPSTATS_LH</b>. In the Windows SDK, the version of this structure to be used on earlier systems including Windows 2000 and later is defined as <b>MIB_TCPSTATS_W2K</b>. When compiling an application if the target platform is Windows Vista and later (<c>NTDDI_VERSION &gt;= NTDDI_LONGHORN</code>, <code>_WIN32_WINNT &gt;= 0x0600</code>, or <code>WINVER &gt;= 0x0600</c>), the <b>MIB_TCPSTATS_LH</b> structure is typedefed to the <b>MIB_TCPSTATS</b> structure. When compiling an application if the target platform is not Windows Vista and later, the <b>MIB_TCPSTATS_W2K</b> structure is typedefed to the <b>MIB_TCPSTATS</b> structure. 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcpstats_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPSTATS_LH extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwRtoAlgorithm {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RtoAlgorithm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minimum RTO value in milliseconds.
     * @type {Integer}
     */
    dwRtoMin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum RTO value in milliseconds.
     * @type {Integer}
     */
    dwRtoMax {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of connections. If this member is -1, the maximum number of connections is variable.
     * @type {Integer}
     */
    dwMaxConn {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of active opens. In an active open, the client is initiating a connection with the server.
     * @type {Integer}
     */
    dwActiveOpens {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of passive opens. In a passive open, the server is listening for a connection request from a client.
     * @type {Integer}
     */
    dwPassiveOpens {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of failed connection attempts.
     * @type {Integer}
     */
    dwAttemptFails {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of established connections that were reset.
     * @type {Integer}
     */
    dwEstabResets {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of currently established connections.
     * @type {Integer}
     */
    dwCurrEstab {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments received.
     * @type {Integer}
     */
    dwInSegs {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments transmitted. This number does not include retransmitted segments.
     * @type {Integer}
     */
    dwOutSegs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments retransmitted.
     * @type {Integer}
     */
    dwRetransSegs {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of errors received.
     * @type {Integer}
     */
    dwInErrs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments transmitted with the reset flag set.
     * @type {Integer}
     */
    dwOutRsts {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections that are currently present in the system. This total number includes connections in all states except listening connections.
     * @type {Integer}
     */
    dwNumConns {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
