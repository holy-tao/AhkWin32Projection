#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a Resolve message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_resolve
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_RESOLVE {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint to match.
     */
    EndpointReference : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
