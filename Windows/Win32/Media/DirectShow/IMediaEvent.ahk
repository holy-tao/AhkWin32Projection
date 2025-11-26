#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaEvent interface contains methods for retrieving event notifications and for overriding the Filter Graph Manager's default handling of events.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaevent
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
     * @returns {Pointer} Pointer to a variable that receives the event handle.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-geteventhandle
     */
    GetEventHandle() {
        result := ComCall(7, this, "ptr*", &hEvent := 0, "HRESULT")
        return hEvent
    }

    /**
     * The GetEvent method retrieves the next event notification from the event queue.
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-getevent
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
     * @param {Integer} msTimeout Time-out interval, in milliseconds. Pass zero to return immediately. Pass the value INFINITE to block indefinitely.
     * @returns {Integer} Pointer to a variable that receives an event code. See Remarks for more information.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-waitforcompletion
     */
    WaitForCompletion(msTimeout) {
        result := ComCall(9, this, "int", msTimeout, "int*", &pEvCode := 0, "HRESULT")
        return pEvCode
    }

    /**
     * The CancelDefaultHandling method cancels the Filter Graph Manager's default handling for a specified event. The event notification is passed to the application.
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-canceldefaulthandling
     */
    CancelDefaultHandling(lEvCode) {
        result := ComCall(10, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * The RestoreDefaultHandling method restores the Filter Graph Manager's default handling for a specified event.
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
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-restoredefaulthandling
     */
    RestoreDefaultHandling(lEvCode) {
        result := ComCall(11, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * The FreeEventParams method frees resources associated with the parameters of an event.
     * @param {Integer} lEvCode Event code.
     * @param {Pointer} lParam1 First event parameter.
     * @param {Pointer} lParam2 Second event parameter.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaevent-freeeventparams
     */
    FreeEventParams(lEvCode, lParam1, lParam2) {
        result := ComCall(12, this, "int", lEvCode, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }
}
