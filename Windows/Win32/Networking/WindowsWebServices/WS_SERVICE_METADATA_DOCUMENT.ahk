#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Specifies the individual documents that make up the service metadata.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_metadata_document
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_METADATA_DOCUMENT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>* representing the specific  XML Schema, WSDL or a Policy document.
     *                     The service model expects this to be valid for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>.
     */
    content : WS_XML_STRING.Ptr

    /**
     * The name of the document which will be suffixed to the URL path on which this document is serviced for HTTP GET support
     *                     for metadata retrieval. Note that this can be set to <b>NULL</b> if the application is only using Ws-MetadataExchange 1.1 for servicing
     *                     metadata request.
     *                 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_endpoint_property_id">WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE</a> service endpoint property to see how to enable HTTP GET support or
     *                     WS-MetadataExchange 1.1 for servicing metadata request.
     */
    name : WS_STRING.Ptr

}
