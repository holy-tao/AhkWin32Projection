#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPDATAKEYLOCATION.ahk" { SPDATAKEYLOCATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEnumSpObjectTokens.ahk" { IEnumSpObjectTokens }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISpDataKey.ahk" { ISpDataKey }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpObjectTokenCategory extends ISpDataKey {
    /**
     * The interface identifier for ISpObjectTokenCategory
     * @type {Guid}
     */
    static IID := Guid("{2d3d3845-39af-4850-bbf9-40b49780011d}")

    /**
     * The class identifier for SpObjectTokenCategory
     * @type {Guid}
     */
    static CLSID := Guid("{a910187f-0c7a-45ac-92cc-59edafb77b53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpObjectTokenCategory interfaces
    */
    struct Vtbl extends ISpDataKey.Vtbl {
        SetId             : IntPtr
        GetId             : IntPtr
        GetDataKey        : IntPtr
        EnumTokens        : IntPtr
        SetDefaultTokenId : IntPtr
        GetDefaultTokenId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpObjectTokenCategory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(pszCategoryId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId

        result := ComCall(15, this, "ptr", pszCategoryId, BOOL, fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetId() {
        result := ComCall(16, this, PWSTR.Ptr, &ppszCoMemCategoryId := 0, "HRESULT")
        return ppszCoMemCategoryId
    }

    /**
     * 
     * @param {SPDATAKEYLOCATION} spdkl 
     * @returns {ISpDataKey} 
     */
    GetDataKey(spdkl) {
        result := ComCall(17, this, SPDATAKEYLOCATION, spdkl, "ptr*", &ppDataKey := 0, "HRESULT")
        return ISpDataKey(ppDataKey)
    }

    /**
     * 
     * @param {PWSTR} pzsReqAttribs 
     * @param {PWSTR} pszOptAttribs 
     * @returns {IEnumSpObjectTokens} 
     */
    EnumTokens(pzsReqAttribs, pszOptAttribs) {
        pzsReqAttribs := pzsReqAttribs is String ? StrPtr(pzsReqAttribs) : pzsReqAttribs
        pszOptAttribs := pszOptAttribs is String ? StrPtr(pszOptAttribs) : pszOptAttribs

        result := ComCall(18, this, "ptr", pzsReqAttribs, "ptr", pszOptAttribs, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSpObjectTokens(ppEnum)
    }

    /**
     * 
     * @param {PWSTR} pszTokenId 
     * @returns {HRESULT} 
     */
    SetDefaultTokenId(pszTokenId) {
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(19, this, "ptr", pszTokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetDefaultTokenId() {
        result := ComCall(20, this, PWSTR.Ptr, &ppszCoMemTokenId := 0, "HRESULT")
        return ppszCoMemTokenId
    }

    Query(iid) {
        if (ISpObjectTokenCategory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetId := CallbackCreate(GetMethod(implObj, "SetId"), flags, 3)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetDataKey := CallbackCreate(GetMethod(implObj, "GetDataKey"), flags, 3)
        this.vtbl.EnumTokens := CallbackCreate(GetMethod(implObj, "EnumTokens"), flags, 4)
        this.vtbl.SetDefaultTokenId := CallbackCreate(GetMethod(implObj, "SetDefaultTokenId"), flags, 2)
        this.vtbl.GetDefaultTokenId := CallbackCreate(GetMethod(implObj, "GetDefaultTokenId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetDataKey)
        CallbackFree(this.vtbl.EnumTokens)
        CallbackFree(this.vtbl.SetDefaultTokenId)
        CallbackFree(this.vtbl.GetDefaultTokenId)
    }
}
