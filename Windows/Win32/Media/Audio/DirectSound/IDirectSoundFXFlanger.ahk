#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSFXFlanger.ahk" { DSFXFlanger }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSoundFXFlanger extends IUnknown {
    /**
     * The interface identifier for IDirectSoundFXFlanger
     * @type {Guid}
     */
    static IID := Guid("{903e9878-2c92-4072-9b2c-ea68f5396783}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSoundFXFlanger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllParameters : IntPtr
        GetAllParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSoundFXFlanger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DSFXFlanger>} pcDsFxFlanger 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxFlanger) {
        result := ComCall(3, this, DSFXFlanger.Ptr, pcDsFxFlanger, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXFlanger} 
     */
    GetAllParameters() {
        pDsFxFlanger := DSFXFlanger()
        result := ComCall(4, this, DSFXFlanger.Ptr, pDsFxFlanger, "HRESULT")
        return pDsFxFlanger
    }

    Query(iid) {
        if (IDirectSoundFXFlanger.IID.Equals(iid)) {
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
