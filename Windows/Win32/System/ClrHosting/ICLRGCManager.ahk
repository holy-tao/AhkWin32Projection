#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_GC_STATS.ahk" { COR_GC_STATS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRGCManager extends IUnknown {
    /**
     * The interface identifier for ICLRGCManager
     * @type {Guid}
     */
    static IID := Guid("{54d9007e-a8e2-4885-b7bf-f998deee4f2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRGCManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Collect            : IntPtr
        GetStats           : IntPtr
        SetGCStartupLimits : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRGCManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    Collect(Generation) {
        result := ComCall(3, this, "int", Generation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COR_GC_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetStats(pStats) {
        result := ComCall(4, this, COR_GC_STATS.Ptr, pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SegmentSize 
     * @param {Integer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimits(SegmentSize, MaxGen0Size) {
        result := ComCall(5, this, "uint", SegmentSize, "uint", MaxGen0Size, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRGCManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Collect := CallbackCreate(GetMethod(implObj, "Collect"), flags, 2)
        this.vtbl.GetStats := CallbackCreate(GetMethod(implObj, "GetStats"), flags, 2)
        this.vtbl.SetGCStartupLimits := CallbackCreate(GetMethod(implObj, "SetGCStartupLimits"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Collect)
        CallbackFree(this.vtbl.GetStats)
        CallbackFree(this.vtbl.SetGCStartupLimits)
    }
}
