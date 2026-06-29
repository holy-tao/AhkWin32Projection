#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpObjectToken.ahk" { ISpObjectToken }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEnumSpObjectTokens.ahk" { IEnumSpObjectTokens }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpDataKey.ahk" { ISpDataKey }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpObjectTokenEnumBuilder extends IEnumSpObjectTokens {
    /**
     * The interface identifier for ISpObjectTokenEnumBuilder
     * @type {Guid}
     */
    static IID := Guid("{06b64f9f-7fda-11d2-b4f2-00c04f797396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpObjectTokenEnumBuilder interfaces
    */
    struct Vtbl extends IEnumSpObjectTokens.Vtbl {
        SetAttribs             : IntPtr
        AddTokens              : IntPtr
        AddTokensFromDataKey   : IntPtr
        AddTokensFromTokenEnum : IntPtr
        Sort                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpObjectTokenEnumBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszReqAttribs 
     * @param {PWSTR} pszOptAttribs 
     * @returns {HRESULT} 
     */
    SetAttribs(pszReqAttribs, pszOptAttribs) {
        pszReqAttribs := pszReqAttribs is String ? StrPtr(pszReqAttribs) : pszReqAttribs
        pszOptAttribs := pszOptAttribs is String ? StrPtr(pszOptAttribs) : pszOptAttribs

        result := ComCall(9, this, "ptr", pszReqAttribs, "ptr", pszOptAttribs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cTokens 
     * @param {Pointer<ISpObjectToken>} pToken 
     * @returns {HRESULT} 
     */
    AddTokens(cTokens, pToken) {
        result := ComCall(10, this, "uint", cTokens, ISpObjectToken.Ptr, pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpDataKey} pDataKey 
     * @param {PWSTR} pszSubKey 
     * @param {PWSTR} pszCategoryId 
     * @returns {HRESULT} 
     */
    AddTokensFromDataKey(pDataKey, pszSubKey, pszCategoryId) {
        pszSubKey := pszSubKey is String ? StrPtr(pszSubKey) : pszSubKey
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId

        result := ComCall(11, this, "ptr", pDataKey, "ptr", pszSubKey, "ptr", pszCategoryId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IEnumSpObjectTokens} pTokenEnum 
     * @returns {HRESULT} 
     */
    AddTokensFromTokenEnum(pTokenEnum) {
        result := ComCall(12, this, "ptr", pTokenEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTokenIdToListFirst 
     * @returns {HRESULT} 
     */
    Sort(pszTokenIdToListFirst) {
        pszTokenIdToListFirst := pszTokenIdToListFirst is String ? StrPtr(pszTokenIdToListFirst) : pszTokenIdToListFirst

        result := ComCall(13, this, "ptr", pszTokenIdToListFirst, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpObjectTokenEnumBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAttribs := CallbackCreate(GetMethod(implObj, "SetAttribs"), flags, 3)
        this.vtbl.AddTokens := CallbackCreate(GetMethod(implObj, "AddTokens"), flags, 3)
        this.vtbl.AddTokensFromDataKey := CallbackCreate(GetMethod(implObj, "AddTokensFromDataKey"), flags, 4)
        this.vtbl.AddTokensFromTokenEnum := CallbackCreate(GetMethod(implObj, "AddTokensFromTokenEnum"), flags, 2)
        this.vtbl.Sort := CallbackCreate(GetMethod(implObj, "Sort"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAttribs)
        CallbackFree(this.vtbl.AddTokens)
        CallbackFree(this.vtbl.AddTokensFromDataKey)
        CallbackFree(this.vtbl.AddTokensFromTokenEnum)
        CallbackFree(this.vtbl.Sort)
    }
}
