#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements the batch work that is submitted through the activity created by the MTSCreateActivity function.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtscall
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMTSCall extends IUnknown {
    /**
     * The interface identifier for IMTSCall
     * @type {Guid}
     */
    static IID := Guid("{51372aef-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMTSCall interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMTSCall.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Triggers the execution of the batch work implemented in this method. (IMTSCall.OnCall)
     * @remarks
     * The batch work that is run in this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>. The batch work in this method is run using a call to either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtsactivity-synchronouscall">IMTSActivity::SynchronousCall</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtsactivity-asynccall">IMTSActivity::AsyncCall</a>, using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtsactivity">IMTSActivity</a> pointer that was returned from the call to <b>MTSCreateActivity</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtscall-oncall
     */
    OnCall() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMTSCall.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCall := CallbackCreate(GetMethod(implObj, "OnCall"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCall)
    }
}
