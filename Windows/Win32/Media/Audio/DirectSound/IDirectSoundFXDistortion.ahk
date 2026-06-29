#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DSFXDistortion.ahk" { DSFXDistortion }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFXDistortion extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFXDistortion
     * @type {Guid}
     */
    static IID := Guid("{8ecf4326-455f-4d8b-bda9-8d5d3e9e3e0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFXDistortion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFXDistortion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSFXDistortion>} pcDsFxDistortion 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxDistortion) {
        result := ComCall(3, this, DSFXDistortion.Ptr, pcDsFxDistortion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXDistortion} 
     */
    GetAllParameters() {
        pDsFxDistortion := DSFXDistortion()
        result := ComCall(4, this, DSFXDistortion.Ptr, pDsFxDistortion, "HRESULT")
        return pDsFxDistortion
    }

    Query(iid) {
        if (IDirectSoundFXDistortion.IID.Equals(iid)) {
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
