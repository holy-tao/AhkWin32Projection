#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a portion of a registered buffer used for sending or receiving network data with the Winsock registered I/O extensions.
 * @remarks
 * The Winsock registered I/O extensions often operate on portions of registered buffers sometimes called buffer slices. The <b>RIO_BUF</b> structure is used by an application that needs to use a small amount of registered memory for sending or receiving network data. The application can often increase performance by registering one large buffer and then using small chunks of the buffer as needed. The <b>RIO_BUF</b> structure may describe any contiguous segment of memory contained in a single buffer registration.
 * 
 * A pointer to a <b>RIO_BUF</b> structure is passed as the <i>pData</i> parameter to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riosend">RIOSend</a>,  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437216(v=vs.85)">RIOSendEx</a>, <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceive">RIOReceive</a>, and <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceiveex">RIOReceiveEx</a> functions to send or receive network data.
 * 
 * An application cannot resize a registered buffer simply by using a buffer slice with values larger than the original buffer that was registered using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437199(v=vs.85)">RIORegisterBuffer</a> function.
 * 
 * The <b>RIO_BUF</b> structure is defined in the <i>Mswsockdef.h</i> header file which is automatically included in the <i>Mswsock.h</i> header file. The <i>Mswsockdef.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/mswsockdef/ns-mswsockdef-rio_buf
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RIO_BUF extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The registered buffer descriptor for a Winsock registered I/O buffer used with send and receive requests.
     * @type {RIO_BUFFERID}
     */
    BufferId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The offset, in bytes, into the buffer specified by the <b>BufferId</b> member. An <b>Offset</b> value of zero points to the beginning of the buffer
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A length, in bytes, of the buffer to use from the <b>Offset</b> member.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
