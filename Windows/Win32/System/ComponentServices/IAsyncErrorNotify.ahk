#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to implement error trapping on the asynchronous batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iasyncerrornotify
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IAsyncErrorNotify extends IUnknown {
    /**
     * The interface identifier for IAsyncErrorNotify
     * @type {Guid}
     */
    static IID := Guid("{fe6777fb-a674-4177-8f32-6d707e113484}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAsyncErrorNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAsyncErrorNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by COM+ when an error occurs in your asynchronous batch work.
     * @remarks
     * This method should be implemented to gracefully handle errors that occur when your batch work is running asynchronously. Because the process terminates (FailFast) on any unrecoverable error, without this method you have no way of knowing when errors occur in your asynchronous batch work. The process also terminates when this method returns an error as its return value.
     * 
     * The batch work itself is implemented in <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicecall-oncall">IServiceCall::OnCall</a>, and it is run asynchronously by calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall">IServiceActivity::AsynchronousCall</a> using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a> pointer that was returned from the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>.
     * @param {HRESULT} hr The <b>HRESULT</b> value of the error that occurred while your batch work was running asynchronously.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iasyncerrornotify-onerror
     */
    OnError(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAsyncErrorNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnError)
    }
}
