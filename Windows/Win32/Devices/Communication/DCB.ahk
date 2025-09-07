#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the control setting for a serial communications device.
 * @remarks
 * When a <b>DCB</b> structure is used to configure the 8250, the 
  *     following restrictions apply to the values specified for the <b>ByteSize</b> and 
  *     <b>StopBits</b> members:
  * 
  * <ul>
  * <li>The number of data bits must be 5 to 8 bits.</li>
  * <li>The use of 5 data bits with 2 stop bits is an invalid combination, as is 6, 7, or 8 data bits with 1.5 stop 
  *       bits.</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-dcb
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class DCB extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The length of the structure, in bytes. The caller must set this member to 
     *       <c>sizeof(DCB)</c>.
     * @type {Integer}
     */
    DCBlength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The baud rate at which the communications device operates. This member can be an actual baud rate value, or 
     *       one of the following indexes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_110"></a><a id="cbr_110"></a><dl>
     * <dt><b>CBR_110</b></dt>
     * <dt>110</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 110 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_300"></a><a id="cbr_300"></a><dl>
     * <dt><b>CBR_300</b></dt>
     * <dt>300</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 300 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_600"></a><a id="cbr_600"></a><dl>
     * <dt><b>CBR_600</b></dt>
     * <dt>600</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_1200"></a><a id="cbr_1200"></a><dl>
     * <dt><b>CBR_1200</b></dt>
     * <dt>1200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 1200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_2400"></a><a id="cbr_2400"></a><dl>
     * <dt><b>CBR_2400</b></dt>
     * <dt>2400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 2400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_4800"></a><a id="cbr_4800"></a><dl>
     * <dt><b>CBR_4800</b></dt>
     * <dt>4800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 4800 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_9600"></a><a id="cbr_9600"></a><dl>
     * <dt><b>CBR_9600</b></dt>
     * <dt>9600</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 9600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_14400"></a><a id="cbr_14400"></a><dl>
     * <dt><b>CBR_14400</b></dt>
     * <dt>14400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 14400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_19200"></a><a id="cbr_19200"></a><dl>
     * <dt><b>CBR_19200</b></dt>
     * <dt>19200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 19200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_38400"></a><a id="cbr_38400"></a><dl>
     * <dt><b>CBR_38400</b></dt>
     * <dt>38400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  38400 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_57600"></a><a id="cbr_57600"></a><dl>
     * <dt><b>CBR_57600</b></dt>
     * <dt>57600</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 57600 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_115200"></a><a id="cbr_115200"></a><dl>
     * <dt><b>CBR_115200</b></dt>
     * <dt>115200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 115200 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_128000"></a><a id="cbr_128000"></a><dl>
     * <dt><b>CBR_128000</b></dt>
     * <dt>128000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128000 bps
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CBR_256000"></a><a id="cbr_256000"></a><dl>
     * <dt><b>CBR_256000</b></dt>
     * <dt>256000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 256000 bps
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    BaudRate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The minimum number of bytes in use allowed in the input buffer before flow control is activated to allow 
     *       transmission by the sender. This assumes that either XON/XOFF, RTS, or DTR input flow control is specified in 
     *       the <b>fInX</b>, <b>fRtsControl</b>, or 
     *       <b>fDtrControl</b> members.
     * @type {Integer}
     */
    XonLim {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * The minimum number of free bytes allowed in the input buffer before flow control is activated to inhibit 
     *       the sender. Note that the sender may transmit characters after the flow control signal has been activated, so 
     *       this value should never be zero. This assumes that either XON/XOFF, RTS, or DTR input flow control is specified 
     *       in the <b>fInX</b>, <b>fRtsControl</b>, or 
     *       <b>fDtrControl</b> members. The maximum number of bytes in use allowed is calculated by 
     *       subtracting this value from the size, in bytes, of the input buffer.
     * @type {Integer}
     */
    XoffLim {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The number of bits in the bytes transmitted and received.
     * @type {Integer}
     */
    ByteSize {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * 
     * @type {Integer}
     */
    Parity {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * 
     * @type {Integer}
     */
    StopBits {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * The value of the XON character for both transmission and reception.
     * @type {Integer}
     */
    XonChar {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * The value of the XOFF character for both transmission and reception.
     * @type {Integer}
     */
    XoffChar {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * The value of the character used to replace bytes received with a parity error.
     * @type {Integer}
     */
    ErrorChar {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * The value of the character used to signal the end of data.
     * @type {Integer}
     */
    EofChar {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * The value of the character used to signal an event.
     * @type {Integer}
     */
    EvtChar {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
