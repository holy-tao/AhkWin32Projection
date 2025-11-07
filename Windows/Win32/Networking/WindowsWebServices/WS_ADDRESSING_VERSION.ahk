#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the version of the specification used for the addressing headers.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_addressing_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ADDRESSING_VERSION{

    /**
     * The message addressing headers correspond to version 0.9 (August 2004)
     *                     of the addressing specification <a href="https://www.w3.org/Submission/ws-addressing/">Web Services Addressing (WS-Addressing)</a>.
     * @type {Integer (Int32)}
     */
    static WS_ADDRESSING_VERSION_0_9 => 1

    /**
     * The message addressing headers correspond to version 1.0 (May 2006)
     *                     of the addressing specification <a href="https://www.w3.org/TR/ws-addr-core/">Web Services Addressing 1.0 - Core</a>.
     * @type {Integer (Int32)}
     */
    static WS_ADDRESSING_VERSION_1_0 => 2

    /**
     * This addressing version indicates that the only addressing headers
     *                     supported are those that are natively supported by the underlying
     *                     transport (there are no addressing-related headers that are transmitted
     *                     as part of the SOAP envelope).
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_ACTION_HEADER</a> and <b>WS_TO_HEADER</b> are
     *                     automatically mapped to/from the transport-specific message locations
     *                     when messages are sent/received.  Use of other <b>WS_HEADER_TYPE</b>are not supported for this addressing version.
     *                 
     * 
     * This addressing version is only supported for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>.
     *                     Since the SOAP over HTTP protocol does not support sending an action on a reply,
     *                     the value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_ACTION_HEADER</a> will not be transmitted by the channel.
     * @type {Integer (Int32)}
     */
    static WS_ADDRESSING_VERSION_TRANSPORT => 3
}
