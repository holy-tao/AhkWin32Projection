#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicInstrument extends IUnknown {
    /**
     * The interface identifier for IDirectMusicInstrument
     * @type {Guid}
     */
    static IID := Guid("{d2ac287d-b39b-11d1-8704-00600893b1bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicInstrument interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPatch : IntPtr
        SetPatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicInstrument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPatch 
     * @returns {HRESULT} 
     */
    GetPatch(pdwPatch) {
        pdwPatchMarshal := pdwPatch is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwPatchMarshal, pdwPatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPatch 
     * @returns {HRESULT} 
     */
    SetPatch(dwPatch) {
        result := ComCall(4, this, "uint", dwPatch, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicInstrument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPatch := CallbackCreate(GetMethod(implObj, "GetPatch"), flags, 2)
        this.vtbl.SetPatch := CallbackCreate(GetMethod(implObj, "SetPatch"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPatch)
        CallbackFree(this.vtbl.SetPatch)
    }
}
