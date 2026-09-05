#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the protocol stack to use for the channel.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_channel_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_CHANNEL_BINDING extends Win32Enum {

    /**
     * SOAP over HTTP.
     * Native name: WS_HTTP_CHANNEL_BINDING
     * @type {Integer (Int32)}
     */
    static HTTP_CHANNEL_BINDING => 0

    /**
     * SOAP over TCP.
     * Native name: WS_TCP_CHANNEL_BINDING
     * @type {Integer (Int32)}
     */
    static TCP_CHANNEL_BINDING => 1

    /**
     * SOAP over UDP.
     * Native name: WS_UDP_CHANNEL_BINDING
     * @type {Integer (Int32)}
     */
    static UDP_CHANNEL_BINDING => 2

    /**
     * A custom channel or listen implementation. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_channel_callbacks">WS_CUSTOM_CHANNEL_CALLBACKS</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_listener_callbacks">WS_CUSTOM_LISTENER_CALLBACKS</a>.
     * Native name: WS_CUSTOM_CHANNEL_BINDING
     * @type {Integer (Int32)}
     */
    static CUSTOM_CHANNEL_BINDING => 3

    /**
     * Windows 8 or later:
     *                     SOAP over named pipes.
     * Native name: WS_NAMEDPIPE_CHANNEL_BINDING
     * @type {Integer (Int32)}
     */
    static NAMEDPIPE_CHANNEL_BINDING => 4
}
