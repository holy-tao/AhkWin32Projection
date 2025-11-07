#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRule.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISpeechGrammarRuleState.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRuleStateTransition extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Text", "get_Rule", "get_Weight", "get_PropertyName", "get_PropertyId", "get_PropertyValue", "get_NextState"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Text() {
        Text := BSTR()
        result := ComCall(8, this, "ptr", Text, "HRESULT")
        return Text
    }

    /**
     * 
     * @returns {ISpeechGrammarRule} 
     */
    get_Rule() {
        result := ComCall(9, this, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Weight() {
        Weight := VARIANT()
        result := ComCall(10, this, "ptr", Weight, "HRESULT")
        return Weight
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PropertyName() {
        PropertyName := BSTR()
        result := ComCall(11, this, "ptr", PropertyName, "HRESULT")
        return PropertyName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PropertyId() {
        result := ComCall(12, this, "int*", &PropertyId := 0, "HRESULT")
        return PropertyId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PropertyValue() {
        PropertyValue := VARIANT()
        result := ComCall(13, this, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    get_NextState() {
        result := ComCall(14, this, "ptr*", &NextState := 0, "HRESULT")
        return ISpeechGrammarRuleState(NextState)
    }
}
