#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPSHORTCUTPAIRLIST.ahk" { SPSHORTCUTPAIRLIST }
#Import ".\SPSHORTCUTTYPE.ahk" { SPSHORTCUTTYPE }
#Import ".\SPWORDLIST.ahk" { SPWORDLIST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpShortcut extends IUnknown {
    /**
     * The interface identifier for ISpShortcut
     * @type {Guid}
     */
    static IID := Guid("{3df681e2-ea56-11d9-8bde-f66bad1e3f3a}")

    /**
     * The class identifier for SpShortcut
     * @type {Guid}
     */
    static CLSID := Guid("{0d722f1a-9fcf-4e62-96d8-6df8f01a26aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpShortcut interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddShortcut                  : IntPtr
        RemoveShortcut               : IntPtr
        GetShortcuts                 : IntPtr
        GetGeneration                : IntPtr
        GetWordsFromGenerationChange : IntPtr
        GetWords                     : IntPtr
        GetShortcutsForGeneration    : IntPtr
        GetGenerationChange          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpShortcut.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszDisplay 
     * @param {Integer} LangID 
     * @param {PWSTR} pszSpoken 
     * @param {SPSHORTCUTTYPE} shType 
     * @returns {HRESULT} 
     */
    AddShortcut(pszDisplay, LangID, pszSpoken, shType) {
        pszDisplay := pszDisplay is String ? StrPtr(pszDisplay) : pszDisplay
        pszSpoken := pszSpoken is String ? StrPtr(pszSpoken) : pszSpoken

        result := ComCall(3, this, "ptr", pszDisplay, "ushort", LangID, "ptr", pszSpoken, SPSHORTCUTTYPE, shType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDisplay 
     * @param {Integer} LangID 
     * @param {PWSTR} pszSpoken 
     * @param {SPSHORTCUTTYPE} shType 
     * @returns {HRESULT} 
     */
    RemoveShortcut(pszDisplay, LangID, pszSpoken, shType) {
        pszDisplay := pszDisplay is String ? StrPtr(pszDisplay) : pszDisplay
        pszSpoken := pszSpoken is String ? StrPtr(pszSpoken) : pszSpoken

        result := ComCall(4, this, "ptr", pszDisplay, "ushort", LangID, "ptr", pszSpoken, SPSHORTCUTTYPE, shType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetShortcuts(LangID, pShortcutpairList) {
        result := ComCall(5, this, "ushort", LangID, SPSHORTCUTPAIRLIST.Ptr, pShortcutpairList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGeneration() {
        result := ComCall(6, this, "uint*", &pdwGeneration := 0, "HRESULT")
        return pdwGeneration
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWordsFromGenerationChange(pdwGeneration, pWordList) {
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwGenerationMarshal, pdwGeneration, SPWORDLIST.Ptr, pWordList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<SPWORDLIST>} pWordList 
     * @returns {HRESULT} 
     */
    GetWords(pdwGeneration, pdwCookie, pWordList) {
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwGenerationMarshal, pdwGeneration, pdwCookieMarshal, pdwCookie, SPWORDLIST.Ptr, pWordList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetShortcutsForGeneration(pdwGeneration, pdwCookie, pShortcutpairList) {
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwGenerationMarshal, pdwGeneration, pdwCookieMarshal, pdwCookie, SPSHORTCUTPAIRLIST.Ptr, pShortcutpairList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwGeneration 
     * @param {Pointer<SPSHORTCUTPAIRLIST>} pShortcutpairList 
     * @returns {HRESULT} 
     */
    GetGenerationChange(pdwGeneration, pShortcutpairList) {
        pdwGenerationMarshal := pdwGeneration is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwGenerationMarshal, pdwGeneration, SPSHORTCUTPAIRLIST.Ptr, pShortcutpairList, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpShortcut.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddShortcut := CallbackCreate(GetMethod(implObj, "AddShortcut"), flags, 5)
        this.vtbl.RemoveShortcut := CallbackCreate(GetMethod(implObj, "RemoveShortcut"), flags, 5)
        this.vtbl.GetShortcuts := CallbackCreate(GetMethod(implObj, "GetShortcuts"), flags, 3)
        this.vtbl.GetGeneration := CallbackCreate(GetMethod(implObj, "GetGeneration"), flags, 2)
        this.vtbl.GetWordsFromGenerationChange := CallbackCreate(GetMethod(implObj, "GetWordsFromGenerationChange"), flags, 3)
        this.vtbl.GetWords := CallbackCreate(GetMethod(implObj, "GetWords"), flags, 4)
        this.vtbl.GetShortcutsForGeneration := CallbackCreate(GetMethod(implObj, "GetShortcutsForGeneration"), flags, 4)
        this.vtbl.GetGenerationChange := CallbackCreate(GetMethod(implObj, "GetGenerationChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddShortcut)
        CallbackFree(this.vtbl.RemoveShortcut)
        CallbackFree(this.vtbl.GetShortcuts)
        CallbackFree(this.vtbl.GetGeneration)
        CallbackFree(this.vtbl.GetWordsFromGenerationChange)
        CallbackFree(this.vtbl.GetWords)
        CallbackFree(this.vtbl.GetShortcutsForGeneration)
        CallbackFree(this.vtbl.GetGenerationChange)
    }
}
