#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The properties available on the Context. Not all properties may be available at a given point on a context. All context properties are available through WsGetOperationContextProperty.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_operation_context_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_OPERATION_CONTEXT_PROPERTY_ID extends Win32Enum{

    /**
     * This value is a handle to the underlying channel. This property is available to service operations ,
     *                     to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_message_receive_callback">WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> and 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_close_channel_callback">WS_SERVICE_CLOSE_CHANNEL_CALLBACK</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_CHANNEL => 0

    /**
     * The value represents the contract description. This property is available to service operations ,
     *                     to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_message_receive_callback">WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> and 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_close_channel_callback">WS_SERVICE_CLOSE_CHANNEL_CALLBACK</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_CONTRACT_DESCRIPTION => 1

    /**
     * The value is a pointer to the host state specified on the <a href="https://docs.microsoft.com/windows/desktop/wsw/service-host">service host</a> as the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_property_id">WS_SERVICE_PROPERTY_HOST_USER_STATE</a> service property. This property is available to 
     *                      service operations  and to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_message_receive_callback">WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_HOST_USER_STATE => 2

    /**
     * The value is a pointer to the channel state specified through <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a>. This property is 
     *                     available to  service operations and to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_message_receive_callback">WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_CHANNEL_USER_STATE => 3

    /**
     * The value is a pointer to the underlying input message. This property is available to service operations and to the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_message_receive_callback">WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_INPUT_MESSAGE => 4

    /**
     * The value is a pointer to the underlying output message. This property is available only to service operations.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_OUTPUT_MESSAGE => 5

    /**
     * The value is a pointer to the WS_HEAP. This property is available to a service operation. Please see the memory management section in 
     *                     service operations for usage.
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_HEAP => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_LISTENER => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_OPERATION_CONTEXT_PROPERTY_ENDPOINT_ADDRESS => 8
}
