#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_DATETIME.ahk" { WSD_DATETIME }
#Import ".\WSD_DURATION.ahk" { WSD_DURATION }

/**
 * Represents the expiration time of a WS-Eventing message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENTING_EXPIRES {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/ns-wsdxml-wsd_duration">WSD_DURATION</a> structure that specifies the length of time a request or response is valid.
     */
    Duration : WSD_DURATION.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxml/ns-wsdxml-wsd_datetime">WSD_DATETIME</a> structure that specifies the time that the request or response expires.
     */
    DateTime : WSD_DATETIME.Ptr

}
