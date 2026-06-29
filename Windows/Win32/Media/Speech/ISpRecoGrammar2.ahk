#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\Urlmon\IInternetSecurityManager.ahk" { IInternetSecurityManager }
#Import ".\SPBINARYGRAMMAR.ahk" { SPBINARYGRAMMAR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPRULE.ahk" { SPRULE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPLOADOPTIONS.ahk" { SPLOADOPTIONS }
#Import ".\ISpeechResourceLoader.ahk" { ISpeechResourceLoader }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoGrammar2 extends IUnknown {
    /**
     * The interface identifier for ISpRecoGrammar2
     * @type {Guid}
     */
    static IID := Guid("{4b37bc9e-9ed6-44a3-93d3-18f022b79ec3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoGrammar2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRules              : IntPtr
        LoadCmdFromFile2      : IntPtr
        LoadCmdFromMemory2    : IntPtr
        SetRulePriority       : IntPtr
        SetRuleWeight         : IntPtr
        SetDictationWeight    : IntPtr
        SetGrammarLoader      : IntPtr
        SetSMLSecurityManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoGrammar2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<SPRULE>>} ppCoMemRules 
     * @param {Pointer<Integer>} puNumRules 
     * @returns {HRESULT} 
     */
    GetRules(ppCoMemRules, puNumRules) {
        ppCoMemRulesMarshal := ppCoMemRules is VarRef ? "ptr*" : "ptr"
        puNumRulesMarshal := puNumRules is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppCoMemRulesMarshal, ppCoMemRules, puNumRulesMarshal, puNumRules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {SPLOADOPTIONS} Options 
     * @param {PWSTR} pszSharingUri 
     * @param {PWSTR} pszBaseUri 
     * @returns {HRESULT} 
     */
    LoadCmdFromFile2(pszFileName, Options, pszSharingUri, pszBaseUri) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszSharingUri := pszSharingUri is String ? StrPtr(pszSharingUri) : pszSharingUri
        pszBaseUri := pszBaseUri is String ? StrPtr(pszBaseUri) : pszBaseUri

        result := ComCall(4, this, "ptr", pszFileName, SPLOADOPTIONS, Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pGrammar 
     * @param {SPLOADOPTIONS} Options 
     * @param {PWSTR} pszSharingUri 
     * @param {PWSTR} pszBaseUri 
     * @returns {HRESULT} 
     */
    LoadCmdFromMemory2(pGrammar, Options, pszSharingUri, pszBaseUri) {
        pszSharingUri := pszSharingUri is String ? StrPtr(pszSharingUri) : pszSharingUri
        pszBaseUri := pszBaseUri is String ? StrPtr(pszBaseUri) : pszBaseUri

        result := ComCall(5, this, SPBINARYGRAMMAR.Ptr, pGrammar, SPLOADOPTIONS, Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRuleName 
     * @param {Integer} ulRuleId 
     * @param {Integer} nRulePriority 
     * @returns {HRESULT} 
     */
    SetRulePriority(pszRuleName, ulRuleId, nRulePriority) {
        pszRuleName := pszRuleName is String ? StrPtr(pszRuleName) : pszRuleName

        result := ComCall(6, this, "ptr", pszRuleName, "uint", ulRuleId, "int", nRulePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRuleName 
     * @param {Integer} ulRuleId 
     * @param {Float} flWeight 
     * @returns {HRESULT} 
     */
    SetRuleWeight(pszRuleName, ulRuleId, flWeight) {
        pszRuleName := pszRuleName is String ? StrPtr(pszRuleName) : pszRuleName

        result := ComCall(7, this, "ptr", pszRuleName, "uint", ulRuleId, "float", flWeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flWeight 
     * @returns {HRESULT} 
     */
    SetDictationWeight(flWeight) {
        result := ComCall(8, this, "float", flWeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechResourceLoader} pLoader 
     * @returns {HRESULT} 
     */
    SetGrammarLoader(pLoader) {
        result := ComCall(9, this, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInternetSecurityManager} pSMLSecurityManager 
     * @returns {HRESULT} 
     */
    SetSMLSecurityManager(pSMLSecurityManager) {
        result := ComCall(10, this, "ptr", pSMLSecurityManager, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecoGrammar2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRules := CallbackCreate(GetMethod(implObj, "GetRules"), flags, 3)
        this.vtbl.LoadCmdFromFile2 := CallbackCreate(GetMethod(implObj, "LoadCmdFromFile2"), flags, 5)
        this.vtbl.LoadCmdFromMemory2 := CallbackCreate(GetMethod(implObj, "LoadCmdFromMemory2"), flags, 5)
        this.vtbl.SetRulePriority := CallbackCreate(GetMethod(implObj, "SetRulePriority"), flags, 4)
        this.vtbl.SetRuleWeight := CallbackCreate(GetMethod(implObj, "SetRuleWeight"), flags, 4)
        this.vtbl.SetDictationWeight := CallbackCreate(GetMethod(implObj, "SetDictationWeight"), flags, 2)
        this.vtbl.SetGrammarLoader := CallbackCreate(GetMethod(implObj, "SetGrammarLoader"), flags, 2)
        this.vtbl.SetSMLSecurityManager := CallbackCreate(GetMethod(implObj, "SetSMLSecurityManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRules)
        CallbackFree(this.vtbl.LoadCmdFromFile2)
        CallbackFree(this.vtbl.LoadCmdFromMemory2)
        CallbackFree(this.vtbl.SetRulePriority)
        CallbackFree(this.vtbl.SetRuleWeight)
        CallbackFree(this.vtbl.SetDictationWeight)
        CallbackFree(this.vtbl.SetGrammarLoader)
        CallbackFree(this.vtbl.SetSMLSecurityManager)
    }
}
