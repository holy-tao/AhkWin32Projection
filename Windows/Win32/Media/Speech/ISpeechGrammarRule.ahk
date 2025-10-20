#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRule extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} Attributes 
     * @returns {HRESULT} 
     */
    get_Attributes(Attributes) {
        result := ComCall(7, this, "int*", Attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} State 
     * @returns {HRESULT} 
     */
    get_InitialState(State) {
        result := ComCall(8, this, "ptr", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(9, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Id 
     * @returns {HRESULT} 
     */
    get_Id(Id) {
        result := ComCall(10, this, "int*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(12, this, "ptr", ResourceName, "ptr", ResourceValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRuleState>} State 
     * @returns {HRESULT} 
     */
    AddState(State) {
        result := ComCall(13, this, "ptr", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
