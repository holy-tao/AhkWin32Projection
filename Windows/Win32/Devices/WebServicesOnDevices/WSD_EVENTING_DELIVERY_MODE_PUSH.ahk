#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the endpoint reference used for push delivery of events in a WS-Eventing Subscribe message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode_push
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_EVENTING_DELIVERY_MODE_PUSH extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint reference to which notifications should be sent.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    NotifyTo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
