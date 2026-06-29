#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMTSCall.ahk" { IMTSCall }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Submits batch work through the activity created by the MTSCreateActivity function.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtsactivity
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMTSActivity extends IUnknown {
    /**
     * The interface identifier for IMTSActivity
     * @type {Guid}
     */
    static IID := Guid("{51372af0-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMTSActivity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SynchronousCall     : IntPtr
        AsyncCall           : IntPtr
        Reserved1           : IntPtr
        BindToCurrentThread : IntPtr
        UnbindFromThread    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMTSActivity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs the user-defined work synchronously. (IMTSActivity.SynchronousCall)
     * @remarks
     * The batch work that is run using this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>.
     * @param {IMTSCall} pCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method always returns the <b>HRESULT</b> returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtscall-oncall">OnCall</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-synchronouscall
     */
    SynchronousCall(pCall) {
        result := ComCall(3, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * Performs the user-defined work asynchronously. (IMTSActivity.AsyncCall)
     * @remarks
     * The batch work that is run using this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>.
     * 
     * 
     * A return value of S_OK indicates that the batch work was accepted by the activity to run asynchronously. However, it does not necessarily mean that the batch work successfully completed.
     * @param {IMTSCall} pCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-asynccall
     */
    AsyncCall(pCall) {
        result := ComCall(4, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(5, this)
    }

    /**
     * Binds the batch work that is submitted using IMTSActivity::AsyncCall or IMTSActivity::SynchronousCall to the current single-threaded apartment (STA).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Unbinds the batch work that is submitted using IMTSActivity::AsyncCall or IMTSActivity::SynchronousCall from the thread on which it is running.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMTSActivity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SynchronousCall := CallbackCreate(GetMethod(implObj, "SynchronousCall"), flags, 2)
        this.vtbl.AsyncCall := CallbackCreate(GetMethod(implObj, "AsyncCall"), flags, 2)
        this.vtbl.Reserved1 := CallbackCreate(GetMethod(implObj, "Reserved1"), flags, 1)
        this.vtbl.BindToCurrentThread := CallbackCreate(GetMethod(implObj, "BindToCurrentThread"), flags, 1)
        this.vtbl.UnbindFromThread := CallbackCreate(GetMethod(implObj, "UnbindFromThread"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SynchronousCall)
        CallbackFree(this.vtbl.AsyncCall)
        CallbackFree(this.vtbl.Reserved1)
        CallbackFree(this.vtbl.BindToCurrentThread)
        CallbackFree(this.vtbl.UnbindFromThread)
    }
}
