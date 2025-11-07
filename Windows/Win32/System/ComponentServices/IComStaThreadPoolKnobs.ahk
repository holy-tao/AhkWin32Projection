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
     * @returns {Integer} 
     */
    GetMinThreadCount() {
        result := ComCall(4, this, "uint*", &minThreads := 0, "HRESULT")
        return minThreads
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
     * @returns {Integer} 
     */
    GetMaxThreadCount() {
        result := ComCall(6, this, "uint*", &maxThreads := 0, "HRESULT")
        return maxThreads
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
     * @returns {Integer} 
     */
    GetActivityPerThread() {
        result := ComCall(8, this, "uint*", &activitiesPerThread := 0, "HRESULT")
        return activitiesPerThread
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
     * @returns {Float} 
     */
    GetActivityRatio() {
        result := ComCall(10, this, "double*", &activityRatio := 0, "HRESULT")
        return activityRatio
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetThreadCount() {
        result := ComCall(11, this, "uint*", &pdwThreads := 0, "HRESULT")
        return pdwThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetQueueDepth() {
        result := ComCall(12, this, "uint*", &pdwQDepth := 0, "HRESULT")
        return pdwQDepth
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
