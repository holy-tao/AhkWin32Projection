#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpObjectWithToken.ahk" { ISpObjectWithToken }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhoneConverter extends ISpObjectWithToken {
    /**
     * The interface identifier for ISpPhoneConverter
     * @type {Guid}
     */
    static IID := Guid("{8445c581-0cac-4a38-abfe-9b2ce2826455}")

    /**
     * The class identifier for SpPhoneConverter
     * @type {Guid}
     */
    static CLSID := Guid("{9185f743-1143-4c28-86b5-bff14f20e5c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhoneConverter interfaces
    */
    struct Vtbl extends ISpObjectWithToken.Vtbl {
        PhoneToId : IntPtr
        IdToPhone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhoneConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszPhone 
     * @returns {Integer} 
     */
    PhoneToId(pszPhone) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        result := ComCall(5, this, "ptr", pszPhone, "ushort*", &pId := 0, "HRESULT")
        return pId
    }

    /**
     * 
     * @param {Pointer<Integer>} pId 
     * @param {PWSTR} pszPhone 
     * @returns {HRESULT} 
     */
    IdToPhone(pId, pszPhone) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        pIdMarshal := pId is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pIdMarshal, pId, "ptr", pszPhone, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPhoneConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PhoneToId := CallbackCreate(GetMethod(implObj, "PhoneToId"), flags, 3)
        this.vtbl.IdToPhone := CallbackCreate(GetMethod(implObj, "IdToPhone"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PhoneToId)
        CallbackFree(this.vtbl.IdToPhone)
    }
}
