#Requires AutoHotkey v2.0.0 64-bit

/**
 * Optional parameters for configuring a call on a client side service operation.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_call_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CALL_PROPERTY_ID{

    /**
     * An application can suppress or enable must understand header processing 
     *                     on the proxy using this setting. This is <b>TRUE</b> by default.
     * @type {Integer (Int32)}
     */
    static WS_CALL_PROPERTY_CHECK_MUST_UNDERSTAND => 0

    /**
     * Enables an application to put headers into the input message for a given call.
     * @type {Integer (Int32)}
     */
    static WS_CALL_PROPERTY_SEND_MESSAGE_CONTEXT => 1

    /**
     * Enables an application to extract headers from the output message for a given call.
     * @type {Integer (Int32)}
     */
    static WS_CALL_PROPERTY_RECEIVE_MESSAGE_CONTEXT => 2

    /**
     * On a <a href="https://docs.microsoft.com/windows/desktop/wsw/service-operation">service operation</a> an application can use the call id property to uniquely identify 
     *                     a service operation function all on a channel. This ID can be passed on to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabandoncall">WsAbandonCall</a> along with the
     *                     service proxy to abandon the call.
     *                 
     * 
     * For more information about abandoning calls see <a href="https://docs.microsoft.com/windows/desktop/wsw/client-side-service-operations">service operation</a>.
     * @type {Integer (Int32)}
     */
    static WS_CALL_PROPERTY_CALL_ID => 3
}
