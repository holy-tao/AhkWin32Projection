#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WINHTTP_WEB_SOCKET_BUFFER_TYPE enumeration includes types of WebSocket buffers.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_WEB_SOCKET_BUFFER_TYPE{

    /**
     * Buffer contains either the entire binary message or the last part of it.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE => 0

    /**
     * Buffer contains only part of a binary message.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE => 1

    /**
     * Buffer contains either the entire UTF-8 message or the last part of it.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE => 2

    /**
     * Buffer contains only part of a UTF-8 message.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE => 3

    /**
     * The server sent a close frame.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE => 4
}
