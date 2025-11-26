#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to control the behavior of thread pools.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-ithreadpoolknobs
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IThreadPoolKnobs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThreadPoolKnobs
     * @type {Guid}
     */
    static IID => Guid("{51372af7-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxThreads", "GetCurrentThreads", "SetMaxThreads", "GetDeleteDelay", "SetDeleteDelay", "GetMaxQueuedRequests", "GetCurrentQueuedRequests", "SetMaxQueuedRequests", "SetMinThreads", "SetQueueDepth"]

    /**
     * Retrieves the maximum number of threads that are allowed in the pool.
     * @param {Pointer<Integer>} plcMaxThreads The maximum number of threads allowed in the pool. A zero value indicates that the pool can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxthreads
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentthreads
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxthreads
     */
    SetMaxThreads(lcMaxThreads) {
        result := ComCall(5, this, "int", lcMaxThreads, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of milliseconds a pooled thread can idle before being destroyed.
     * @param {Pointer<Integer>} pmsecDeleteDelay The number of milliseconds a pooled thread can idle before being destroyed. A zero value indicates that threads are never automatically deleted.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-getdeletedelay
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-setdeletedelay
     */
    SetDeleteDelay(msecDeleteDelay) {
        result := ComCall(7, this, "int", msecDeleteDelay, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of asynchronous execution requests that can be simultaneously queued.
     * @param {Pointer<Integer>} plcMaxQueuedRequests The maximum number of asynchronous execution requests that can be simultaneously queued. A zero value indicates that the queue can grow without limit.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxqueuedrequests
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentqueuedrequests
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxqueuedrequests
     */
    SetMaxQueuedRequests(lcMaxQueuedRequests) {
        result := ComCall(10, this, "int", lcMaxQueuedRequests, "HRESULT")
        return result
    }

    /**
     * Sets the minimum number of threads to be maintained in the pool.
     * @param {Integer} lcMinThreads The minimum number of threads to be maintained in the pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-setminthreads
     */
    SetMinThreads(lcMinThreads) {
        result := ComCall(11, this, "int", lcMinThreads, "HRESULT")
        return result
    }

    /**
     * Sets the threshold number of execution requests above which a new thread is added to the pool.
     * @param {Integer} lcQueueDepth The threshold number of execution requests above which a new thread is added to the pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ithreadpoolknobs-setqueuedepth
     */
    SetQueueDepth(lcQueueDepth) {
        result := ComCall(12, this, "int", lcQueueDepth, "HRESULT")
        return result
    }
}
