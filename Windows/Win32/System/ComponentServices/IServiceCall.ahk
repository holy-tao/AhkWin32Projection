#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to implement the batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicecall
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceCall extends IUnknown {
    /**
     * The interface identifier for IServiceCall
     * @type {Guid}
     */
    static IID := Guid("{bd3e2e12-42dd-40f4-a09a-95a50c58304b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceCall interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceCall.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Triggers the execution of the batch work implemented in this method. (IServiceCall.OnCall)
     * @remarks
     * The batch work that is run in this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. The batch work in this method is run through a call to either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-synchronouscall">SynchronousCall</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall">AsynchronousCall</a>, using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a> pointer that was returned from the call to <b>CoCreateActivity</b>.
     * 
     * 
     * 
     * You must make sure that this method is thread safe in situations where the activity object that is created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> is not created with a synchronized context because in such situations many calls to <b>OnCall</b> can run at the same time.
     * 
     * 
     * 
     * To achieve the best performance from the system, the context configuration of the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> should be matched to the batch work performed by the <b>OnCall</b> method. For example, if the batch work in the <b>OnCall</b> method uses poolable objects, the activity created by <b>CoCreateActivity</b> should be configured to use the multithreaded apartment (MTA).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicecall-oncall
     */
    OnCall() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceCall.IID.Equals(iid)) {
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
