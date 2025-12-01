#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Each listener property is of type WS_LISTENER_PROPERTY, is identified by an ID, and has an associated value. If a property is not specified when the listener is created, then its default value is used.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_listener_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_LISTENER_PROPERTY_ID extends Win32Enum{

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a>.  
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>ULONG</b>.
     * 
     * This controls the maximum length of the queue of pending connections. If set to 
     *                     SOMAXCONN, the backlog will be set to a maximum reasonable value.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_LISTEN_BACKLOG => 0

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> or <b>WS_UDP_CHANNEL_BINDING</b>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_ip_version">WS_IP_VERSION</a> value.
     * 
     * This property specifies which IP version that the listener should use.
     *                 
     * 
     * The default value is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_ip_version">WS_IP_VERSION_AUTO</a>.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_IP_VERSION => 1

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for all channel types.
     *                     
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a> value.
     * 
     * Returns the current <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a> of the listener.  The returned value is a snapshot of the current state, so it is
     *                     possible that the state may have changed before the caller has
     *                     had a chance to examine the value.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_STATE => 2

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for all channel types.
     *                     
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_CALLBACK_MODEL</a> value.
     * 
     * This value indicates the preferred async callback model when issuing
     *                     async operations for the listener or channels that are created for it
     *                     using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>.
     *                 
     * 
     * The default is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_LONG_CALLBACK</a>. 
     *                 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> only supports <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_LONG_CALLBACK</a> as an acceptable value
     *                     for this property.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_ASYNC_CALLBACK_MODEL => 3

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for all channel types.  
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> value.
     * 
     * This property
     *                     specifies the message exchange pattern of the channel being used.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CHANNEL_TYPE => 4

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for all channel types.  
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> value.
     * 
     * This property
     *                     specifies the binding of the channel being used.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CHANNEL_BINDING => 5

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> and   <b>WS_NAMEDPIPE_CHANNEL_BINDING</b>.
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>ULONG</b>.
     * 
     * An accept operation will wait
     *                     for an infinite amount of time to accept the underlying TCP socket or named pipe.  This
     *                     timeout corresponds to the amount of time dedicated to the net.tcp or net.pipe handshake
     *                     that takes place between the client and service once the client connects.
     *                     The timeout value is in milliseconds, where the value INFINITE indicates
     *                     no timeout.  Use the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CONNECT_TIMEOUT</a> to set the corresponding
     *                     value on the client side.
     *                 
     * 
     * The default value is 15000 (15 seconds).
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CONNECT_TIMEOUT => 6

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_DUPLEX</a> to indicate that the listener is listening on a multicast address.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>BOOL</b>.
     * 
     * Note that setting this property is not sufficient when listening on
     *                     a multicast address.  The set of interfaces must also be specified
     *                     using the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_MULTICAST_INTERFACES</a> property.
     *                 
     * 
     * The channel does not validate that the address is in fact a
     *                     a multicast address, but it sets the reuse of the socket 
     *                     such that another process can also open the same port.
     *                 
     * 
     * The default value is <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_IS_MULTICAST => 7

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetlistenerproperty">WsSetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_DUPLEX</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is an array of <b>ULONG</b> values.
     * 
     * The size of the property
     *                     is sizeof(ULONG) multiplied by the number of values.  Each value represents
     *                     the interface index of an adapter.  The indices of adapters can be
     *                     obtained using the GetAdaptersAddresses function.
     *                 
     * 
     * This value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_IS_MULTICAST</a> 
     *                     property must be <b>TRUE</b> in order to use this property.
     *                 
     * 
     * The default value is an empty list (no interfaces).
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_MULTICAST_INTERFACES => 8

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a> 
     *                     with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_DUPLEX</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>BOOL</b>.
     * 
     * This indicates whether or not messages
     *                     sent on the loopback interface are received by this channel.  If <b>TRUE</b>,
     *                     then messages are received (otherwise, they will not be seen by the channel).
     *                 
     * 
     * This value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_IS_MULTICAST</a> 
     *                     property must be <b>TRUE</b> in order to use this property.
     *                 
     * 
     * The default value is <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_MULTICAST_LOOPBACK => 9

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_REPLY</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>ULONG</b>.
     * 
     * This indicates the number of milliseconds to
     *                     wait for clients to receive data from responses when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloselistener">WsCloseListener</a> is called.
     *                 
     * 
     * The purpose of this timeout is to allow clients time to continue receiving 
     *                     data from HTTP responses sent by the server before the HTTP server disconnects
     *                     the client connections.
     *                 
     * 
     * The calculation of the timeout value used is as follows:
     *                 
     * 
     * <ul>
     * <li>At the time that <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloselistener">WsCloseListener</a> is called, determine the
     *                     time the last response was sent (the last response time).  For the purposes of
     *                     this timeout calculation, a response is recorded as sent once <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a> has been called for the response.  
     *                     </li>
     * <li>Calculate the difference between the current time and the last response time.
     *                     </li>
     * <li>If the difference is more than the timeout value, then the actual
     *                     timeout used is zero.
     *                     </li>
     * <li>If the difference is less than or equal to the timeout value, then the
     *                     actual timeout used is the timeout value minus the difference.
     *                 </li>
     * </ul>
     * The default timeout value is 5000 (5 seconds).
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CLOSE_TIMEOUT => 10

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a>,
     *                     <b>WS_HTTP_CHANNEL_BINDING</b>, <b>WS_UDP_CHANNEL_BINDING</b>, or <b>WS_NAMEDPIPE_CHANNEL_BINDING</b>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>ULONG</b>.
     * 
     * The property value contains a set of flags (see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_URL_MATCHING_OPTIONS</a>) which
     *                     specify how to match the URL in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_TO_HEADER</a> of any received messages.
     *                 
     * 
     * The default value is:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WS_MATCH_URL_THIS_HOST |
     * WS_MATCH_URL_EXACT_PATH |
     * WS_MATCH_URL_PORT |
     * WS_MATCH_URL_NO_QUERY
     * 
     * ```
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS => 11

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a> or
     *                     <b>WS_HTTP_CHANNEL_BINDING</b>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a <b>ULONG</b>.
     * 
     * The property value contains a set of flags (see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_URL_MATCHING_OPTIONS</a>) which
     *                     specify how to match the transport URL of any accepted channels.  See
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_TRANSPORT_URL</a> for more information on the transport URL.
     *                 
     * 
     * The default value is:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * WS_MATCH_URL_THIS_HOST |
     * WS_MATCH_URL_EXACT_PATH |
     * WS_MATCH_URL_PORT |
     * WS_MATCH_URL_NO_QUERY
     * 
     * ```
     * 
     * This property only controls the verification of the message once it has been received
     *                     by the process, not the routing of the message to the process (which is determined
     *                     by the URL passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenlistener">WsOpenListener</a>).
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS => 12

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CUSTOM_CHANNEL_BINDING</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_listener_callbacks">WS_LISTENER_PROPERTY</a> structure is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_listener_callbacks">WS_CUSTOM_LISTENER_CALLBACKS</a> structure.
     * 
     * This property is used to specify callbacks that
     *                     define the implementation of a custom listener.
     *                 
     * 
     * This property must be specified when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CUSTOM_CHANNEL_BINDING</a> is used.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CUSTOM_LISTENER_CALLBACKS => 13

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CUSTOM_CHANNEL_BINDING</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a pointer to an arbitrary sized data type.
     *                     The size of the property is the size of the data type.
     *                 
     * 
     * This property is used to specify parameters used to create the custom
     *                     listener implementation.
     *                 
     * 
     * The value of this property will be passed to the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a>.
     *                 
     * 
     * If this property is not specified, its value is <b>NULL</b> and size is zero.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS => 14

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetchannelproperty">WsGetChannelProperty</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CUSTOM_CHANNEL_BINDING</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure is a void* and size the property is sizeof(void*).  
     * 
     * The value 
     *                     corresponds to the listenerInstance value returned by the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a>.
     *                 
     * 
     * This property can be used to obtain the underlying listener
     *                     instance for a custom listener.  This allows a caller to directly
     *                     interact with the instance for cases when the existing
     *                     set of listener properties or listener functions is insufficient.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_CUSTOM_LISTENER_INSTANCE => 15

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a> for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>.
     *                 
     * 
     * The accompanying <b>value</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_disallowed_user_agent_substrings">WS_LISTENER_PROPERTY</a> structure is a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_disallowed_user_agent_substrings">WS_DISALLOWED_USER_AGENT_SUBSTRINGS</a> which specifies the list of disallowed user
     *                     agents sub-strings.
     *                     <ul>
     * <li>Upon receiving the HTTP request, the UserAgent header value is extracted.
     *                         </li>
     * <li>Each sub-string in the list, is searched in the extracted UserAgent string value.
     *                         </li>
     * <li>If the substring is found the request is rejected.
     *                     </li>
     * </ul>
     * 
     * 
     * The list by default contains the following entry
     *                     <ul>
     * <li>Web Browser(s): Mozilla
     *                     </li>
     * </ul>
     * 
     * 
     * This property does not apply to listeners configured with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_encoding">WS_ENCODING_RAW</a> encoding.
     * @type {Integer (Int32)}
     */
    static WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT => 16
}
