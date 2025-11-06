#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechGrammarRuleStateTransition.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRuleStateTransitions extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "get__NewEnum"]

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
     * @param {Integer} Index 
     * @returns {ISpeechGrammarRuleStateTransition} 
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &Transition := 0, "HRESULT")
        return ISpeechGrammarRuleStateTransition(Transition)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &EnumVARIANT := 0, "HRESULT")
        return IUnknown(EnumVARIANT)
    }
}
