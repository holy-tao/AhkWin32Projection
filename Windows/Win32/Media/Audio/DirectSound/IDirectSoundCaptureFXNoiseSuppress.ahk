#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DSCFXNoiseSuppress.ahk" { DSCFXNoiseSuppress }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundCaptureFXNoiseSuppress extends IUnknown {
    /**
     * The interface identifier for IDirectSoundCaptureFXNoiseSuppress
     * @type {Guid}
     */
    static IID := Guid("{ed311e41-fbae-4175-9625-cd0854f693ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundCaptureFXNoiseSuppress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
        Reset            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundCaptureFXNoiseSuppress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSCFXNoiseSuppress>} pcDscFxNoiseSuppress 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDscFxNoiseSuppress) {
        result := ComCall(3, this, DSCFXNoiseSuppress.Ptr, pcDscFxNoiseSuppress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSCFXNoiseSuppress} 
     */
    GetAllParameters() {
        pDscFxNoiseSuppress := DSCFXNoiseSuppress()
        result := ComCall(4, this, DSCFXNoiseSuppress.Ptr, pDscFxNoiseSuppress, "HRESULT")
        return pDscFxNoiseSuppress
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSoundCaptureFXNoiseSuppress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 2)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.GetAllParameters)
        CallbackFree(this.vtbl.Reset)
    }
}
