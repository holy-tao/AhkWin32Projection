#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_EVENTING_EXPIRES.ahk" { WSD_EVENTING_EXPIRES }

/**
 * Represents a WS-Eventing Renew response message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-responsebody_renew
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct RESPONSEBODY_Renew {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription expires.
     */
    expires : WSD_EVENTING_EXPIRES.Ptr

    any : WSDXML_ELEMENT.Ptr

}
