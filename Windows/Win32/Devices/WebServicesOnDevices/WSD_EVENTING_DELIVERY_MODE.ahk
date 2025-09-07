#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the delivery mode used in a WS-Eventing Subscribe message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_EVENTING_DELIVERY_MODE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the delivery mode for event delivery.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_DeliveryModes_Push"></a><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_deliverymodes_push"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2004_08_EVENTING_DELIVERYMODES_PUSH"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2004/08/eventing/DeliveryModes/Push</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Push mode delivery is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Ptr>}
     */
    Mode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    Push {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A reference to the endpoint used for event delivery.
     * @type {Pointer<Void>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
