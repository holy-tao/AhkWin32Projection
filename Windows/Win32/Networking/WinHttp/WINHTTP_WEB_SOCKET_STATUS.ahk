#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_WEB_SOCKET_BUFFER_TYPE.ahk" { WINHTTP_WEB_SOCKET_BUFFER_TYPE }

/**
 * The WINHTTP_WEB_SOCKET_STATUS enumeration includes the status of a WebSocket operation.
 * @remarks
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_READ_COMPLETE</b>.
 * 
 * A <b>WINHTTP_WEB_SOCKET_STATUS</b> structure is passed to the completion callback of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a> when <i>dwInternetStatus</i>  is <b>WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_web_socket_status
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_WEB_SOCKET_STATUS {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of bytes transferred in the operation.
     */
    dwBytesTransferred : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a></b>
     * 
     * The type of data in the buffer.
     */
    eBufferType : WINHTTP_WEB_SOCKET_BUFFER_TYPE

}
