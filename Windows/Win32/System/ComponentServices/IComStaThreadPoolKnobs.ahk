#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComStaThreadPoolKnobs extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMinThreadCount", "GetMinThreadCount", "SetMaxThreadCount", "GetMaxThreadCount", "SetActivityPerThread", "GetActivityPerThread", "SetActivityRatio", "GetActivityRatio", "GetThreadCount", "GetQueueDepth", "SetQueueDepth"]

    /**
     * 
     * @param {Integer} minThreads 
     * @returns {HRESULT} 
     */
    SetMinThreadCount(minThreads) {
        result := ComCall(3, this, "uint", minThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} minThreads 
     * @returns {HRESULT} 
     */
    GetMinThreadCount(minThreads) {
        minThreadsMarshal := minThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, minThreadsMarshal, minThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} maxThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreadCount(maxThreads) {
        result := ComCall(5, this, "uint", maxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} maxThreads 
     * @returns {HRESULT} 
     */
    GetMaxThreadCount(maxThreads) {
        maxThreadsMarshal := maxThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, maxThreadsMarshal, maxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} activitiesPerThread 
     * @returns {HRESULT} 
     */
    SetActivityPerThread(activitiesPerThread) {
        result := ComCall(7, this, "uint", activitiesPerThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} activitiesPerThread 
     * @returns {HRESULT} 
     */
    GetActivityPerThread(activitiesPerThread) {
        activitiesPerThreadMarshal := activitiesPerThread is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, activitiesPerThreadMarshal, activitiesPerThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} activityRatio 
     * @returns {HRESULT} 
     */
    SetActivityRatio(activityRatio) {
        result := ComCall(9, this, "double", activityRatio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} activityRatio 
     * @returns {HRESULT} 
     */
    GetActivityRatio(activityRatio) {
        activityRatioMarshal := activityRatio is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, activityRatioMarshal, activityRatio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwThreads 
     * @returns {HRESULT} 
     */
    GetThreadCount(pdwThreads) {
        pdwThreadsMarshal := pdwThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwThreadsMarshal, pdwThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwQDepth 
     * @returns {HRESULT} 
     */
    GetQueueDepth(pdwQDepth) {
        pdwQDepthMarshal := pdwQDepth is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwQDepthMarshal, pdwQDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwQDepth 
     * @returns {HRESULT} 
     */
    SetQueueDepth(dwQDepth) {
        result := ComCall(13, this, "int", dwQDepth, "HRESULT")
        return result
    }
}
