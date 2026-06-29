#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }

/**
 * Represents a WS-Eventing Unsubscribe request message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-requestbody_unsubscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct REQUESTBODY_Unsubscribe {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    any : WSDXML_ELEMENT.Ptr

}
