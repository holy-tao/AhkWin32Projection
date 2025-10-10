#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the bit values used to construct the WebSocket frame header.
 * @remarks
 * 
  * Please note that the *FRAGMENT* and *MESSAGE* buffer types may not correspond to how the message appears (or is framed) on the wire. For example, when a single unfragmented 1000-byte message is received, WebSocket.dll may return multiple *FRAGMENT* buffer types followed by a single *MESSAGE* buffer type (with the sizes adding up to 1000).
  * 
  * Extension WebSocket frame headers (allowing reserved bits to be set by extensions) may be constructed by setting the high bit (MSB) and low bit (LSB) to 0. The remaining 9 lowest bits can then be used to form the custom frame header in place of the <b>WEB_SOCKET_BUFFER_TYPE</b> enumeration values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//websocket/ne-websocket-web_socket_buffer_type
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_BUFFER_TYPE{

    /**
     * Indicates the buffer contains the last, and possibly only, part of a UTF8 message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE => -2147483648

    /**
     * Indicates the buffer contains part of a UTF8 message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE => -2147483647

    /**
     * Indicates the buffer contains the last, and possibly only, part of a binary message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE => -2147483646

    /**
     * Indicates the buffer contains part of a binary message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE => -2147483645

    /**
     * Indicates the buffer contains a close message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_CLOSE_BUFFER_TYPE => -2147483644

    /**
     * Indicates the buffer contains a ping or pong message. When sending, this value means 'ping', when processing received data, this value means 'pong'.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_PING_PONG_BUFFER_TYPE => -2147483643

    /**
     * Indicates the buffer contains an unsolicited pong message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE => -2147483642
}
