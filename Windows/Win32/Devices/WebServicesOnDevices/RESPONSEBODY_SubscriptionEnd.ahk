#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a WS-Eventing SubscriptionEnd response message.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-responsebody_subscriptionend
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class RESPONSEBODY_SubscriptionEnd extends Win32Struct
{
    static sizeof => 32

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
     * A string that describes the reason the subscription ended.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_SourceShuttingDown"></a><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_sourceshuttingdown"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2004_08_EVENTING_SOURCESHUTTINGDOWN"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2004/08/eventing/SourceShuttingDown</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event source is shutting down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_SourceCancelling"></a><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_sourcecancelling"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2004_08_EVENTING_SOURCECANCELLING"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2004/08/eventing/SourceCancelling</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event source canceled the subscription for another reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_DeliveryFailure"></a><a id="http___schemas.xmlsoap.org_ws_2004_08_eventing_deliveryfailure"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2004_08_EVENTING_DELIVERYFAILURE"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2004/08/eventing/DeliveryFailure</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event source ended the subscription because the delivery of notifications failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PWSTR}
     */
    Status {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a  <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string">WSD_LOCALIZED_STRING</a> that contains a human-readable explanation of the reason the subscription ended.
     * @type {Pointer<WSD_LOCALIZED_STRING>}
     */
    Reason {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
