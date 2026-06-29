#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to control the behavior of thread pools.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-ithreadpoolknobs
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IThreadPoolKnobs extends IUnknown {
    /**
     * The interface identifier for IThreadPoolKnobs
     * @type {Guid}
     */
    static IID := Guid("{51372af7-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThreadPoolKnobs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMaxThreads            : IntPtr
        GetCurrentThreads        : IntPtr
        SetMaxThreads            : IntPtr
        GetDeleteDelay           : IntPtr
        SetDeleteDelay           : IntPtr
        GetMaxQueuedRequests     : IntPtr
        GetCurrentQueuedRequests : IntPtr
        SetMaxQueuedRequests     : IntPtr
        SetMinThreads            : IntPtr
        SetQueueDepth            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThreadPoolKnobs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the maximum number of threads that are allowed in the pool.
     * @param {Pointer<Integer>} plcMaxThreads The maximum number of threads allowed in the pool. A zero value indicates that the pool can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxthreads
     */
    GetMaxThreads(plcMaxThreads) {
        plcMaxThreadsMarshal := plcMaxThreads is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plcMaxThreadsMarshal, plcMaxThreads, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of threads currently in the pool.
     * @param {Pointer<Integer>} plcCurrentThreads The number of threads currently in the pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentthreads
     */
    GetCurrentThreads(plcCurrentThreads) {
        plcCurrentThreadsMarshal := plcCurrentThreads is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plcCurrentThreadsMarshal, plcCurrentThreads, "HRESULT")
        return result
    }

    /**
     * Sets the maximum number of threads to be allowed in the pool.
     * @param {Integer} lcMaxThreads The maximum number of threads allowed in the pool. A zero value indicates that the pool can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxthreads
     */
    SetMaxThreads(lcMaxThreads) {
        result := ComCall(5, this, "int", lcMaxThreads, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of milliseconds a pooled thread can idle before being destroyed.
     * @param {Pointer<Integer>} pmsecDeleteDelay The number of milliseconds a pooled thread can idle before being destroyed. A zero value indicates that threads are never automatically deleted.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getdeletedelay
     */
    GetDeleteDelay(pmsecDeleteDelay) {
        pmsecDeleteDelayMarshal := pmsecDeleteDelay is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pmsecDeleteDelayMarshal, pmsecDeleteDelay, "HRESULT")
        return result
    }

    /**
     * Sets the number of milliseconds a pooled thread can idle before being destroyed.
     * @param {Integer} msecDeleteDelay The number of milliseconds a pooled thread can idle before being destroyed. A zero value indicates that threads are never automatically deleted.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setdeletedelay
     */
    SetDeleteDelay(msecDeleteDelay) {
        result := ComCall(7, this, "int", msecDeleteDelay, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of asynchronous execution requests that can be simultaneously queued.
     * @param {Pointer<Integer>} plcMaxQueuedRequests The maximum number of asynchronous execution requests that can be simultaneously queued. A zero value indicates that the queue can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxqueuedrequests
     */
    GetMaxQueuedRequests(plcMaxQueuedRequests) {
        plcMaxQueuedRequestsMarshal := plcMaxQueuedRequests is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plcMaxQueuedRequestsMarshal, plcMaxQueuedRequests, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of asynchronous execution requests that are currently queued.
     * @param {Pointer<Integer>} plcCurrentQueuedRequests The number of asynchronous execution requests currently queued.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentqueuedrequests
     */
    GetCurrentQueuedRequests(plcCurrentQueuedRequests) {
        plcCurrentQueuedRequestsMarshal := plcCurrentQueuedRequests is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plcCurrentQueuedRequestsMarshal, plcCurrentQueuedRequests, "HRESULT")
        return result
    }

    /**
     * Sets the maximum number of asynchronous execution requests that can be simultaneously queued.
     * @param {Integer} lcMaxQueuedRequests The maximum number of asynchronous execution requests that can be simultaneously queued. A zero value indicates that the queue can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxqueuedrequests
     */
    SetMaxQueuedRequests(lcMaxQueuedRequests) {
        result := ComCall(10, this, "int", lcMaxQueuedRequests, "HRESULT")
        return result
    }

    /**
     * Sets the minimum number of threads to be maintained in the pool.
     * @param {Integer} lcMinThreads The minimum number of threads to be maintained in the pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setminthreads
     */
    SetMinThreads(lcMinThreads) {
        result := ComCall(11, this, "int", lcMinThreads, "HRESULT")
        return result
    }

    /**
     * Sets the threshold number of execution requests above which a new thread is added to the pool.
     * @param {Integer} lcQueueDepth The threshold number of execution requests above which a new thread is added to the pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setqueuedepth
     */
    SetQueueDepth(lcQueueDepth) {
        result := ComCall(12, this, "int", lcQueueDepth, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThreadPoolKnobs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxThreads := CallbackCreate(GetMethod(implObj, "GetMaxThreads"), flags, 2)
        this.vtbl.GetCurrentThreads := CallbackCreate(GetMethod(implObj, "GetCurrentThreads"), flags, 2)
        this.vtbl.SetMaxThreads := CallbackCreate(GetMethod(implObj, "SetMaxThreads"), flags, 2)
        this.vtbl.GetDeleteDelay := CallbackCreate(GetMethod(implObj, "GetDeleteDelay"), flags, 2)
        this.vtbl.SetDeleteDelay := CallbackCreate(GetMethod(implObj, "SetDeleteDelay"), flags, 2)
        this.vtbl.GetMaxQueuedRequests := CallbackCreate(GetMethod(implObj, "GetMaxQueuedRequests"), flags, 2)
        this.vtbl.GetCurrentQueuedRequests := CallbackCreate(GetMethod(implObj, "GetCurrentQueuedRequests"), flags, 2)
        this.vtbl.SetMaxQueuedRequests := CallbackCreate(GetMethod(implObj, "SetMaxQueuedRequests"), flags, 2)
        this.vtbl.SetMinThreads := CallbackCreate(GetMethod(implObj, "SetMinThreads"), flags, 2)
        this.vtbl.SetQueueDepth := CallbackCreate(GetMethod(implObj, "SetQueueDepth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxThreads)
        CallbackFree(this.vtbl.GetCurrentThreads)
        CallbackFree(this.vtbl.SetMaxThreads)
        CallbackFree(this.vtbl.GetDeleteDelay)
        CallbackFree(this.vtbl.SetDeleteDelay)
        CallbackFree(this.vtbl.GetMaxQueuedRequests)
        CallbackFree(this.vtbl.GetCurrentQueuedRequests)
        CallbackFree(this.vtbl.SetMaxQueuedRequests)
        CallbackFree(this.vtbl.SetMinThreads)
        CallbackFree(this.vtbl.SetQueueDepth)
    }
}
