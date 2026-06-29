#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSFXI3DL2Reverb.ahk" { DSFXI3DL2Reverb }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFXI3DL2Reverb extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFXI3DL2Reverb
     * @type {Guid}
     */
    static IID := Guid("{4b166a6a-0d66-43f3-80e3-ee6280dee1a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFXI3DL2Reverb interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
        SetPreset        : IntPtr
        GetPreset        : IntPtr
        SetQuality       : IntPtr
        GetQuality       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFXI3DL2Reverb.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSFXI3DL2Reverb>} pcDsFxI3DL2Reverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxI3DL2Reverb) {
        result := ComCall(3, this, DSFXI3DL2Reverb.Ptr, pcDsFxI3DL2Reverb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXI3DL2Reverb} 
     */
    GetAllParameters() {
        pDsFxI3DL2Reverb := DSFXI3DL2Reverb()
        result := ComCall(4, this, DSFXI3DL2Reverb.Ptr, pDsFxI3DL2Reverb, "HRESULT")
        return pDsFxI3DL2Reverb
    }

    /**
     * 
     * @param {Integer} dwPreset 
     * @returns {HRESULT} 
     */
    SetPreset(dwPreset) {
        result := ComCall(5, this, "uint", dwPreset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPreset() {
        result := ComCall(6, this, "uint*", &pdwPreset := 0, "HRESULT")
        return pdwPreset
    }

    /**
     * 
     * @param {Integer} lQuality 
     * @returns {HRESULT} 
     */
    SetQuality(lQuality) {
        result := ComCall(7, this, "int", lQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetQuality() {
        result := ComCall(8, this, "int*", &plQuality := 0, "HRESULT")
        return plQuality
    }

    Query(iid) {
        if (IDirectSoundFXI3DL2Reverb.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 2)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
        this.vtbl.SetPreset := CallbackCreate(GetMethod(implObj, "SetPreset"), flags, 2)
        this.vtbl.GetPreset := CallbackCreate(GetMethod(implObj, "GetPreset"), flags, 2)
        this.vtbl.SetQuality := CallbackCreate(GetMethod(implObj, "SetQuality"), flags, 2)
        this.vtbl.GetQuality := CallbackCreate(GetMethod(implObj, "GetQuality"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.GetAllParameters)
        CallbackFree(this.vtbl.SetPreset)
        CallbackFree(this.vtbl.GetPreset)
        CallbackFree(this.vtbl.SetQuality)
        CallbackFree(this.vtbl.GetQuality)
    }
}
