#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSFXParamEq.ahk" { DSFXParamEq }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFXParamEq extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFXParamEq
     * @type {Guid}
     */
    static IID := Guid("{c03ca9fe-fe90-4204-8078-82334cd177da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFXParamEq interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFXParamEq.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSFXParamEq>} pcDsFxParamEq 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxParamEq) {
        result := ComCall(3, this, DSFXParamEq.Ptr, pcDsFxParamEq, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXParamEq} 
     */
    GetAllParameters() {
        pDsFxParamEq := DSFXParamEq()
        result := ComCall(4, this, DSFXParamEq.Ptr, pDsFxParamEq, "HRESULT")
        return pDsFxParamEq
    }

    Query(iid) {
        if (IDirectSoundFXParamEq.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 2)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.GetAllParameters)
    }
}
