#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_EVENTING_EXPIRES.ahk" { WSD_EVENTING_EXPIRES }

/**
 * Represents a WS-Eventing GetStatus response message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-responsebody_getstatus
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct RESPONSEBODY_GetStatus {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription expires.
     */
    expires : WSD_EVENTING_EXPIRES.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    any : WSDXML_ELEMENT.Ptr

}
