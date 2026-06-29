#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Represents the endpoint reference used for push delivery of events in a WS-Eventing Subscribe message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode_push
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENTING_DELIVERY_MODE_PUSH {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint reference to which notifications should be sent.
     */
    NotifyTo : WSD_ENDPOINT_REFERENCE.Ptr

}
