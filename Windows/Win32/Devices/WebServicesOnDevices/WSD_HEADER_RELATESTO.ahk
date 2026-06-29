#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }

/**
 * Represents a RelatesTo SOAP envelope header block, as specified by the WS-Addressing specification.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_header_relatesto
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_HEADER_RELATESTO {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the relationship type as a qualified name.
     */
    RelationshipType : WSDXML_NAME.Ptr

    /**
     * The identifier of the related message.
     */
    MessageID : PWSTR

}
