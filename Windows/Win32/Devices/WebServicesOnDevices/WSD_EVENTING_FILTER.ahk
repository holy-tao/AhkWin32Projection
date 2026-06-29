#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_EVENTING_FILTER_ACTION.ahk" { WSD_EVENTING_FILTER_ACTION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents an event filter used in WS-Eventing Subscribe messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_eventing_filter
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_EVENTING_FILTER {
    #StructPack 8

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
     */
    Dialect : PWSTR

    FilterAction : WSD_EVENTING_FILTER_ACTION.Ptr

    /**
     * A reference to the expression used for filtering.
     */
    Data : IntPtr

}
