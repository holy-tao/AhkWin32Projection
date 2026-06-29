#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The ICancelMethodCalls (objidlbase.h) interface manages cancellation requests on an outbound method call and monitors the current state of that call.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-icancelmethodcalls
 * @namespace Windows.Win32.System.Com
 */
export default struct ICancelMethodCalls extends IUnknown {
    /**
     * The interface identifier for ICancelMethodCalls
     * @type {Guid}
     */
    static IID := Guid("{00000029-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICancelMethodCalls interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel     : IntPtr
        TestCancel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICancelMethodCalls.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ICancelMethodCalls::Cancel (objidlbase.h) method requests that a method call be canceled.
     * @remarks
     * The <b>Cancel</b> method only issues a cancel request. A return value of S_OK does not mean that the call was canceled, only that an attempt was made to cancel the call. The behavior of the cancel object on receiving a cancel request is entirely at the discretion of the implementer.
     * 
     * If a method that returns an <b>HRESULT</b> is canceled, the return value will be RPC_S_CALL_CANCELED.
     * @param {Integer} ulSeconds The number of seconds to wait for the server to complete the outbound call after the client requests cancellation.
     * @returns {HRESULT} This method can return one of these values.
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
     * The cancellation request was made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was already canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CANCEL_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call cancellation is not enabled on the thread that is processing the call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALL_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was completed during the timeout interval.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icancelmethodcalls-cancel
     */
    Cancel(ulSeconds) {
        result := ComCall(3, this, "uint", ulSeconds, "HRESULT")
        return result
    }

    /**
     * The ICancelMethodCalls::TestCancel (objidlbase.h) method determines whether a call has been canceled.
     * @remarks
     * The server object calls <b>TestCancel</b> to determine if the call has been canceled. If the call has been canceled, the server should clean up the necessary resources and return control to the client.
     * 
     * This method can be called from both the client and the server.
     * @returns {HRESULT} If the call was canceled, the return value is RPC_E_CALL_CANCELED. Otherwise, it is RPC_S_CALLPENDING.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icancelmethodcalls-testcancel
     */
    TestCancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICancelMethodCalls.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 2)
        this.vtbl.TestCancel := CallbackCreate(GetMethod(implObj, "TestCancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.TestCancel)
    }
}
