#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a WS-Eventing Subscribe request message.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-requestbody_subscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class REQUESTBODY_Subscribe extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that represents the endpoint reference of the event recipient.
     * @type {Pointer<WSD_ENDPOINT_REFERENCE>}
     */
    EndTo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference  to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode">WSD_EVENTING_DELIVERY_MODE</a> structure that specifies the delivery mode. Only push delivery is supported.
     * @type {Pointer<WSD_EVENTING_DELIVERY_MODE>}
     */
    Delivery {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies when the subscription will expire.
     * @type {Pointer<WSD_EVENTING_EXPIRES>}
     */
    Expires {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_filter">WSD_EVENTING_FILTER</a> structure that specifies a boolean expression used for event filtering.
     * @type {Pointer<WSD_EVENTING_FILTER>}
     */
    Filter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
