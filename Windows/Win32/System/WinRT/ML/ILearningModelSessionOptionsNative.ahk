#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ILearningModelSessionOptionsNative extends IUnknown {
    /**
     * The interface identifier for ILearningModelSessionOptionsNative
     * @type {Guid}
     */
    static IID := Guid("{c71e953f-37b4-4564-8658-d8396866db0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILearningModelSessionOptionsNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIntraOpNumThreadsOverride : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILearningModelSessionOptionsNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} intraOpNumThreads 
     * @returns {HRESULT} 
     */
    SetIntraOpNumThreadsOverride(intraOpNumThreads) {
        result := ComCall(3, this, "uint", intraOpNumThreads, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILearningModelSessionOptionsNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIntraOpNumThreadsOverride := CallbackCreate(GetMethod(implObj, "SetIntraOpNumThreadsOverride"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIntraOpNumThreadsOverride)
    }
}
