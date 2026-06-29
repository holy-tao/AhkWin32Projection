#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }

/**
 * Represents the port element for the endpoint. The port element is generated for the service element as specified by serviceName and serviceNs for WS_SERVICE_PROPERTY_METADATA property on the WS_SERVICE_HOST.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_metadata
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_ENDPOINT_METADATA {
    #StructPack 8

    /**
     * The name of the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    portName : WS_XML_STRING.Ptr

    /**
     * Name of the binding associated with the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    bindingName : WS_XML_STRING.Ptr

    /**
     * The namespace of the binding associated with the port. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    bindingNs : WS_XML_STRING.Ptr

}
