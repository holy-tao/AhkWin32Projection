#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_HOST_METADATA.ahk" { WSD_HOST_METADATA }

/**
 * Provides metadata about the relationship between two or more services.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_relationship_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_RELATIONSHIP_METADATA {
    #StructPack 8

    /**
     * A WS-Discovery Type.
     */
    Type : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_host_metadata">WSD_HOST_METADATA</a> structure that contains metadata for all services hosted by a device.
     */
    Data : WSD_HOST_METADATA.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
