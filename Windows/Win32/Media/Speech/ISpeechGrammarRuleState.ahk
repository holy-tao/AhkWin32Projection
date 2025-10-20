#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRuleState extends IDispatch{
    /**
     * The interface identifier for ISpeechGrammarRuleState
     * @type {Guid}
     */
    static IID => Guid("{d4286f2c-ee67-45ae-b928-28d695362eda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @returns {HRESULT} 
     */
    get_Rule(Rule) {
        result := ComCall(7, this, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleStateTransitions>} Transitions 
     * @returns {HRESULT} 
     */
    get_Transitions(Transitions) {
        result := ComCall(8, this, "ptr", Transitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} DestState 
     * @param {BSTR} Words 
     * @param {BSTR} Separators 
     * @param {Integer} Type 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddWordTransition(DestState, Words, Separators, Type, PropertyName, PropertyId, PropertyValue, Weight) {
        Words := Words is String ? BSTR.Alloc(Words).Value : Words
        Separators := Separators is String ? BSTR.Alloc(Separators).Value : Separators
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(9, this, "ptr", DestState, "ptr", Words, "ptr", Separators, "int", Type, "ptr", PropertyName, "int", PropertyId, "ptr", PropertyValue, "float", Weight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} DestinationState 
     * @param {Pointer<ISpeechGrammarRule>} Rule 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddRuleTransition(DestinationState, Rule, PropertyName, PropertyId, PropertyValue, Weight) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(10, this, "ptr", DestinationState, "ptr", Rule, "ptr", PropertyName, "int", PropertyId, "ptr", PropertyValue, "float", Weight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} DestinationState 
     * @param {Integer} Type 
     * @param {BSTR} PropertyName 
     * @param {Integer} PropertyId 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @param {Float} Weight 
     * @returns {HRESULT} 
     */
    AddSpecialTransition(DestinationState, Type, PropertyName, PropertyId, PropertyValue, Weight) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(11, this, "ptr", DestinationState, "int", Type, "ptr", PropertyName, "int", PropertyId, "ptr", PropertyValue, "float", Weight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
