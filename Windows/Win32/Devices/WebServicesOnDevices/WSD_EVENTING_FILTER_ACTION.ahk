#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_URI_LIST.ahk" { WSD_URI_LIST }

/**
 * Represents a boolean expression used for filtering events.
 * @remarks
 * For more information about the evaluation of action filters, see Section 6.1.1, Filtering, in the <a href="https://specs.xmlsoap.org/ws/2006/02/devprof/devicesprofile.pdf">Device Profile for Web Services</a> specification.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_filter_action
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENTING_FILTER_ACTION {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that specifies the URIs used for filtering notifications.
     */
    Actions : WSD_URI_LIST.Ptr

}
