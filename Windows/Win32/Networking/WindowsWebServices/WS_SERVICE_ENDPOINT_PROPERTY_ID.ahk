#Requires AutoHotkey v2.0.0 64-bit

/**
 * Each property represents optional parameters for configuring the given WS_SERVICE_ENDPOINT structure. This enumeration is used within the WS_SERVICE_ENDPOINT_PROPERTY structure that is part of WS_SERVICE_ENDPOINT.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_service_endpoint_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_ENDPOINT_PROPERTY_ID{

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>.
     *                     The value is a pointer to WS_SERVICE_PROPERTY_ACCEPT_CALLBACK structure.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_ACCEPT_CHANNEL_CALLBACK => 0

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>.
     *                     The value is a pointer to WS_SERVICE_PROPERTY_CLOSE_CALLBACK structure.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_CLOSE_CHANNEL_CALLBACK => 1

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>, this specifies the maximum number of concurrent channels service host will have 
     *                     actively accepting new connections for a given endpoint.                     When not specified this value is set to 1. If an endpoint specifies a default message handler (See <b>WS_SERVICE_ENDPOINT</b>) concurrency 
     *                     has to be 1.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_ACCEPTING_CHANNELS => 2

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>, this specifies the maximum number of concurrent calls that would be serviced on a session based channel.
     *                     When not specified this value is set to 1. If an endpoint specifies a default message handler (See <b>WS_SERVICE_ENDPOINT</b> concurrency 
     *                     has to be 1.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_CONCURRENCY => 3

    /**
     * Maximum <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">heap</a> size for body deserialization.
     *                 
     * 
     * This is the heap available setting used for deserializing the body. This heap is also 
     *                     available to service operations for allocating out parameters.
     *                 
     * 
     * Default is 65535 bytes.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_MAX_SIZE => 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">Heap</a> trim size for body deserialization.
     *                 
     * 
     * This is the heap available setting used for deserializing the body. This heap is also 
     *                     available to service operations for allocating out parameters.
     *                 
     * 
     * Default is 4096 bytes.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_TRIM_SIZE => 5

    /**
     * This property allows the user to specify properties of the message
     *                     objects used by the endpoint to send and receive messages.
     *                 
     * 
     * This property may be specified when the service host is created.
     *                 
     * 
     * The value specified should be of type <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_properties">WS_MESSAGE_PROPERTIES</a>.
     *                 
     * 
     * The following message properties may be specified:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_HEAP_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_XML_READER_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_XML_WRITER_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_MAX_PROCESSED_HEADERS</a>
     * </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MESSAGE_PROPERTIES => 6

    /**
     * The maximum number of call servicing objects that would be pooled to service a message object, on a given
     *                     endpoint. Note that in case of session based channels many call objects can be used on a single 
     *                                         channel if <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_property">WS_SERVICE_ENDPOINT_PROPERTY_MAX_CONCURRENCY</a> is greater than 1. 
     * 
     * 
     * For sessionless channels this property should ideally be equal to <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_property">WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNEL_POOL_SIZE</a>.
     *                 
     * 
     * Default is 100.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_CALL_POOL_SIZE => 7

    /**
     * The maximum number of <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> which will be pooled by Service Host on a given
     *                     endpoint.
     *                 
     * 
     * Default is 100.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNEL_POOL_SIZE => 8

    /**
     * Listener properties.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_LISTENER_PROPERTIES => 9

    /**
     * Enables or disables must understand header verification on an endpoint. This is 'TRUE' by default.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_CHECK_MUST_UNDERSTAND => 10

    /**
     * This property can be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_exchange_type">WS_METADATA_EXCHANGE_TYPE_MEX</a> to enable 
     *                     servicing of WS-MetadataExchange requests on the endpoint. In case the application wishes to 
     *                     expose metadata through HTTP GET, this property can be set to <b>WS_METADATA_EXCHANGE_TYPE_HTTP_GET</b>
     * 
     * If not specified, the default value of this property is '<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_exchange_type">WS_METADATA_EXCHANGE_TYPE_NONE</a>'. 
     *                 
     * 
     * Note that this property when set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_exchange_type">WS_METADATA_EXCHANGE_TYPE_HTTP_GET</a> changes the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> property 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS</a> and
     *                     <b>WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS</b> to <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_MATCH_URL_PREFIX_PATH</a>. 
     *                 
     * 
     * When setting this property to WS_METADATA_EXCHANGE_TYPE_HTTP_GET an application must not specify <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_MATCH_URL_EXACT_PATH</a> for the listener 
     *                     properties <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS</a> and <b>WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS</b>for the given <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE => 11

    /**
     * Specifies the WSDL port name, binding name and binding namespace for the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">endpoint</a>. 
     *                 
     * 
     * This property must be specified to enable the participation of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> in WS-Metadata Exchange.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_metadata">WS_SERVICE_ENDPOINT_METADATA</a> for more details.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_METADATA => 12

    /**
     * Specifies the suffix which is concatenated as is to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> URL to generate a URL for WS-MetadataExchange v1.1 requests servicing. 
     *                     The generated URL is used to compare against the 'to' header of the message received. Note that if the message does not contain a 'to' header the requests is not
     *                     serviced. 
     *                 
     * 
     * This property must only be specified if <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_property">WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE</a> is set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_exchange_type">WS_METADATA_EXCHANGE_TYPE_MEX</a>.
     *                 
     * 
     * Specifying this property is useful in cases where an application wishes to handle WS-Transfer Get requests as well as use the same endpoint to service 
     *                     WS-MetadataExchange v1.1 requests. The generate URL in this case is used to filter out WS-Transfer Get requests for Ws-MetadataExchange v1.1. 
     *                 
     * 
     * By default no filtering is done for WS-MetadataExchange v1.1 for MEX and all WS-Transfer GET requests will be handled by the endpoint for Ws-MetadataExchange v1.1, if 
     *                     Ws-MetadataExchange v1.1 is enabled on the endpoint.
     *                 
     * 
     * Note that this property changes the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> property <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS</a> and
     *                     <b>WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS</b> to <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_MATCH_URL_PREFIX_PATH</a>. 
     *                 
     * 
     * When setting this property an application must not specify <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_buffer_property_id">WS_MATCH_URL_EXACT_PATH</a> for the listener 
     *                     properties <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS</a> and <b>WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS</b> 
     *                     for the given <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a>.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_URL_SUFFIX => 13

    /**
     * The maximum number of channels that can be serviced on the endpoint.
     *                 
     * 
     * The default value is 100.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNELS => 14

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNELS_PER_IP => 15
}
