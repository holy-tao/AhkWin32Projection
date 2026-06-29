#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IComStaThreadPoolKnobs.ahk" { IComStaThreadPoolKnobs }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComStaThreadPoolKnobs2 extends IComStaThreadPoolKnobs {
    /**
     * The interface identifier for IComStaThreadPoolKnobs2
     * @type {Guid}
     */
    static IID := Guid("{73707523-ff9a-4974-bf84-2108dc213740}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComStaThreadPoolKnobs2 interfaces
    */
    struct Vtbl extends IComStaThreadPoolKnobs.Vtbl {
        GetMaxCPULoad                : IntPtr
        SetMaxCPULoad                : IntPtr
        GetCPUMetricEnabled          : IntPtr
        SetCPUMetricEnabled          : IntPtr
        GetCreateThreadsAggressively : IntPtr
        SetCreateThreadsAggressively : IntPtr
        GetMaxCSR                    : IntPtr
        SetMaxCSR                    : IntPtr
        GetWaitTimeForThreadCleanup  : IntPtr
        SetWaitTimeForThreadCleanup  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComStaThreadPoolKnobs2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCPULoad() {
        result := ComCall(14, this, "uint*", &pdwLoad := 0, "HRESULT")
        return pdwLoad
    }

    /**
     * 
     * @param {Integer} pdwLoad 
     * @returns {HRESULT} 
     */
    SetMaxCPULoad(pdwLoad) {
        result := ComCall(15, this, "int", pdwLoad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetCPUMetricEnabled() {
        result := ComCall(16, this, BOOL.Ptr, &pbMetricEnabled := 0, "HRESULT")
        return pbMetricEnabled
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCPUMetricEnabled(bMetricEnabled) {
        result := ComCall(17, this, BOOL, bMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetCreateThreadsAggressively() {
        result := ComCall(18, this, BOOL.Ptr, &pbMetricEnabled := 0, "HRESULT")
        return pbMetricEnabled
    }

    /**
     * 
     * @param {BOOL} bMetricEnabled 
     * @returns {HRESULT} 
     */
    SetCreateThreadsAggressively(bMetricEnabled) {
        result := ComCall(19, this, BOOL, bMetricEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCSR() {
        result := ComCall(20, this, "uint*", &pdwCSR := 0, "HRESULT")
        return pdwCSR
    }

    /**
     * 
     * @param {Integer} dwCSR 
     * @returns {HRESULT} 
     */
    SetMaxCSR(dwCSR) {
        result := ComCall(21, this, "int", dwCSR, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetWaitTimeForThreadCleanup() {
        result := ComCall(22, this, "uint*", &pdwThreadCleanupWaitTime := 0, "HRESULT")
        return pdwThreadCleanupWaitTime
    }

    /**
     * 
     * @param {Integer} dwThreadCleanupWaitTime 
     * @returns {HRESULT} 
     */
    SetWaitTimeForThreadCleanup(dwThreadCleanupWaitTime) {
        result := ComCall(23, this, "int", dwThreadCleanupWaitTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComStaThreadPoolKnobs2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxCPULoad := CallbackCreate(GetMethod(implObj, "GetMaxCPULoad"), flags, 2)
        this.vtbl.SetMaxCPULoad := CallbackCreate(GetMethod(implObj, "SetMaxCPULoad"), flags, 2)
        this.vtbl.GetCPUMetricEnabled := CallbackCreate(GetMethod(implObj, "GetCPUMetricEnabled"), flags, 2)
        this.vtbl.SetCPUMetricEnabled := CallbackCreate(GetMethod(implObj, "SetCPUMetricEnabled"), flags, 2)
        this.vtbl.GetCreateThreadsAggressively := CallbackCreate(GetMethod(implObj, "GetCreateThreadsAggressively"), flags, 2)
        this.vtbl.SetCreateThreadsAggressively := CallbackCreate(GetMethod(implObj, "SetCreateThreadsAggressively"), flags, 2)
        this.vtbl.GetMaxCSR := CallbackCreate(GetMethod(implObj, "GetMaxCSR"), flags, 2)
        this.vtbl.SetMaxCSR := CallbackCreate(GetMethod(implObj, "SetMaxCSR"), flags, 2)
        this.vtbl.GetWaitTimeForThreadCleanup := CallbackCreate(GetMethod(implObj, "GetWaitTimeForThreadCleanup"), flags, 2)
        this.vtbl.SetWaitTimeForThreadCleanup := CallbackCreate(GetMethod(implObj, "SetWaitTimeForThreadCleanup"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxCPULoad)
        CallbackFree(this.vtbl.SetMaxCPULoad)
        CallbackFree(this.vtbl.GetCPUMetricEnabled)
        CallbackFree(this.vtbl.SetCPUMetricEnabled)
        CallbackFree(this.vtbl.GetCreateThreadsAggressively)
        CallbackFree(this.vtbl.SetCreateThreadsAggressively)
        CallbackFree(this.vtbl.GetMaxCSR)
        CallbackFree(this.vtbl.SetMaxCSR)
        CallbackFree(this.vtbl.GetWaitTimeForThreadCleanup)
        CallbackFree(this.vtbl.SetWaitTimeForThreadCleanup)
    }
}
