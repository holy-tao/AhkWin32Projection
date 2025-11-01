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
     * 
     * @param {Pointer<Integer>} plcMaxThreads 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxthreads
     */
    GetMaxThreads(plcMaxThreads) {
        result := ComCall(3, this, "int*", plcMaxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plcCurrentThreads 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentthreads
     */
    GetCurrentThreads(plcCurrentThreads) {
        result := ComCall(4, this, "int*", plcCurrentThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcMaxThreads 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxthreads
     */
    SetMaxThreads(lcMaxThreads) {
        result := ComCall(5, this, "int", lcMaxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsecDeleteDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getdeletedelay
     */
    GetDeleteDelay(pmsecDeleteDelay) {
        result := ComCall(6, this, "int*", pmsecDeleteDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msecDeleteDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setdeletedelay
     */
    SetDeleteDelay(msecDeleteDelay) {
        result := ComCall(7, this, "int", msecDeleteDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plcMaxQueuedRequests 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getmaxqueuedrequests
     */
    GetMaxQueuedRequests(plcMaxQueuedRequests) {
        result := ComCall(8, this, "int*", plcMaxQueuedRequests, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plcCurrentQueuedRequests 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-getcurrentqueuedrequests
     */
    GetCurrentQueuedRequests(plcCurrentQueuedRequests) {
        result := ComCall(9, this, "int*", plcCurrentQueuedRequests, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcMaxQueuedRequests 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setmaxqueuedrequests
     */
    SetMaxQueuedRequests(lcMaxQueuedRequests) {
        result := ComCall(10, this, "int", lcMaxQueuedRequests, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcMinThreads 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setminthreads
     */
    SetMinThreads(lcMinThreads) {
        result := ComCall(11, this, "int", lcMinThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcQueueDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ithreadpoolknobs-setqueuedepth
     */
    SetQueueDepth(lcQueueDepth) {
        result := ComCall(12, this, "int", lcQueueDepth, "HRESULT")
        return result
    }
}
