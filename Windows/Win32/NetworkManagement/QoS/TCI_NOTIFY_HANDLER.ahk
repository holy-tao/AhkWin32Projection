#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

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
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nc-traffic-tci_notify_handler
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TCI_NOTIFY_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is TCI_NOTIFY_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ClRegCtx Client registration context, provided to traffic control by the client with the client's call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
     * @param {HANDLE} ClIfcCtx Client interface context, provided to traffic control by the client with the client's call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function. Note that during a TC_NOTIFY_IFC_UP event, <i>ClIfcCtx</i> is not available and will be set to <b>NULL</b>.
     * @param {Integer} Event Describes the notification event. See the Remarks section for a list of notification events.
     * @param {HANDLE} SubCode Handle used to further qualify a notification event. See Note below for 64-bit for Windows programming issues.
     * @param {Integer} BufSize Size of the buffer included with the notification event, in bytes.
     * @param {Integer} _Buffer Buffer containing the detailed event information associated with <i>Event</i> and <i>SubCode</i>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ClRegCtx, ClIfcCtx, Event, SubCode, BufSize, _Buffer) {
        DllCall(this.value, HANDLE, ClRegCtx, HANDLE, ClIfcCtx, UInt32, Event, HANDLE, SubCode, UInt32, BufSize, IntPtr, _Buffer)
    }

    /**
     * A TCI_NOTIFY_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TCI_NOTIFY_HANDLER {
        /**
         * Creates a TCI_NOTIFY_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, HANDLE, UInt32, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, HANDLE, UInt32, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
