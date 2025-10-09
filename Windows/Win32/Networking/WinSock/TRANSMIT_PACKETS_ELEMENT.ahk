#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a single data element to be transmitted by the TransmitPackets function.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/ns-mswsock-transmit_packets_element
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TRANSMIT_PACKETS_ELEMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Flags used to describe the contents of the packet array element, and to customize 
     * <b>TransmitPackets</b> function processing. The following table lists valid flags:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TP_ELEMENT_FILE"></a><a id="tp_element_file"></a><dl>
     * <dt><b>TP_ELEMENT_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that data resides in a file. Default setting for <b>dwElFlags</b>. Mutually exclusive with TP_ELEMENT_MEMORY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TP_ELEMENT_MEMORY"></a><a id="tp_element_memory"></a><dl>
     * <dt><b>TP_ELEMENT_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that data resides in memory. Mutually exclusive with TP_ELEMENT_FILE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TP_ELEMENT_EOP"></a><a id="tp_element_eop"></a><dl>
     * <dt><b>TP_ELEMENT_EOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that this element should not be combined with the next element in a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-send">send</a> request from the sockets layer to the transport. This flag is used for granular control of the content of each message on a datagram or message-oriented socket.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwElFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of bytes to transmit. If zero, the entire file is transmitted.
     * @type {Integer}
     */
    cLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    nFileOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    hFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    pBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
