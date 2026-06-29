#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DSCFXAec.ahk" { DSCFXAec }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundCaptureFXAec extends IUnknown {
    /**
     * The interface identifier for IDirectSoundCaptureFXAec
     * @type {Guid}
     */
    static IID := Guid("{ad74143d-903d-4ab7-8066-28d363036d65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundCaptureFXAec interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
        GetStatus        : IntPtr
        Reset            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundCaptureFXAec.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSCFXAec>} pDscFxAec 
     * @returns {HRESULT} 
     */
    SetAllParameters(pDscFxAec) {
        result := ComCall(3, this, DSCFXAec.Ptr, pDscFxAec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSCFXAec} 
     */
    GetAllParameters() {
        pDscFxAec := DSCFXAec()
        result := ComCall(4, this, DSCFXAec.Ptr, pDscFxAec, "HRESULT")
        return pDscFxAec
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStatus() {
        result := ComCall(5, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectSoundCaptureFXAec.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 2)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.GetAllParameters)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.Reset)
    }
}
