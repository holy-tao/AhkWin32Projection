#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRuleStateTransitions extends IDispatch{
    /**
     * The interface identifier for ISpeechGrammarRuleStateTransitions
     * @type {Guid}
     */
    static IID => Guid("{eabce657-75bc-44a2-aa7f-c56476742963}")

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
     * @param {Integer} Index 
     * @param {Pointer<ISpeechGrammarRuleStateTransition>} Transition 
     * @returns {HRESULT} 
     */
    Item(Index, Transition) {
        result := ComCall(8, this, "int", Index, "ptr", Transition, "int")
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
        result := ComCall(9, this, "ptr", EnumVARIANT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
