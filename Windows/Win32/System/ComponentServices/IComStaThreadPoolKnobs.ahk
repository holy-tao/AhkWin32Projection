#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComStaThreadPoolKnobs extends IUnknown{
    /**
     * The interface identifier for IComStaThreadPoolKnobs
     * @type {Guid}
     */
    static IID => Guid("{324b64fa-33b6-11d2-98b7-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} minThreads 
     * @returns {HRESULT} 
     */
    SetMinThreadCount(minThreads) {
        result := ComCall(3, this, "uint", minThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} minThreads 
     * @returns {HRESULT} 
     */
    GetMinThreadCount(minThreads) {
        result := ComCall(4, this, "uint*", minThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} maxThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreadCount(maxThreads) {
        result := ComCall(5, this, "uint", maxThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} maxThreads 
     * @returns {HRESULT} 
     */
    GetMaxThreadCount(maxThreads) {
        result := ComCall(6, this, "uint*", maxThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} activitiesPerThread 
     * @returns {HRESULT} 
     */
    SetActivityPerThread(activitiesPerThread) {
        result := ComCall(7, this, "uint", activitiesPerThread, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} activitiesPerThread 
     * @returns {HRESULT} 
     */
    GetActivityPerThread(activitiesPerThread) {
        result := ComCall(8, this, "uint*", activitiesPerThread, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} activityRatio 
     * @returns {HRESULT} 
     */
    SetActivityRatio(activityRatio) {
        result := ComCall(9, this, "double", activityRatio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} activityRatio 
     * @returns {HRESULT} 
     */
    GetActivityRatio(activityRatio) {
        result := ComCall(10, this, "double*", activityRatio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwThreads 
     * @returns {HRESULT} 
     */
    GetThreadCount(pdwThreads) {
        result := ComCall(11, this, "uint*", pdwThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwQDepth 
     * @returns {HRESULT} 
     */
    GetQueueDepth(pdwQDepth) {
        result := ComCall(12, this, "uint*", pdwQDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwQDepth 
     * @returns {HRESULT} 
     */
    SetQueueDepth(dwQDepth) {
        result := ComCall(13, this, "int", dwQDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
