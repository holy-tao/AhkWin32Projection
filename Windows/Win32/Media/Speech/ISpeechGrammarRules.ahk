#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRules extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} RuleNameOrId 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @returns {HRESULT} 
     */
    FindRule(RuleNameOrId, Rule) {
        result := ComCall(8, this, "ptr", RuleNameOrId, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @returns {HRESULT} 
     */
    Item(Index, Rule) {
        result := ComCall(9, this, "int", Index, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} EnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(EnumVARIANT) {
        result := ComCall(10, this, "ptr", EnumVARIANT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Dynamic 
     * @returns {HRESULT} 
     */
    get_Dynamic(Dynamic) {
        result := ComCall(11, this, "ptr", Dynamic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} RuleName 
     * @param {Integer} Attributes 
     * @param {Integer} RuleId 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @returns {HRESULT} 
     */
    Add(RuleName, Attributes, RuleId, Rule) {
        RuleName := RuleName is String ? BSTR.Alloc(RuleName).Value : RuleName

        result := ComCall(12, this, "ptr", RuleName, "int", Attributes, "int", RuleId, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorText 
     * @param {Pointer<VARIANT>} SaveStream 
     * @returns {HRESULT} 
     */
    CommitAndSave(ErrorText, SaveStream) {
        result := ComCall(14, this, "ptr", ErrorText, "ptr", SaveStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
