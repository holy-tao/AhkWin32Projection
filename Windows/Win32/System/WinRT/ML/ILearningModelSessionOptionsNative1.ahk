#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ILearningModelSessionOptionsNative1 extends IUnknown {
    /**
     * The interface identifier for ILearningModelSessionOptionsNative1
     * @type {Guid}
     */
    static IID := Guid("{5da37a26-0526-414b-91e4-2a0fa3ddba40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILearningModelSessionOptionsNative1 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIntraOpThreadSpinning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILearningModelSessionOptionsNative1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} allowSpinning 
     * @returns {HRESULT} 
     */
    SetIntraOpThreadSpinning(allowSpinning) {
        result := ComCall(3, this, "char", allowSpinning, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILearningModelSessionOptionsNative1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIntraOpThreadSpinning := CallbackCreate(GetMethod(implObj, "SetIntraOpThreadSpinning"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIntraOpThreadSpinning)
    }
}
