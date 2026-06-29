#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_EVENTING_EXPIRES.ahk" { WSD_EVENTING_EXPIRES }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a WS-Eventing Subscribe response message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-responsebody_subscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct RESPONSEBODY_Subscribe {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that represents the endpoint reference of the subscription manager.
     */
    SubscriptionManager : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription expires.
     */
    expires : WSD_EVENTING_EXPIRES.Ptr

    any : WSDXML_ELEMENT.Ptr

}
