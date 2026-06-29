#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains an HTTP header.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ns-websocket-web_socket_http_header
 * @namespace Windows.Win32.Networking.WebSocket
 */
export default struct WEB_SOCKET_HTTP_HEADER {
    #StructPack 8

    /**
     * Type: <b>PCHAR</b>
     * 
     * A pointer to the HTTP header name. The name must not  contain a colon character.
     */
    pcName : PSTR

    /**
     * Type: <b>ULONG</b>
     * 
     * Length, in characters,  of the HTTP header pointed to by <b>pcName</b>.
     */
    ulNameLength : UInt32

    /**
     * Type: <b>PCHAR</b>
     * 
     * A pointer to the HTTP header value.
     */
    pcValue : PSTR

    /**
     * Type: <b>ULONG</b>
     * 
     * Length, in characters,  of the HTTP value pointed to by <b>pcValue</b>.
     */
    ulValueLength : UInt32

}
