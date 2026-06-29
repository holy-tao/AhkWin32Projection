#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectMusicInstrument.ahk" { IDirectMusicInstrument }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicCollection extends IUnknown {
    /**
     * The interface identifier for IDirectMusicCollection
     * @type {Guid}
     */
    static IID := Guid("{d2ac287c-b39b-11d1-8704-00600893b1bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInstrument  : IntPtr
        EnumInstrument : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwPatch 
     * @returns {IDirectMusicInstrument} 
     */
    GetInstrument(dwPatch) {
        result := ComCall(3, this, "uint", dwPatch, "ptr*", &ppInstrument := 0, "HRESULT")
        return IDirectMusicInstrument(ppInstrument)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} pdwPatch 
     * @param {PWSTR} pwszName 
     * @param {Integer} dwNameLen 
     * @returns {HRESULT} 
     */
    EnumInstrument(dwIndex, pdwPatch, pwszName, dwNameLen) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pdwPatchMarshal := pdwPatch is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwIndex, pdwPatchMarshal, pdwPatch, "ptr", pwszName, "uint", dwNameLen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInstrument := CallbackCreate(GetMethod(implObj, "GetInstrument"), flags, 3)
        this.vtbl.EnumInstrument := CallbackCreate(GetMethod(implObj, "EnumInstrument"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInstrument)
        CallbackFree(this.vtbl.EnumInstrument)
    }
}
