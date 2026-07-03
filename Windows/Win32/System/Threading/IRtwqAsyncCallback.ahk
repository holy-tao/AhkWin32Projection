#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRtwqAsyncResult.ahk" { IRtwqAsyncResult }

/**
 * Callback interface to notify the application when an asynchronous method completes. (IRtwqAsyncCallback)
 * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqasynccallback
 * @namespace Windows.Win32.System.Threading
 */
export default struct IRtwqAsyncCallback extends IUnknown {
    /**
     * The interface identifier for IRtwqAsyncCallback
     * @type {Guid}
     */
    static IID := Guid("{a27003cf-2354-4f2a-8d6a-ab7cff15437e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRtwqAsyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParameters : IntPtr
        Invoke        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRtwqAsyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides configuration information to the dispatching thread for a callback. (IRtwqAsyncCallback.GetParameters)
     * @param {Pointer<Integer>} pdwFlags Receives a flag indicating the behavior of the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-irtwqasynccallback-invoke">IRtwqAsyncCallback::Invoke</a> method. The following values are defined. The default value is zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Zero"></a><a id="zero"></a><a id="ZERO"></a><dl>
     * <dt><b>Zero</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback does not take a long time to complete, but has no specific restrictions on what system calls it makes. The callback generally takes less than 30 milliseconds to complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwQueue Receives the identifier of the work queue on which the callback is dispatched.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOTIMPL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. Assume the default behavior.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * Called when an asynchronous operation is completed. (IRtwqAsyncCallback.Invoke)
     * @remarks
     * Within your implementation of <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cdeferredcommand-invoke">Invoke</a>, call the corresponding <b>End...</b> method.
     * @param {IRtwqAsyncResult} pAsyncResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasyncresult">IRtwqAsyncResult</a> interface. Pass this pointer to the asynchronous <b>End...</b> method to complete the asynchronous call.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRtwqAsyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameters := CallbackCreate(GetMethod(implObj, "GetParameters"), flags, 3)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameters)
        CallbackFree(this.vtbl.Invoke)
    }
}
