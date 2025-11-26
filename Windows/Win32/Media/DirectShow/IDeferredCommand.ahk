#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDeferredCommand interface cancels or modify graph-control commands that were queued using the IQueueCommand interface.When an application calls an IQueueCommand method on the Filter Graph Manager, it receives a pointer to the IDeferredCommand interface. The application can use the interface to cancel or postpone the command, or retrieve the return value from the command.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ideferredcommand
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDeferredCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeferredCommand
     * @type {Guid}
     */
    static IID => Guid("{56a868b8-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Confidence", "Postpone", "GetHResult"]

    /**
     * The Cancel method cancels a command that the application previously queued.
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
     * <dt><b>VFW_E_ALREADY_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was already canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ideferredcommand-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Confidence method retrieves a confidence value that indicates how likely it is for the command to be invoked at the requested time.
     * @returns {Integer} Receives the confidence level, on a scale of 0 to 100.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ideferredcommand-confidence
     */
    Confidence() {
        result := ComCall(4, this, "int*", &pConfidence := 0, "HRESULT")
        return pConfidence
    }

    /**
     * The Postpone method specifies a new invocation time for the command.
     * @param {Float} newtime New time at which to invoke the command.
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
     * <dt><b>VFW_E_TIME_ALREADY_PASSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified time has already passed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ideferredcommand-postpone
     */
    Postpone(newtime) {
        result := ComCall(5, this, "double", newtime, "HRESULT")
        return result
    }

    /**
     * The GetHResult method retrieves the return value from the invoked command.
     * @returns {HRESULT} Receives the <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ideferredcommand-gethresult
     */
    GetHResult() {
        result := ComCall(6, this, "int*", &phrResult := 0, "HRESULT")
        return phrResult
    }
}
