#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the basic characteristics of the channel, such as whether it is sessionful, and what directions of communication are supported.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_channel_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CHANNEL_TYPE extends Win32Enum{

    /**
     * Input channels support Receive operations.  They are used on the sender side.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a> supports this channel type
     *                     when used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_INPUT => 1

    /**
     * Output channels support Send operations.
     *                 
     * 
     * This channel type is not currently supported by any channel bindings.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_OUTPUT => 2

    /**
     * Sessionful channels provide channel-level correlation of all messages sent or received.
     *                 
     * 
     * This is a flag used to build <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_INPUT_SESSION</a>,
     *                     <b>WS_CHANNEL_TYPE_OUTPUT_SESSION</b>, and <b>WS_CHANNEL_TYPE_DUPLEX_SESSION</b>,
     *                     but cannot be used alone.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_SESSION => 4

    /**
     * An input channel that supports a session.
     *                 
     * 
     * This channel type is not currently supported by any channel bindings.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_INPUT_SESSION => 5

    /**
     * An output channel that supports a session.
     *                 
     * 
     * This channel type is not currently supported by any channel bindings.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_OUTPUT_SESSION => 6

    /**
     * An input/output channel.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a> supports this channel type
     *                     when used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a>.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_DUPLEX => 3

    /**
     * An input/output channel that supports a session.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> supports this channel type when
     *                     used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_DUPLEX_SESSION => 7

    /**
     * Request channels support Send followed by Receive.  They are used on the client 
     *                     side for channels that support request-reply operations.
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> supports this channel type when
     *                     used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a>.
     *                 
     * 
     * Note that request channels provide built-in correlation of request replies.
     *                     It is possible to do request-reply correlation on other channel types using the
     *                     addressing headers (RelatesTo and MessageID).
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_REQUEST => 8

    /**
     * Reply channels support Receive followed by Send.  They are used on the service
     *                     side for channels that support request-reply operations (for example, HTTP).
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> supports this channel type when
     *                     used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     *                 
     * 
     * Note that reply channels provide built-in correlation of request replies.
     *                     It is possible to do request-reply correlation on other channel types using the
     *                     addressing headers (RelatesTo and MessageID).
     * @type {Integer (Int32)}
     */
    static WS_CHANNEL_TYPE_REPLY => 16
}
