#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPPROPERTYINFO.ahk" { SPPROPERTYINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPGRAMMARWORDTYPE.ahk" { SPGRAMMARWORDTYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpGrammarBuilder extends IUnknown {
    /**
     * The interface identifier for ISpGrammarBuilder
     * @type {Guid}
     */
    static IID := Guid("{8137828f-591a-4a42-be58-49ea7ebaac68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpGrammarBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResetGrammar      : IntPtr
        GetRule           : IntPtr
        ClearRule         : IntPtr
        CreateNewState    : IntPtr
        AddWordTransition : IntPtr
        AddRuleTransition : IntPtr
        AddResource       : IntPtr
        Commit            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpGrammarBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} NewLanguage 
     * @returns {HRESULT} 
     */
    ResetGrammar(NewLanguage) {
        result := ComCall(3, this, "ushort", NewLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRuleName 
     * @param {Integer} dwRuleId 
     * @param {Integer} dwAttributes 
     * @param {BOOL} fCreateIfNotExist 
     * @param {Pointer<SPSTATEHANDLE>} phInitialState 
     * @returns {HRESULT} 
     */
    GetRule(pszRuleName, dwRuleId, dwAttributes, fCreateIfNotExist, phInitialState) {
        pszRuleName := pszRuleName is String ? StrPtr(pszRuleName) : pszRuleName

        result := ComCall(4, this, "ptr", pszRuleName, "uint", dwRuleId, "uint", dwAttributes, BOOL, fCreateIfNotExist, SPSTATEHANDLE.Ptr, phInitialState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @returns {HRESULT} 
     */
    ClearRule(hState) {
        result := ComCall(5, this, SPSTATEHANDLE, hState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @param {Pointer<SPSTATEHANDLE>} phState 
     * @returns {HRESULT} 
     */
    CreateNewState(hState, phState) {
        result := ComCall(6, this, SPSTATEHANDLE, hState, SPSTATEHANDLE.Ptr, phState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hFromState 
     * @param {SPSTATEHANDLE} hToState 
     * @param {PWSTR} psz 
     * @param {PWSTR} pszSeparators 
     * @param {SPGRAMMARWORDTYPE} eWordType 
     * @param {Float} Weight 
     * @param {Pointer<SPPROPERTYINFO>} pPropInfo 
     * @returns {HRESULT} 
     */
    AddWordTransition(hFromState, hToState, psz, pszSeparators, eWordType, Weight, pPropInfo) {
        psz := psz is String ? StrPtr(psz) : psz
        pszSeparators := pszSeparators is String ? StrPtr(pszSeparators) : pszSeparators

        result := ComCall(7, this, SPSTATEHANDLE, hFromState, SPSTATEHANDLE, hToState, "ptr", psz, "ptr", pszSeparators, SPGRAMMARWORDTYPE, eWordType, "float", Weight, SPPROPERTYINFO.Ptr, pPropInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hFromState 
     * @param {SPSTATEHANDLE} hToState 
     * @param {SPSTATEHANDLE} hRule 
     * @param {Float} Weight 
     * @param {Pointer<SPPROPERTYINFO>} pPropInfo 
     * @returns {HRESULT} 
     */
    AddRuleTransition(hFromState, hToState, hRule, Weight, pPropInfo) {
        result := ComCall(8, this, SPSTATEHANDLE, hFromState, SPSTATEHANDLE, hToState, SPSTATEHANDLE, hRule, "float", Weight, SPPROPERTYINFO.Ptr, pPropInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hRuleState 
     * @param {PWSTR} pszResourceName 
     * @param {PWSTR} pszResourceValue 
     * @returns {HRESULT} 
     */
    AddResource(hRuleState, pszResourceName, pszResourceValue) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName
        pszResourceValue := pszResourceValue is String ? StrPtr(pszResourceValue) : pszResourceValue

        result := ComCall(9, this, SPSTATEHANDLE, hRuleState, "ptr", pszResourceName, "ptr", pszResourceValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Commit(dwReserved) {
        result := ComCall(10, this, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpGrammarBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResetGrammar := CallbackCreate(GetMethod(implObj, "ResetGrammar"), flags, 2)
        this.vtbl.GetRule := CallbackCreate(GetMethod(implObj, "GetRule"), flags, 6)
        this.vtbl.ClearRule := CallbackCreate(GetMethod(implObj, "ClearRule"), flags, 2)
        this.vtbl.CreateNewState := CallbackCreate(GetMethod(implObj, "CreateNewState"), flags, 3)
        this.vtbl.AddWordTransition := CallbackCreate(GetMethod(implObj, "AddWordTransition"), flags, 8)
        this.vtbl.AddRuleTransition := CallbackCreate(GetMethod(implObj, "AddRuleTransition"), flags, 6)
        this.vtbl.AddResource := CallbackCreate(GetMethod(implObj, "AddResource"), flags, 4)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResetGrammar)
        CallbackFree(this.vtbl.GetRule)
        CallbackFree(this.vtbl.ClearRule)
        CallbackFree(this.vtbl.CreateNewState)
        CallbackFree(this.vtbl.AddWordTransition)
        CallbackFree(this.vtbl.AddRuleTransition)
        CallbackFree(this.vtbl.AddResource)
        CallbackFree(this.vtbl.Commit)
    }
}
