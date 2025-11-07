#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_WEB_SOCKET_STATUS enumeration includes the status of a WebSocket operation.
 * @remarks
 * 
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</b>.
 * 
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE</b>.
 * 
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_CLOSE_COMPLETE</b>.
 * 
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_SHUTDOWN_COMPLETE</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_web_socket_status
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_WEB_SOCKET_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of bytes transferred in the operation.
     * @type {Integer}
     */
    dwBytesTransferred {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a></b>
     * 
     * The type of data in the buffer.
     * @type {Integer}
     */
    eBufferType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
