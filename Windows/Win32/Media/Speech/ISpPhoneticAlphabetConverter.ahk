#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhoneticAlphabetConverter extends IUnknown {
    /**
     * The interface identifier for ISpPhoneticAlphabetConverter
     * @type {Guid}
     */
    static IID := Guid("{133adcd4-19b4-4020-9fdc-842e78253b17}")

    /**
     * The class identifier for SpPhoneticAlphabetConverter
     * @type {Guid}
     */
    static CLSID := Guid("{4f414126-dfe3-4629-99ee-797978317ead}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhoneticAlphabetConverter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLangId           : IntPtr
        SetLangId           : IntPtr
        SAPI2UPS            : IntPtr
        UPS2SAPI            : IntPtr
        GetMaxConvertLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhoneticAlphabetConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLangId() {
        result := ComCall(3, this, "ushort*", &pLangID := 0, "HRESULT")
        return pLangID
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     */
    SetLangId(LangID) {
        result := ComCall(4, this, "ushort", LangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszSAPIId 
     * @param {Integer} cMaxLength 
     * @returns {Integer} 
     */
    SAPI2UPS(pszSAPIId, cMaxLength) {
        pszSAPIIdMarshal := pszSAPIId is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pszSAPIIdMarshal, pszSAPIId, "ushort*", &pszUPSId := 0, "uint", cMaxLength, "HRESULT")
        return pszUPSId
    }

    /**
     * 
     * @param {Pointer<Integer>} pszUPSId 
     * @param {Integer} cMaxLength 
     * @returns {Integer} 
     */
    UPS2SAPI(pszUPSId, cMaxLength) {
        pszUPSIdMarshal := pszUPSId is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pszUPSIdMarshal, pszUPSId, "ushort*", &pszSAPIId := 0, "uint", cMaxLength, "HRESULT")
        return pszSAPIId
    }

    /**
     * 
     * @param {Integer} cSrcLength 
     * @param {BOOL} bSAPI2UPS 
     * @returns {Integer} 
     */
    GetMaxConvertLength(cSrcLength, bSAPI2UPS) {
        result := ComCall(7, this, "uint", cSrcLength, BOOL, bSAPI2UPS, "uint*", &pcMaxDestLength := 0, "HRESULT")
        return pcMaxDestLength
    }

    Query(iid) {
        if (ISpPhoneticAlphabetConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLangId := CallbackCreate(GetMethod(implObj, "GetLangId"), flags, 2)
        this.vtbl.SetLangId := CallbackCreate(GetMethod(implObj, "SetLangId"), flags, 2)
        this.vtbl.SAPI2UPS := CallbackCreate(GetMethod(implObj, "SAPI2UPS"), flags, 4)
        this.vtbl.UPS2SAPI := CallbackCreate(GetMethod(implObj, "UPS2SAPI"), flags, 4)
        this.vtbl.GetMaxConvertLength := CallbackCreate(GetMethod(implObj, "GetMaxConvertLength"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLangId)
        CallbackFree(this.vtbl.SetLangId)
        CallbackFree(this.vtbl.SAPI2UPS)
        CallbackFree(this.vtbl.UPS2SAPI)
        CallbackFree(this.vtbl.GetMaxConvertLength)
    }
}
