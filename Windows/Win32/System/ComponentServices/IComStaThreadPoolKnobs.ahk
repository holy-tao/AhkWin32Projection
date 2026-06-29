#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComStaThreadPoolKnobs extends IUnknown {
    /**
     * The interface identifier for IComStaThreadPoolKnobs
     * @type {Guid}
     */
    static IID := Guid("{324b64fa-33b6-11d2-98b7-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComStaThreadPoolKnobs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMinThreadCount    : IntPtr
        GetMinThreadCount    : IntPtr
        SetMaxThreadCount    : IntPtr
        GetMaxThreadCount    : IntPtr
        SetActivityPerThread : IntPtr
        GetActivityPerThread : IntPtr
        SetActivityRatio     : IntPtr
        GetActivityRatio     : IntPtr
        GetThreadCount       : IntPtr
        GetQueueDepth        : IntPtr
        SetQueueDepth        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComStaThreadPoolKnobs.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IComStaThreadPoolKnobs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMinThreadCount := CallbackCreate(GetMethod(implObj, "SetMinThreadCount"), flags, 2)
        this.vtbl.GetMinThreadCount := CallbackCreate(GetMethod(implObj, "GetMinThreadCount"), flags, 2)
        this.vtbl.SetMaxThreadCount := CallbackCreate(GetMethod(implObj, "SetMaxThreadCount"), flags, 2)
        this.vtbl.GetMaxThreadCount := CallbackCreate(GetMethod(implObj, "GetMaxThreadCount"), flags, 2)
        this.vtbl.SetActivityPerThread := CallbackCreate(GetMethod(implObj, "SetActivityPerThread"), flags, 2)
        this.vtbl.GetActivityPerThread := CallbackCreate(GetMethod(implObj, "GetActivityPerThread"), flags, 2)
        this.vtbl.SetActivityRatio := CallbackCreate(GetMethod(implObj, "SetActivityRatio"), flags, 2)
        this.vtbl.GetActivityRatio := CallbackCreate(GetMethod(implObj, "GetActivityRatio"), flags, 2)
        this.vtbl.GetThreadCount := CallbackCreate(GetMethod(implObj, "GetThreadCount"), flags, 2)
        this.vtbl.GetQueueDepth := CallbackCreate(GetMethod(implObj, "GetQueueDepth"), flags, 2)
        this.vtbl.SetQueueDepth := CallbackCreate(GetMethod(implObj, "SetQueueDepth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMinThreadCount)
        CallbackFree(this.vtbl.GetMinThreadCount)
        CallbackFree(this.vtbl.SetMaxThreadCount)
        CallbackFree(this.vtbl.GetMaxThreadCount)
        CallbackFree(this.vtbl.SetActivityPerThread)
        CallbackFree(this.vtbl.GetActivityPerThread)
        CallbackFree(this.vtbl.SetActivityRatio)
        CallbackFree(this.vtbl.GetActivityRatio)
        CallbackFree(this.vtbl.GetThreadCount)
        CallbackFree(this.vtbl.GetQueueDepth)
        CallbackFree(this.vtbl.SetQueueDepth)
    }
}
