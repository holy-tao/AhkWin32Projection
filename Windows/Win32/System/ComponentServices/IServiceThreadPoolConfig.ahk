#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CSC_ThreadPool.ahk" { CSC_ThreadPool }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CSC_Binding.ahk" { CSC_Binding }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the thread pool of the activity object that is returned by calling CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicethreadpoolconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceThreadPoolConfig extends IUnknown {
    /**
     * The interface identifier for IServiceThreadPoolConfig
     * @type {Guid}
     */
    static IID := Guid("{186d89bc-f277-4bcc-80d5-4df7b836ef4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceThreadPoolConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SelectThreadPool : IntPtr
        SetBindingInfo   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceThreadPoolConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Selects the thread pool in which the work submitted through the activity is to run.
     * @param {CSC_ThreadPool} threadPool A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_threadpool">CSC_ThreadPool</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicethreadpoolconfig-selectthreadpool
     */
    SelectThreadPool(threadPool) {
        result := ComCall(3, this, CSC_ThreadPool, threadPool, "HRESULT")
        return result
    }

    /**
     * Binds all work submitted by the activity to a single single-threaded apartment.
     * @param {CSC_Binding} binding A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_binding">CSC_Binding</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicethreadpoolconfig-setbindinginfo
     */
    SetBindingInfo(binding) {
        result := ComCall(4, this, CSC_Binding, binding, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceThreadPoolConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SelectThreadPool := CallbackCreate(GetMethod(implObj, "SelectThreadPool"), flags, 2)
        this.vtbl.SetBindingInfo := CallbackCreate(GetMethod(implObj, "SetBindingInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SelectThreadPool)
        CallbackFree(this.vtbl.SetBindingInfo)
    }
}
