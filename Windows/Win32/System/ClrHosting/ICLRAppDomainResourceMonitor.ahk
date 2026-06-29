#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRAppDomainResourceMonitor extends IUnknown {
    /**
     * The interface identifier for ICLRAppDomainResourceMonitor
     * @type {Guid}
     */
    static IID := Guid("{c62de18c-2e23-4aea-8423-b40c1fc59eae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRAppDomainResourceMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentAllocated : IntPtr
        GetCurrentSurvived  : IntPtr
        GetCurrentCpuTime   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRAppDomainResourceMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pBytesAllocated 
     * @returns {HRESULT} 
     */
    GetCurrentAllocated(dwAppDomainId, pBytesAllocated) {
        pBytesAllocatedMarshal := pBytesAllocated is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwAppDomainId, pBytesAllocatedMarshal, pBytesAllocated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pAppDomainBytesSurvived 
     * @param {Pointer<Integer>} pTotalBytesSurvived 
     * @returns {HRESULT} 
     */
    GetCurrentSurvived(dwAppDomainId, pAppDomainBytesSurvived, pTotalBytesSurvived) {
        pAppDomainBytesSurvivedMarshal := pAppDomainBytesSurvived is VarRef ? "uint*" : "ptr"
        pTotalBytesSurvivedMarshal := pTotalBytesSurvived is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwAppDomainId, pAppDomainBytesSurvivedMarshal, pAppDomainBytesSurvived, pTotalBytesSurvivedMarshal, pTotalBytesSurvived, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pMilliseconds 
     * @returns {HRESULT} 
     */
    GetCurrentCpuTime(dwAppDomainId, pMilliseconds) {
        pMillisecondsMarshal := pMilliseconds is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwAppDomainId, pMillisecondsMarshal, pMilliseconds, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRAppDomainResourceMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentAllocated := CallbackCreate(GetMethod(implObj, "GetCurrentAllocated"), flags, 3)
        this.vtbl.GetCurrentSurvived := CallbackCreate(GetMethod(implObj, "GetCurrentSurvived"), flags, 4)
        this.vtbl.GetCurrentCpuTime := CallbackCreate(GetMethod(implObj, "GetCurrentCpuTime"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentAllocated)
        CallbackFree(this.vtbl.GetCurrentSurvived)
        CallbackFree(this.vtbl.GetCurrentCpuTime)
    }
}
