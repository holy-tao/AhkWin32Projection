#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the protocol stack to use for the channel.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_channel_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CHANNEL_BINDING{

    /**
     * SOAP over HTTP.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_CHANNEL_BINDING => 0

    /**
     * SOAP over TCP.
     * @type {Integer (Int32)}
     */
    static WS_TCP_CHANNEL_BINDING => 1

    /**
     * SOAP over UDP.
     * @type {Integer (Int32)}
     */
    static WS_UDP_CHANNEL_BINDING => 2

    /**
     * A custom channel or listen implementation. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_channel_callbacks">WS_CUSTOM_CHANNEL_CALLBACKS</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_listener_callbacks">WS_CUSTOM_LISTENER_CALLBACKS</a>.
     * @type {Integer (Int32)}
     */
    static WS_CUSTOM_CHANNEL_BINDING => 3

    /**
     * Windows 8 or later:
 *                     SOAP over named pipes.
     * @type {Integer (Int32)}
     */
    static WS_NAMEDPIPE_CHANNEL_BINDING => 4
}
