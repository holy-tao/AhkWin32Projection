#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoGrammar2 extends IUnknown{
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
     * 
     * @param {Pointer<SPRULE>} ppCoMemRules 
     * @param {Pointer<UInt32>} puNumRules 
     * @returns {HRESULT} 
     */
    GetRules(ppCoMemRules, puNumRules) {
        result := ComCall(3, this, "ptr", ppCoMemRules, "uint*", puNumRules, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "ptr", pszFileName, "int", Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "ptr", pGrammar, "int", Options, "ptr", pszSharingUri, "ptr", pszBaseUri, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(6, this, "ptr", pszRuleName, "uint", ulRuleId, "int", nRulePriority, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "ptr", pszRuleName, "uint", ulRuleId, "float", flWeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} flWeight 
     * @returns {HRESULT} 
     */
    SetDictationWeight(flWeight) {
        result := ComCall(8, this, "float", flWeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechResourceLoader>} pLoader 
     * @returns {HRESULT} 
     */
    SetGrammarLoader(pLoader) {
        result := ComCall(9, this, "ptr", pLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInternetSecurityManager>} pSMLSecurityManager 
     * @returns {HRESULT} 
     */
    SetSMLSecurityManager(pSMLSecurityManager) {
        result := ComCall(10, this, "ptr", pSMLSecurityManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
