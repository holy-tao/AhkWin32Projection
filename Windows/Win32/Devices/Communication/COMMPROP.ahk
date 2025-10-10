#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a communications driver.
 * @remarks
 * 
  * The contents of the <b>dwProvSpec1</b>, <b>dwProvSpec2</b>, and 
  *     <b>wcProvChar</b> members depend on the provider subtype (specified by the 
  *     <b>dwProvSubType</b> member).
  * 
  * If the provider subtype is <b>PST_MODEM</b>, these members are used as follows.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td><b>dwProvSpec1</b></td>
  * <td>Not used.</td>
  * </tr>
  * <tr>
  * <td><b>dwProvSpec2</b></td>
  * <td>Not used.</td>
  * </tr>
  * <tr>
  * <td><b>wcProvChar</b></td>
  * <td>Contains a <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure.</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-commprop
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMMPROP extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * The size of the entire data packet, regardless of the amount of data requested, in bytes.
     * @type {Integer}
     */
    wPacketLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The version of the structure.
     * @type {Integer}
     */
    wPacketVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A bitmask indicating which services are implemented by this provider. The 
     *       <b>SP_SERIALCOMM</b> value is always specified for communications providers, including modem 
     *       providers.
     * @type {Integer}
     */
    dwServiceMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum size of the driver's internal output buffer, in bytes. A value of zero indicates that no 
     *       maximum value is imposed by the serial provider.
     * @type {Integer}
     */
    dwMaxTxQueue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum size of the driver's internal input buffer, in bytes. A value of zero indicates that no maximum 
     *       value is imposed by the serial provider.
     * @type {Integer}
     */
    dwMaxRxQueue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The maximum allowable baud rate, in bits per second (bps). This member can be one of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_075"></a><a id="baud_075"></a><dl>
     * <dt><b>BAUD_075</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 75 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_110"></a><a id="baud_110"></a><dl>
     * <dt><b>BAUD_110</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 110 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_134_5"></a><a id="baud_134_5"></a><dl>
     * <dt><b>BAUD_134_5</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 134.5 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_150"></a><a id="baud_150"></a><dl>
     * <dt><b>BAUD_150</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 150 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_300"></a><a id="baud_300"></a><dl>
     * <dt><b>BAUD_300</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 300 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_600"></a><a id="baud_600"></a><dl>
     * <dt><b>BAUD_600</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_1200"></a><a id="baud_1200"></a><dl>
     * <dt><b>BAUD_1200</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 1200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_1800"></a><a id="baud_1800"></a><dl>
     * <dt><b>BAUD_1800</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 1800 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_2400"></a><a id="baud_2400"></a><dl>
     * <dt><b>BAUD_2400</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 2400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_4800"></a><a id="baud_4800"></a><dl>
     * <dt><b>BAUD_4800</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 4800 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_7200"></a><a id="baud_7200"></a><dl>
     * <dt><b>BAUD_7200</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 7200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_9600"></a><a id="baud_9600"></a><dl>
     * <dt><b>BAUD_9600</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 9600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_14400"></a><a id="baud_14400"></a><dl>
     * <dt><b>BAUD_14400</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 14400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_19200"></a><a id="baud_19200"></a><dl>
     * <dt><b>BAUD_19200</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 19200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_38400"></a><a id="baud_38400"></a><dl>
     * <dt><b>BAUD_38400</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 38400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_56K"></a><a id="baud_56k"></a><dl>
     * <dt><b>BAUD_56K</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 56K bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_57600"></a><a id="baud_57600"></a><dl>
     * <dt><b>BAUD_57600</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 57600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_115200"></a><a id="baud_115200"></a><dl>
     * <dt><b>BAUD_115200</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 115200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_128K"></a><a id="baud_128k"></a><dl>
     * <dt><b>BAUD_128K</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128K bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BAUD_USER"></a><a id="baud_user"></a><dl>
     * <dt><b>BAUD_USER</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Programmable baud rate.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwMaxBaud {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The communications-provider type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_FAX"></a><a id="pst_fax"></a><dl>
     * <dt><b>PST_FAX</b></dt>
     * <dt>0x00000021</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FAX device
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_LAT"></a><a id="pst_lat"></a><dl>
     * <dt><b>PST_LAT</b></dt>
     * <dt>0x00000101</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAT protocol
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_MODEM"></a><a id="pst_modem"></a><dl>
     * <dt><b>PST_MODEM</b></dt>
     * <dt>0x00000006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modem device
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_NETWORK_BRIDGE"></a><a id="pst_network_bridge"></a><dl>
     * <dt><b>PST_NETWORK_BRIDGE</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified network bridge
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_PARALLELPORT"></a><a id="pst_parallelport"></a><dl>
     * <dt><b>PST_PARALLELPORT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parallel port
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_RS232"></a><a id="pst_rs232"></a><dl>
     * <dt><b>PST_RS232</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RS-232 serial port
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_RS422"></a><a id="pst_rs422"></a><dl>
     * <dt><b>PST_RS422</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RS-422 port
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_RS423"></a><a id="pst_rs423"></a><dl>
     * <dt><b>PST_RS423</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RS-423 port
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_RS449"></a><a id="pst_rs449"></a><dl>
     * <dt><b>PST_RS449</b></dt>
     * <dt>0x00000005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RS-449 port
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_SCANNER"></a><a id="pst_scanner"></a><dl>
     * <dt><b>PST_SCANNER</b></dt>
     * <dt>0x00000022</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scanner device
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_TCPIP_TELNET"></a><a id="pst_tcpip_telnet"></a><dl>
     * <dt><b>PST_TCPIP_TELNET</b></dt>
     * <dt>0x00000102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TCP/IP Telnet protocol
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_UNSPECIFIED"></a><a id="pst_unspecified"></a><dl>
     * <dt><b>PST_UNSPECIFIED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PST_X25"></a><a id="pst_x25"></a><dl>
     * <dt><b>PST_X25</b></dt>
     * <dt>0x00000103</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * X.25 standards
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwProvSubType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A bitmask indicating the capabilities offered by the provider. This member can be a combination of the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_16BITMODE"></a><a id="pcf_16bitmode"></a><dl>
     * <dt><b>PCF_16BITMODE</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Special 16-bit mode supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_DTRDSR"></a><a id="pcf_dtrdsr"></a><dl>
     * <dt><b>PCF_DTRDSR</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DTR (data-terminal-ready)/DSR (data-set-ready) supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_INTTIMEOUTS"></a><a id="pcf_inttimeouts"></a><dl>
     * <dt><b>PCF_INTTIMEOUTS</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interval time-outs supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_PARITY_CHECK"></a><a id="pcf_parity_check"></a><dl>
     * <dt><b>PCF_PARITY_CHECK</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parity checking supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_RLSD"></a><a id="pcf_rlsd"></a><dl>
     * <dt><b>PCF_RLSD</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RLSD (receive-line-signal-detect) supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_RTSCTS"></a><a id="pcf_rtscts"></a><dl>
     * <dt><b>PCF_RTSCTS</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RTS (request-to-send)/CTS (clear-to-send) supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_SETXCHAR"></a><a id="pcf_setxchar"></a><dl>
     * <dt><b>PCF_SETXCHAR</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settable XON/XOFF supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_SPECIALCHARS"></a><a id="pcf_specialchars"></a><dl>
     * <dt><b>PCF_SPECIALCHARS</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Special character support provided
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_TOTALTIMEOUTS"></a><a id="pcf_totaltimeouts"></a><dl>
     * <dt><b>PCF_TOTALTIMEOUTS</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The total (elapsed) time-outs supported
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PCF_XONXOFF"></a><a id="pcf_xonxoff"></a><dl>
     * <dt><b>PCF_XONXOFF</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * XON/XOFF flow control supported
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwProvCapabilities {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A bitmask indicating the communications parameters that can be changed. This member can be a combination of 
     *       the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_BAUD"></a><a id="sp_baud"></a><dl>
     * <dt><b>SP_BAUD</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Baud rate
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_DATABITS"></a><a id="sp_databits"></a><dl>
     * <dt><b>SP_DATABITS</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_HANDSHAKING"></a><a id="sp_handshaking"></a><dl>
     * <dt><b>SP_HANDSHAKING</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Handshaking (flow control)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PARITY"></a><a id="sp_parity"></a><dl>
     * <dt><b>SP_PARITY</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parity
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PARITY_CHECK"></a><a id="sp_parity_check"></a><dl>
     * <dt><b>SP_PARITY_CHECK</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parity checking
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_RLSD"></a><a id="sp_rlsd"></a><dl>
     * <dt><b>SP_RLSD</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RLSD (receive-line-signal-detect)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_STOPBITS"></a><a id="sp_stopbits"></a><dl>
     * <dt><b>SP_STOPBITS</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stop bits
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSettableParams {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The baud rates that can be used. For values, see the <b>dwMaxBaud</b> member.
     * @type {Integer}
     */
    dwSettableBaud {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A bitmask indicating the number of data bits that can be set. This member can be a combination of the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_5"></a><a id="databits_5"></a><dl>
     * <dt><b>DATABITS_5</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 5 data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_6"></a><a id="databits_6"></a><dl>
     * <dt><b>DATABITS_6</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 6 data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_7"></a><a id="databits_7"></a><dl>
     * <dt><b>DATABITS_7</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 7 data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_8"></a><a id="databits_8"></a><dl>
     * <dt><b>DATABITS_8</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 8 data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_16"></a><a id="databits_16"></a><dl>
     * <dt><b>DATABITS_16</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 16 data bits
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DATABITS_16X"></a><a id="databits_16x"></a><dl>
     * <dt><b>DATABITS_16X</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Special wide path through serial hardware lines
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wSettableData {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * A bitmask indicating the stop bit and parity settings that can be selected. This member can be a
     * @type {Integer}
     */
    wSettableStopParity {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * The size of the driver's internal output buffer, in bytes. A value of zero indicates that the value is 
     *       unavailable.
     * @type {Integer}
     */
    dwCurrentTxQueue {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The size of the driver's internal input buffer, in bytes. A value of zero indicates that the value is 
     *       unavailable.
     * @type {Integer}
     */
    dwCurrentRxQueue {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Any provider-specific data. Applications should ignore this member unless they have detailed information 
     *        about the format of the data required by the provider.
     * 
     * Set this member to <b>COMMPROP_INITIALIZED</b> before calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommproperties">GetCommProperties</a> function to indicate that the 
     *        <b>wPacketLength</b> member is already valid.
     * @type {Integer}
     */
    dwProvSpec1 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Any provider-specific data. Applications should ignore this member unless they have detailed information 
     *       about the format of the data required by the provider.
     * @type {Integer}
     */
    dwProvSpec2 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Any provider-specific data. Applications should ignore this member unless they have detailed information 
     *       about the format of the data required by the provider.
     * @type {String}
     */
    wcProvChar {
        get => StrGet(this.ptr + 60, 0, "UTF-16")
        set => StrPut(value, this.ptr + 60, 0, "UTF-16")
    }
}
