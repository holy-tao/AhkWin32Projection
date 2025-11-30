#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The optional parameters for configuring the service host. This enumeration is used within the WS_SERVICE_PROPERTY structure when calling WsCreateServiceHost or by itself when calling WsGetServiceHostProperty.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_service_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_PROPERTY_ID extends Win32Enum{

    /**
     * A void pointer
     *                     used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a>. This property 
     *                     is made available to different callbacks and service operations as part of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-operation-context">WS_OPERATION_CONTEXT</a> structure
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_HOST_USER_STATE => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_disclosure">WS_FAULT_DISCLOSURE</a> value used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a>.
     *                     This property is used to specify the disclosure level of the error object when its converted into a fault. The default is <b>WS_MINIMAL_FAULT_DISCLOSURE</b>.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_FAULT_DISCLOSURE => 1

    /**
     * A LANGID used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetservicehostproperty">WsGetServiceHostProperty</a> to create a fault. If none is specified, the default user locale will be used.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_FAULT_LANGID => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_host_state">WS_SERVICE_HOST_STATE</a> value  used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetservicehostproperty">WsGetServiceHostProperty</a> that specifies the current state of the service host.
     *                 
     * 
     * The returned value is a snapshot of the current state, so it is
     *                     possible that the state may have changed before the caller has
     *                     had a chance to examine the value.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_HOST_STATE => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_metadata">WS_SERVICE_METADATA</a> structure used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> that contains the collection of metadata documents used for WS-MetadataExchange by the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     * 
     * The service name and namespace are used to create a service element inside the WSDL document. The document is identified by means of the service namespace provided as part of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_metadata">WS_SERVICE_METADATA</a> structure.
     * 
     *  
     * Note that if a service section is already defined in any of the provided WSDL documents, a service element will not be added on behalf of the application by the runtime.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_METADATA => 4

    /**
     * A <b>ULONG</b> used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> that specifies the maximum amount of time a service model will wait after <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloseservicehost">WsCloseServiceHost</a> is called. Once the timeout expires service host will abort itself. 
     * The default is 5 seconds specified in milliseconds as 5000.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROPERTY_CLOSE_TIMEOUT => 5
}
