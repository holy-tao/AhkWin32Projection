#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRuleStateTransition extends IDispatch{
    /**
     * The interface identifier for ISpeechGrammarRuleStateTransition
     * @type {Guid}
     */
    static IID => Guid("{cafd1db1-41d1-4a06-9863-e2e81da17a9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} Type 
     * @returns {HRESULT} 
     */
    get_Type(Type) {
        result := ComCall(7, this, "int*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Text 
     * @returns {HRESULT} 
     */
    get_Text(Text) {
        result := ComCall(8, this, "ptr", Text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @returns {HRESULT} 
     */
    get_Rule(Rule) {
        result := ComCall(9, this, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Weight 
     * @returns {HRESULT} 
     */
    get_Weight(Weight) {
        result := ComCall(10, this, "ptr", Weight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} PropertyName 
     * @returns {HRESULT} 
     */
    get_PropertyName(PropertyName) {
        result := ComCall(11, this, "ptr", PropertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} PropertyId 
     * @returns {HRESULT} 
     */
    get_PropertyId(PropertyId) {
        result := ComCall(12, this, "int*", PropertyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @returns {HRESULT} 
     */
    get_PropertyValue(PropertyValue) {
        result := ComCall(13, this, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} NextState 
     * @returns {HRESULT} 
     */
    get_NextState(NextState) {
        result := ComCall(14, this, "ptr", NextState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
