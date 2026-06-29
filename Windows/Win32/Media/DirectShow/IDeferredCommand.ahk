#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDeferredCommand interface cancels or modify graph-control commands that were queued using the IQueueCommand interface.When an application calls an IQueueCommand method on the Filter Graph Manager, it receives a pointer to the IDeferredCommand interface. The application can use the interface to cancel or postpone the command, or retrieve the return value from the command.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-ideferredcommand
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDeferredCommand extends IUnknown {
    /**
     * The interface identifier for IDeferredCommand
     * @type {Guid}
     */
    static IID := Guid("{56a868b8-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeferredCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel     : IntPtr
        Confidence : IntPtr
        Postpone   : IntPtr
        GetHResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeferredCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ideferredcommand-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Confidence method retrieves a confidence value that indicates how likely it is for the command to be invoked at the requested time.
     * @returns {Integer} Receives the confidence level, on a scale of 0 to 100.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ideferredcommand-confidence
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ideferredcommand-postpone
     */
    Postpone(newtime) {
        result := ComCall(5, this, "double", newtime, "HRESULT")
        return result
    }

    /**
     * The GetHResult method retrieves the return value from the invoked command.
     * @returns {HRESULT} Receives the <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ideferredcommand-gethresult
     */
    GetHResult() {
        result := ComCall(6, this, "int*", &phrResult := 0, "HRESULT")
        return phrResult
    }

    Query(iid) {
        if (IDeferredCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Confidence := CallbackCreate(GetMethod(implObj, "Confidence"), flags, 2)
        this.vtbl.Postpone := CallbackCreate(GetMethod(implObj, "Postpone"), flags, 2)
        this.vtbl.GetHResult := CallbackCreate(GetMethod(implObj, "GetHResult"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Confidence)
        CallbackFree(this.vtbl.Postpone)
        CallbackFree(this.vtbl.GetHResult)
    }
}
