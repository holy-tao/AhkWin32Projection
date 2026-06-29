#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DSFXWavesReverb.ahk" { DSFXWavesReverb }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFXWavesReverb extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFXWavesReverb
     * @type {Guid}
     */
    static IID := Guid("{46858c3a-0dc6-45e3-b760-d4eef16cb325}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFXWavesReverb interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFXWavesReverb.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSFXWavesReverb>} pcDsFxWavesReverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxWavesReverb) {
        result := ComCall(3, this, DSFXWavesReverb.Ptr, pcDsFxWavesReverb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXWavesReverb} 
     */
    GetAllParameters() {
        pDsFxWavesReverb := DSFXWavesReverb()
        result := ComCall(4, this, DSFXWavesReverb.Ptr, pDsFxWavesReverb, "HRESULT")
        return pDsFxWavesReverb
    }

    Query(iid) {
        if (IDirectSoundFXWavesReverb.IID.Equals(iid)) {
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
