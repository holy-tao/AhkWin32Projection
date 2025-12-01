#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a WS-Eventing Subscribe response message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-responsebody_subscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class RESPONSEBODY_Subscribe extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that represents the endpoint reference of the subscription manager.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    SubscriptionManager {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription expires.
     * @type {Pointer<WSD_EVENTING_EXPIRES>}
     */
    expires {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    any {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
