#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaEvent interface contains methods for retrieving event notifications and for overriding the Filter Graph Manager's default handling of events.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-imediaevent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{56a868b6-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventHandle", "GetEvent", "WaitForCompletion", "CancelDefaultHandling", "RestoreDefaultHandling", "FreeEventParams"]

    /**
     * The GetEventHandle method retrieves a handle to a manual-reset event that remains signaled while the queue contains event notifications.
     * @remarks
     * The Filter Graph Manager keeps a manual-reset event that reflects the state of the event queue. If the queue contains event notifications, the manual-reset event is signaled. If the queue is empty, the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-getevent">IMediaEvent::GetEvent</a> method resets the event.
     * 
     * An application can use this event to determine the state of the queue. First call <c>GetEventHandle</c> to obtain a handle to the event. Wait for the event to be signaled, using a function such as <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitforsingleobject">WaitForSingleObject</a>. When the event is signaled, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-getevent">IMediaEvent::GetEvent</a> method to retrieve the next event notification from the queue. The Filter Graph Manager keeps the event signaled until the queue is empty; then it resets the event.
     * 
     * Do not close the event handle returned by this method, because the event handle is used internally by the filter graph. Also, do not use the handle after you release the Filter Graph Manager, because the handle becomes invalid after the Filter Graph Manager is destroyed. (To avoid this error, it is a good idea to duplicate the handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a>, and use the duplicate instead of the original handle. Close the duplicate handle when you are finished.)
     * 
     * For Automation compatibility, this method takes a pointer to an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oaevent">OAEVENT</a> type. In C++, declare a variable of type <b>HANDLE</b> and cast it an <b>OAEVENT</b> pointer, as follows:
     * 
     * 
     * ```cpp
     * 
     * HANDLE hEvent;
     * GetEventHandle( (OAEVENT*) &hEvent );
     * 
     * ```
     * 
     * 
     * Another way for applications to monitor the event queue is by calling the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaeventex-setnotifywindow">IMediaEventEx::SetNotifyWindow</a> method.
     * @returns {Pointer} Pointer to a variable that receives the event handle.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-geteventhandle
     */
    GetEventHandle() {
        result := ComCall(7, this, "ptr*", &hEvent := 0, "HRESULT")
        return hEvent
    }

    /**
     * The GetEvent method retrieves the next event notification from the event queue.
     * @remarks
     * If no event is on the queue, this method waits up to <i>msTimeout</i> milliseconds for an event to arrive. Avoid using a time-out interval of INFINITE, because threads cannot process any messages while waiting in <c>GetEvent</code>. If you call <code>GetEvent</c> from the same thread that processes Windows messages, specify only small wait times, in order to remain responsive to user input.
     * 
     * After calling <c>GetEvent</c>, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-freeeventparams">IMediaEvent::FreeEventParams</a> method to release any resources allocated for the event parameters.
     * 
     * For a list of notification codes and event parameter values, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/event-notification-codes">Event Notification Codes</a>.
     * 
     * Because this method removes the event from the filter graph event queue, there is no way for multiple clients to monitor events from the same graph.
     * @param {Pointer<Integer>} lEventCode Pointer to a variable that receives the event code.
     * @param {Pointer<Pointer>} lParam1 Pointer to a variable that receives the first event parameter.
     * @param {Pointer<Pointer>} lParam2 Pointer to a variable that receives the second event parameter.
     * @param {Integer} msTimeout Time-out interval, in milliseconds. Use INFINITE to block until there is an event.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Timeout expired.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-getevent
     */
    GetEvent(lEventCode, lParam1, lParam2, msTimeout) {
        lEventCodeMarshal := lEventCode is VarRef ? "int*" : "ptr"
        lParam1Marshal := lParam1 is VarRef ? "ptr*" : "ptr"
        lParam2Marshal := lParam2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, lEventCodeMarshal, lEventCode, lParam1Marshal, lParam1, lParam2Marshal, lParam2, "int", msTimeout, "HRESULT")
        return result
    }

    /**
     * The WaitForCompletion method waits for the filter graph to render all available data. The filter graph must be running or the method fails.
     * @remarks
     * This method blocks until the time-out expires, or one of the following events occurs:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-errorabort">EC_ERRORABORT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-userabort">EC_USERABORT</a>
     * </li>
     * </ul>
     * During the wait, the method discards all other event notifications.
     * 
     * If the return value is S_OK, the <i>pEvCode</i> parameter receives the event code that ended the wait. When the method returns, the filter graph is still running. The application can pause or stop the graph, as appropriate.
     * @param {Integer} msTimeout Time-out interval, in milliseconds. Pass zero to return immediately. Pass the value INFINITE to block indefinitely.
     * @returns {Integer} Pointer to a variable that receives an event code. See Remarks for more information.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-waitforcompletion
     */
    WaitForCompletion(msTimeout) {
        result := ComCall(9, this, "int", msTimeout, "int*", &pEvCode := 0, "HRESULT")
        return pEvCode
    }

    /**
     * The CancelDefaultHandling method cancels the Filter Graph Manager's default handling for a specified event. The event notification is passed to the application.
     * @remarks
     * To restore the default handling for an event, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-restoredefaulthandling">IMediaEvent::RestoreDefaultHandling</a> method with the event code.
     * @param {Integer} lEvCode Event code for which to cancel default handling.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No default handling for this event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-canceldefaulthandling
     */
    CancelDefaultHandling(lEvCode) {
        result := ComCall(10, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * The RestoreDefaultHandling method restores the Filter Graph Manager's default handling for a specified event.
     * @remarks
     * By default, the Filter Graph Manager handles some events (such as <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-repaint">EC_REPAINT</a>) without passing them to the application. If you call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-canceldefaulthandling">IMediaEvent::CancelDefaultHandling</a> method to override the default handling for an event, you can restore the default behavior by calling <c>RestoreDefaultHandling</c> with the same event code.
     * @param {Integer} lEvCode Event code for which to restore default handling.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No default handling for this event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-restoredefaulthandling
     */
    RestoreDefaultHandling(lEvCode) {
        result := ComCall(11, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * The FreeEventParams method frees resources associated with the parameters of an event.
     * @remarks
     * After you call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-getevent">IMediaEvent::GetEvent</a> method to retrieve an event notification, you must call <c>FreeEventParams</c>. This method frees any resources that were allocated for the event parameters. Pass in the same variables used for the <b>GetEvent</b> call.
     * @param {Integer} lEvCode Event code.
     * @param {Pointer} lParam1 First event parameter.
     * @param {Pointer} lParam2 Second event parameter.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-freeeventparams
     */
    FreeEventParams(lEvCode, lParam1, lParam2) {
        result := ComCall(12, this, "int", lEvCode, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }
}
