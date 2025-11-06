#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRule.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRules extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechGrammarRules
     * @type {Guid}
     */
    static IID => Guid("{6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "FindRule", "Item", "get__NewEnum", "get_Dynamic", "Add", "Commit", "CommitAndSave"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {VARIANT} RuleNameOrId 
     * @returns {ISpeechGrammarRule} 
     */
    FindRule(RuleNameOrId) {
        result := ComCall(8, this, "ptr", RuleNameOrId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ISpeechGrammarRule} 
     */
    Item(Index) {
        result := ComCall(9, this, "int", Index, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &EnumVARIANT := 0, "HRESULT")
        return IUnknown(EnumVARIANT)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Dynamic() {
        result := ComCall(11, this, "short*", &Dynamic := 0, "HRESULT")
        return Dynamic
    }

    /**
     * 
     * @param {BSTR} RuleName 
     * @param {Integer} Attributes 
     * @param {Integer} RuleId 
     * @returns {ISpeechGrammarRule} 
     */
    Add(RuleName, Attributes, RuleId) {
        RuleName := RuleName is String ? BSTR.Alloc(RuleName).Value : RuleName

        result := ComCall(12, this, "ptr", RuleName, "int", Attributes, "int", RuleId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorText 
     * @param {Pointer<VARIANT>} SaveStream 
     * @returns {HRESULT} 
     */
    CommitAndSave(ErrorText, SaveStream) {
        result := ComCall(14, this, "ptr", ErrorText, "ptr", SaveStream, "HRESULT")
        return result
    }
}
