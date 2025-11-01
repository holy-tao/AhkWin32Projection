#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpGrammarBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpGrammarBuilder
     * @type {Guid}
     */
    static IID => Guid("{8137828f-591a-4a42-be58-49ea7ebaac68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetGrammar", "GetRule", "ClearRule", "CreateNewState", "AddWordTransition", "AddRuleTransition", "AddResource", "Commit"]

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

        result := ComCall(4, this, "ptr", pszRuleName, "uint", dwRuleId, "uint", dwAttributes, "int", fCreateIfNotExist, "ptr", phInitialState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @returns {HRESULT} 
     */
    ClearRule(hState) {
        hState := hState is Win32Handle ? NumGet(hState, "ptr") : hState

        result := ComCall(5, this, "ptr", hState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @param {Pointer<SPSTATEHANDLE>} phState 
     * @returns {HRESULT} 
     */
    CreateNewState(hState, phState) {
        hState := hState is Win32Handle ? NumGet(hState, "ptr") : hState

        result := ComCall(6, this, "ptr", hState, "ptr", phState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hFromState 
     * @param {SPSTATEHANDLE} hToState 
     * @param {PWSTR} psz 
     * @param {PWSTR} pszSeparators 
     * @param {Integer} eWordType 
     * @param {Float} Weight 
     * @param {Pointer<SPPROPERTYINFO>} pPropInfo 
     * @returns {HRESULT} 
     */
    AddWordTransition(hFromState, hToState, psz, pszSeparators, eWordType, Weight, pPropInfo) {
        hFromState := hFromState is Win32Handle ? NumGet(hFromState, "ptr") : hFromState
        hToState := hToState is Win32Handle ? NumGet(hToState, "ptr") : hToState
        psz := psz is String ? StrPtr(psz) : psz
        pszSeparators := pszSeparators is String ? StrPtr(pszSeparators) : pszSeparators

        result := ComCall(7, this, "ptr", hFromState, "ptr", hToState, "ptr", psz, "ptr", pszSeparators, "int", eWordType, "float", Weight, "ptr", pPropInfo, "HRESULT")
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
        hFromState := hFromState is Win32Handle ? NumGet(hFromState, "ptr") : hFromState
        hToState := hToState is Win32Handle ? NumGet(hToState, "ptr") : hToState
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(8, this, "ptr", hFromState, "ptr", hToState, "ptr", hRule, "float", Weight, "ptr", pPropInfo, "HRESULT")
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
        hRuleState := hRuleState is Win32Handle ? NumGet(hRuleState, "ptr") : hRuleState
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName
        pszResourceValue := pszResourceValue is String ? StrPtr(pszResourceValue) : pszResourceValue

        result := ComCall(9, this, "ptr", hRuleState, "ptr", pszResourceName, "ptr", pszResourceValue, "HRESULT")
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
}
