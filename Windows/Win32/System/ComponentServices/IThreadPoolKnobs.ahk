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
     * 
     * @param {Pointer<Int32>} plcMaxThreads 
     * @returns {HRESULT} 
     */
    GetMaxThreads(plcMaxThreads) {
        result := ComCall(3, this, "int*", plcMaxThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plcCurrentThreads 
     * @returns {HRESULT} 
     */
    GetCurrentThreads(plcCurrentThreads) {
        result := ComCall(4, this, "int*", plcCurrentThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcMaxThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(lcMaxThreads) {
        result := ComCall(5, this, "int", lcMaxThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pmsecDeleteDelay 
     * @returns {HRESULT} 
     */
    GetDeleteDelay(pmsecDeleteDelay) {
        result := ComCall(6, this, "int*", pmsecDeleteDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msecDeleteDelay 
     * @returns {HRESULT} 
     */
    SetDeleteDelay(msecDeleteDelay) {
        result := ComCall(7, this, "int", msecDeleteDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plcMaxQueuedRequests 
     * @returns {HRESULT} 
     */
    GetMaxQueuedRequests(plcMaxQueuedRequests) {
        result := ComCall(8, this, "int*", plcMaxQueuedRequests, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plcCurrentQueuedRequests 
     * @returns {HRESULT} 
     */
    GetCurrentQueuedRequests(plcCurrentQueuedRequests) {
        result := ComCall(9, this, "int*", plcCurrentQueuedRequests, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcMaxQueuedRequests 
     * @returns {HRESULT} 
     */
    SetMaxQueuedRequests(lcMaxQueuedRequests) {
        result := ComCall(10, this, "int", lcMaxQueuedRequests, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcMinThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(lcMinThreads) {
        result := ComCall(11, this, "int", lcMinThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcQueueDepth 
     * @returns {HRESULT} 
     */
    SetQueueDepth(lcQueueDepth) {
        result := ComCall(12, this, "int", lcQueueDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
