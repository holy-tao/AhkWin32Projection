#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_NAME_LIST.ahk" { WSD_NAME_LIST }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_ENDPOINT_REFERENCE_LIST.ahk" { WSD_ENDPOINT_REFERENCE_LIST }

/**
 * Provides metadata regarding a service hosted by a device.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_service_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SERVICE_METADATA {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference_list">WSD_ENDPOINT_REFERENCE_LIST</a> structure that specifies the endpoints at which the service is available.
     */
    EndpointReference : WSD_ENDPOINT_REFERENCE_LIST.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_name_list">WSD_NAME_LIST</a> structure that contains a list of WS-Discovery Types.
     */
    Types : WSD_NAME_LIST.Ptr

    /**
     * The URI of the service. This URI must be valid when a <b>WSD_SERVICE_METADATA</b> structure is passed to <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-setmetadata">IWSDDeviceHost::SetMetadata</a>. Applications are responsible for URI validation.
     */
    ServiceId : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
