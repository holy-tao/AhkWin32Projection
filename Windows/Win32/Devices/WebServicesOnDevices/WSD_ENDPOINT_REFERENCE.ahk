#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_REFERENCE_PARAMETERS.ahk" { WSD_REFERENCE_PARAMETERS }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_REFERENCE_PROPERTIES.ahk" { WSD_REFERENCE_PROPERTIES }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Represents a WS-Addressing endpoint reference.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_ENDPOINT_REFERENCE {
    #StructPack 8

    /**
     * The endpoint address.
     */
    Address : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_reference_properties">WSD_REFERENCE_PROPERTIES</a> structure that specifies additional data used to uniquely identify the endpoint.
     */
    ReferenceProperties : WSD_REFERENCE_PROPERTIES

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_reference_parameters">WSD_REFERENCE_PARAMETERS</a> structure that specifies additional opaque data used by the endpoint.
     */
    ReferenceParameters : WSD_REFERENCE_PARAMETERS

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the port type of the service at the referenced endpoint.
     */
    PortType : WSDXML_NAME.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies the service name of the service at the referenced endpoint.
     */
    ServiceName : WSDXML_NAME.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
