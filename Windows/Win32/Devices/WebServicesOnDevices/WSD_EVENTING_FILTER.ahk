#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an event filter used in WS-Eventing Subscribe messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_filter
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_EVENTING_FILTER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the language or dialect use to represent the boolean expression used by the filter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_Action"></a><a id="http___schemas.xmlsoap.org_ws_2006_02_devprof_action"></a><a id="HTTP___SCHEMAS.XMLSOAP.ORG_WS_2006_02_DEVPROF_ACTION"></a><dl>
     * <dt><b>http://schemas.xmlsoap.org/ws/2006/02/devprof/Action</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The boolean expression uses the Action filter dialect.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Ptr>}
     */
    Dialect {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    FilterAction {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A reference to the expression used for filtering.
     * @type {Pointer<Void>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
