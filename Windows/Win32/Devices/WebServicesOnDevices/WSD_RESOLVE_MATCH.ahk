#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_SCOPES.ahk" { WSD_SCOPES }
#Import ".\WSD_URI_LIST.ahk" { WSD_URI_LIST }
#Import ".\WSD_NAME_LIST.ahk" { WSD_NAME_LIST }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a ResolveMatch message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_resolve_match
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_RESOLVE_MATCH {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the matching endpoint.
     */
    EndpointReference : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that contains a list of WS-Discovery Types.
     */
    Types : WSD_NAME_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_scopes">WSD_SCOPES</a> structure that contains a list of WS-Discovery Scopes.
     */
    Scopes : WSD_SCOPES.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that contains a list of WS-Discovery XAddrs.
     */
    XAddrs : WSD_URI_LIST.Ptr

    /**
     * The metadata version of this message.
     */
    MetadataVersion : Int64

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
