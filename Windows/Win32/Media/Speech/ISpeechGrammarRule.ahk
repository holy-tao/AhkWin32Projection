#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRuleState.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechGrammarRule
     * @type {Guid}
     */
    static IID => Guid("{afe719cf-5dd1-44f2-999c-7a399f1cfccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attributes", "get_InitialState", "get_Name", "get_Id", "Clear", "AddResource", "AddState"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        result := ComCall(7, this, "int*", &Attributes := 0, "HRESULT")
        return Attributes
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    get_InitialState() {
        result := ComCall(8, this, "ptr*", &State := 0, "HRESULT")
        return ISpeechGrammarRuleState(State)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(10, this, "int*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ResourceName 
     * @param {BSTR} ResourceValue 
     * @returns {HRESULT} 
     */
    AddResource(ResourceName, ResourceValue) {
        ResourceName := ResourceName is String ? BSTR.Alloc(ResourceName).Value : ResourceName
        ResourceValue := ResourceValue is String ? BSTR.Alloc(ResourceValue).Value : ResourceValue

        result := ComCall(12, this, "ptr", ResourceName, "ptr", ResourceValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    AddState() {
        result := ComCall(13, this, "ptr*", &State := 0, "HRESULT")
        return ISpeechGrammarRuleState(State)
    }
}
