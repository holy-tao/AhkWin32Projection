#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an HTTP header.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ns-websocket-web_socket_http_header
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_HTTP_HEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>PCHAR</b>
     * 
     * A pointer to the HTTP header name. The name must not  contain a colon character.
     * @type {PSTR}
     */
    pcName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Length, in characters,  of the HTTP header pointed to by <b>pcName</b>.
     * @type {Integer}
     */
    ulNameLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>PCHAR</b>
     * 
     * A pointer to the HTTP header value.
     * @type {PSTR}
     */
    pcValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Length, in characters,  of the HTTP value pointed to by <b>pcValue</b>.
     * @type {Integer}
     */
    ulValueLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
