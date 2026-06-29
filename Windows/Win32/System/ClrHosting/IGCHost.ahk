#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_GC_THREAD_STATS.ahk" { COR_GC_THREAD_STATS }
#Import ".\COR_GC_STATS.ahk" { COR_GC_STATS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IGCHost extends IUnknown {
    /**
     * The interface identifier for IGCHost
     * @type {Guid}
     */
    static IID := Guid("{fac34f6e-0dcd-47b5-8021-531bc5ecca63}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGCHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGCStartupLimits : IntPtr
        Collect            : IntPtr
        GetStats           : IntPtr
        GetThreadStats     : IntPtr
        SetVirtualMemLimit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGCHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} SegmentSize 
     * @param {Integer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimits(SegmentSize, MaxGen0Size) {
        result := ComCall(3, this, "uint", SegmentSize, "uint", MaxGen0Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    Collect(Generation) {
        result := ComCall(4, this, "int", Generation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COR_GC_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetStats(pStats) {
        result := ComCall(5, this, COR_GC_STATS.Ptr, pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFiberCookie 
     * @param {Pointer<COR_GC_THREAD_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetThreadStats(pFiberCookie, pStats) {
        pFiberCookieMarshal := pFiberCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pFiberCookieMarshal, pFiberCookie, COR_GC_THREAD_STATS.Ptr, pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} sztMaxVirtualMemMB 
     * @returns {HRESULT} 
     */
    SetVirtualMemLimit(sztMaxVirtualMemMB) {
        result := ComCall(7, this, "ptr", sztMaxVirtualMemMB, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGCHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGCStartupLimits := CallbackCreate(GetMethod(implObj, "SetGCStartupLimits"), flags, 3)
        this.vtbl.Collect := CallbackCreate(GetMethod(implObj, "Collect"), flags, 2)
        this.vtbl.GetStats := CallbackCreate(GetMethod(implObj, "GetStats"), flags, 2)
        this.vtbl.GetThreadStats := CallbackCreate(GetMethod(implObj, "GetThreadStats"), flags, 3)
        this.vtbl.SetVirtualMemLimit := CallbackCreate(GetMethod(implObj, "SetVirtualMemLimit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGCStartupLimits)
        CallbackFree(this.vtbl.Collect)
        CallbackFree(this.vtbl.GetStats)
        CallbackFree(this.vtbl.GetThreadStats)
        CallbackFree(this.vtbl.SetVirtualMemLimit)
    }
}
