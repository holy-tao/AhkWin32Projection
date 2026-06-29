#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGCHost.ahk" { IGCHost }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IGCHost2 extends IGCHost {
    /**
     * The interface identifier for IGCHost2
     * @type {Guid}
     */
    static IID := Guid("{a1d70cec-2dbe-4e2f-9291-fdf81438a1df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGCHost2 interfaces
    */
    struct Vtbl extends IGCHost.Vtbl {
        SetGCStartupLimitsEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGCHost2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} SegmentSize 
     * @param {Pointer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimitsEx(SegmentSize, MaxGen0Size) {
        result := ComCall(8, this, "ptr", SegmentSize, "ptr", MaxGen0Size, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGCHost2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGCStartupLimitsEx := CallbackCreate(GetMethod(implObj, "SetGCStartupLimitsEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGCStartupLimitsEx)
    }
}
