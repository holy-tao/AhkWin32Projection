#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechPhraseRule.ahk
#Include .\ISpeechPhraseRules.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseRule
     * @type {Guid}
     */
    static IID => Guid("{a7bfe112-a4a0-48d9-b602-c313843f6964}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "get_FirstElement", "get_NumberOfElements", "get_Parent", "get_Children", "get_Confidence", "get_EngineConfidence"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(8, this, "int*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstElement() {
        result := ComCall(9, this, "int*", &FirstElement := 0, "HRESULT")
        return FirstElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElements() {
        result := ComCall(10, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }

    /**
     * 
     * @returns {ISpeechPhraseRule} 
     */
    get_Parent() {
        result := ComCall(11, this, "ptr*", &Parent := 0, "HRESULT")
        return ISpeechPhraseRule(Parent)
    }

    /**
     * 
     * @returns {ISpeechPhraseRules} 
     */
    get_Children() {
        result := ComCall(12, this, "ptr*", &Children := 0, "HRESULT")
        return ISpeechPhraseRules(Children)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Confidence() {
        result := ComCall(13, this, "int*", &ActualConfidence := 0, "HRESULT")
        return ActualConfidence
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EngineConfidence() {
        result := ComCall(14, this, "float*", &EngineConfidence := 0, "HRESULT")
        return EngineConfidence
    }
}
