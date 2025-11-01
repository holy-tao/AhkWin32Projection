#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoGrammar2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoGrammar2
     * @type {Guid}
     */
    static IID => Guid("{4b37bc9e-9ed6-44a3-93d3-18f022b79ec3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRules", "LoadCmdFromFile2", "LoadCmdFromMemory2", "SetRulePriority", "SetRuleWeight", "SetDictationWeight", "SetGrammarLoader", "SetSMLSecurityManager"]

    /**
     * 
     * @param {Pointer<Pointer<SPRULE>>} ppCoMemRules 
     * @param {Pointer<Integer>} puNumRules 
     * @returns {HRESULT} 
     */
    GetRules(ppCoMemRules, puNumRules) {
        puNumRulesMarshal := puNumRules is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr*", ppCoMemRules, puNumRulesMarshal, puNumRules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Integer} Options 
     * @param {PWSTR} pszSharingUri 
     * @param {PWSTR} pszBaseUri 
     * @returns {HRESULT} 
     */
    LoadCmdFromFile2(pszFileName, Options, pszSharingUri, pszBaseUri) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszSharingUri := pszSharingUri is String ? StrPtr(pszSharingUri) : pszSharingUri
        pszBaseUri := pszBaseUri is String ? StrPtr(pszBaseUri) : pszBaseUri

        result := ComCall(4, this, "ptr", pszFileName, "int", Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pGrammar 
     * @param {Integer} Options 
     * @param {PWSTR} pszSharingUri 
     * @param {PWSTR} pszBaseUri 
     * @returns {HRESULT} 
     */
    LoadCmdFromMemory2(pGrammar, Options, pszSharingUri, pszBaseUri) {
        pszSharingUri := pszSharingUri is String ? StrPtr(pszSharingUri) : pszSharingUri
        pszBaseUri := pszBaseUri is String ? StrPtr(pszBaseUri) : pszBaseUri

        result := ComCall(5, this, "ptr", pGrammar, "int", Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "HRESULT")
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
}
