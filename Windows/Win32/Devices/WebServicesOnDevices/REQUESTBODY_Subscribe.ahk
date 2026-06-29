#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_EVENTING_DELIVERY_MODE.ahk" { WSD_EVENTING_DELIVERY_MODE }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_EVENTING_EXPIRES.ahk" { WSD_EVENTING_EXPIRES }
#Import ".\WSD_EVENTING_FILTER.ahk" { WSD_EVENTING_FILTER }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents a WS-Eventing Subscribe request message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-requestbody_subscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct REQUESTBODY_Subscribe {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that represents the endpoint reference of the event recipient.
     */
    EndTo : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference  to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode">WSD_EVENTING_DELIVERY_MODE</a> structure that specifies the delivery mode. Only push delivery is supported.
     */
    Delivery : WSD_EVENTING_DELIVERY_MODE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription will expire.
     */
    Expires : WSD_EVENTING_EXPIRES.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_filter">WSD_EVENTING_FILTER</a> structure that specifies a boolean expression used for event filtering.
     */
    Filter : WSD_EVENTING_FILTER.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
