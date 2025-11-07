#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a boolean expression used for filtering events.
 * @remarks
 * 
 * For more information about the evaluation of action filters, see Section 6.1.1, Filtering, in the <a href="https://specs.xmlsoap.org/ws/2006/02/devprof/devicesprofile.pdf">Device Profile for Web Services</a> specification.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_eventing_filter_action
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_EVENTING_FILTER_ACTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_uri_list">WSD_URI_LIST</a> structure that specifies the URIs used for filtering notifications.
     * @type {Pointer<WSD_URI_LIST>}
     */
    Actions {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
