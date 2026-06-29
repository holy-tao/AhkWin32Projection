#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_TYPE.ahk" { WSDXML_TYPE }
#Import ".\WSD_HEADER_RELATESTO.ahk" { WSD_HEADER_RELATESTO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_SOAP_HEADER.ahk" { WSD_SOAP_HEADER }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }
#Import ".\WSD_APP_SEQUENCE.ahk" { WSD_APP_SEQUENCE }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * The contents of a WSD SOAP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_message
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_MESSAGE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_header">WSD_SOAP_HEADER</a> structure that specifies the header of the SOAP message.
     */
    Header : WSD_SOAP_HEADER

    /**
     * The body of the SOAP message.
     */
    Body : IntPtr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the type of the SOAP message body.
     */
    BodyType : WSDXML_TYPE.Ptr

}
