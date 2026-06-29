#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }

/**
 * Specifies an individual header that is mapped as part of WS_HTTP_MESSAGE_MAPPING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_mapping
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_HEADER_MAPPING {
    #StructPack 8

    /**
     * The name of the HTTP header.
     */
    headerName : WS_XML_STRING

    /**
     * A set of flags that control how headers are mapped.  
     *                     See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_HTTP_HEADER_MAPPING_OPTIONS</a> for more information.
     */
    headerMappingOptions : UInt32

}
