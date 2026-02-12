#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ClNotifyHandler function is used by traffic control to notify the client of various traffic control�specific events, including the deletion of flows, changes in filter parameters, or the closing of an interface.
 * @remarks
 * Notification events may require the traffic control client to take particular action or respond appropriately, for example, removing filters or enumerating flows for affected interfaces.
 * 
 * The following table describes the various notification events.
 * 
 * <table>
 * <tr>
 * <th>Event</th>
 * <th>SubCode</th>
 * <th>Buffer contents</th>
 * <th>Remarks</th>
 * </tr>
 * <tr>
 * <td>TC_NOTIFY_IFC_UP</td>
 * <td>None</td>
 * <td>Interface name of the new interface</td>
 * <td>A new traffic control interface is coming up, and the list of addresses is indicated.</td>
 * </tr>
 * <tr>
 * <td>TC_NOTIFY_IFC_CLOSE</td>
 * <td>Reason for close</td>
 * <td>Interface name of the closed interface</td>
 * <td>Indicates an interface that was opened by the client is being closed by the system. Note that the interface and its supported flows and filters are closed by the system upon return from the notification handler. The client does not need to close the interface, delete flows, or delete filters.</td>
 * </tr>
 * <tr>
 * <td>TC_NOTIFY_IFC_CHANGE</td>
 * <td>None</td>
 * <td>New parameter value</td>
 * <td>Used to notify clients that have registered for interface change notification through the <i>NotifyChange</i> parameter of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcqueryinterface">TcQueryInterface</a> function.</td>
 * </tr>
 * <tr>
 * <td>TC_NOTIFY_PARAM_CHANGED</td>
 * <td>Pointer to the GUID for a traffic control parameter queried using the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcqueryinterface">TcQueryInterface</a> function.</td>
 * <td>New parameter value</td>
 * <td>This event is notified as a result of a change in a parameter previously queried with the <i>NotifyChange</i> flag set.</td>
 * </tr>
 * <tr>
 * <td>TC_NOTIFY_FLOW_CLOSE</td>
 * <td><i>ClFlowCtx</i></td>
 * <td></td>
 * <td>Indicates system closure of a client-created flow. The system deletes all associated filters.</td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <i>ClNotifyHandler</i> function requires administrative privilege.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/traffic/nc-traffic-tci_notify_handler
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TCI_NOTIFY_HANDLER extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} ClRegCtx 
     * @param {HANDLE} ClIfcCtx 
     * @param {Integer} Event 
     * @param {HANDLE} SubCode 
     * @param {Integer} BufSize 
     * @param {Pointer} Buffer_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClRegCtx, ClIfcCtx, Event, SubCode, BufSize, Buffer_) {
        ClRegCtx := ClRegCtx is Win32Handle ? NumGet(ClRegCtx, "ptr") : ClRegCtx
        ClIfcCtx := ClIfcCtx is Win32Handle ? NumGet(ClIfcCtx, "ptr") : ClIfcCtx
        SubCode := SubCode is Win32Handle ? NumGet(SubCode, "ptr") : SubCode

        ComCall(3, this, "ptr", ClRegCtx, "ptr", ClIfcCtx, "uint", Event, "ptr", SubCode, "uint", BufSize, "ptr", Buffer_)
    }
}
