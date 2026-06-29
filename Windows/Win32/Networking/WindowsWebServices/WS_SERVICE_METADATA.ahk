#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_SERVICE_METADATA_DOCUMENT.ahk" { WS_SERVICE_METADATA_DOCUMENT }

/**
 * Specifies the service metadata documents array. This can be a collection of WSDL/XSD documents represented as an array of WS_STRING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_metadata
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_METADATA {
    #StructPack 8

    /**
     * The count of metadata documents being specified.
     */
    documentCount : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_metadata_document">WS_SERVICE_METADATA_DOCUMENT</a>* array where element represents a WS_SERVICE_METADATA_DOCUMENT for each individual XML Schema, WSDL or a Policy document. 
     *                 The service model expects this to be valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    documents : IntPtr

    /**
     * Reference to WS_XML_STRING representing the name of the service in the WSDL document. Note that this field must be specified along with the serviceNs field. The service model expects this to be valid for the lifetime 
     *                     of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    serviceName : WS_XML_STRING.Ptr

    /**
     * Reference to WS_XML_STRING representing the namespace of the service in the WSDL document. Note that this field must be specified along with the serviceName field.
     *                 The service model expects this to be valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    serviceNs : WS_XML_STRING.Ptr

}
