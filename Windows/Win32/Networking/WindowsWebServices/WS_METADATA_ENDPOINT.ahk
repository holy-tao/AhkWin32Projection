#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_ENDPOINT_ADDRESS.ahk" { WS_ENDPOINT_ADDRESS }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }
#Import ".\WS_POLICY.ahk" { WS_POLICY }

/**
 * Information about a single endpoint that was read from metadata documents.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_metadata_endpoint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_METADATA_ENDPOINT {
    #StructPack 8

    /**
     * The address of the endpoint.
     */
    endpointAddress : WS_ENDPOINT_ADDRESS

    /**
     * An opaque handle representing the policy of the endpoint.  
     *                     This handle is good until the metadata object
     *                     is freed or reset.
     */
    endpointPolicy : WS_POLICY.Ptr

    /**
     * The WSDL port name of the endpoint, if available.
     */
    portName : WS_XML_STRING.Ptr

    /**
     * The WSDL service name of the endpoint, if available.
     */
    serviceName : WS_XML_STRING.Ptr

    /**
     * The WSDL service namespace of the endpoint, if available.
     */
    serviceNs : WS_XML_STRING.Ptr

    /**
     * The WSDL binding name of the endpoint, if available.
     */
    bindingName : WS_XML_STRING.Ptr

    /**
     * The WSDL binding namespace of the endpoint, if available.
     */
    bindingNs : WS_XML_STRING.Ptr

    /**
     * The WSDL portType name of the endpoint, if available.
     */
    portTypeName : WS_XML_STRING.Ptr

    /**
     * The WSDL portType namespace of the endpoint, if available.
     */
    portTypeNs : WS_XML_STRING.Ptr

}
