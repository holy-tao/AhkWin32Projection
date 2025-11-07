#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics for the TCP protocol running on the local computer.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcpstatisticsex2">GetTcpStatisticsEx2</a> function returns a pointer to a <b>MIB_TCPSTATS2</b> structure. 
 * 
 *  This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpmib/ns-tcpmib-mib_tcpstats2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPSTATS2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * 
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
    dw64InSegs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD64</b>
     * 
     * The number of segments transmitted. This number does not include retransmitted segments.
     * @type {Integer}
     */
    dw64OutSegs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD64</b>
     * 
     * The number of segments retransmitted.
     * @type {Integer}
     */
    dwRetransSegs {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of errors received.
     * @type {Integer}
     */
    dwInErrs {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of segments transmitted with the reset flag set.
     * @type {Integer}
     */
    dwOutRsts {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections that are currently present in the system. This total number includes connections in all states except listening connections.
     * @type {Integer}
     */
    dwNumConns {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
