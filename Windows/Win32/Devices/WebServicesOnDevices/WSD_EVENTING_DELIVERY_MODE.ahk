#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSD_EVENTING_DELIVERY_MODE_PUSH.ahk" { WSD_EVENTING_DELIVERY_MODE_PUSH }

/**
 * Represents the delivery mode used in a WS-Eventing Subscribe message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_delivery_mode
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENTING_DELIVERY_MODE {
    #StructPack 8

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
     */
    Mode : PWSTR

    Push : WSD_EVENTING_DELIVERY_MODE_PUSH.Ptr

    /**
     * A reference to the endpoint used for event delivery.
     */
    Data : IntPtr

}
