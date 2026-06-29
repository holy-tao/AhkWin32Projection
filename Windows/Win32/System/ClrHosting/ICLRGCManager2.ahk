#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICLRGCManager.ahk" { ICLRGCManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRGCManager2 extends ICLRGCManager {
    /**
     * The interface identifier for ICLRGCManager2
     * @type {Guid}
     */
    static IID := Guid("{0603b793-a97a-4712-9cb4-0cd1c74c0f7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRGCManager2 interfaces
    */
    struct Vtbl extends ICLRGCManager.Vtbl {
        SetGCStartupLimitsEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRGCManager2.Vtbl()
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
        result := ComCall(6, this, "ptr", SegmentSize, "ptr", MaxGen0Size, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRGCManager2.IID.Equals(iid)) {
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
