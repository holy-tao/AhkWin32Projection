#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Id 
     * @returns {HRESULT} 
     */
    get_Id(Id) {
        result := ComCall(8, this, "int*", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        result := ComCall(9, this, "int*", FirstElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElements(NumberOfElements) {
        result := ComCall(10, this, "int*", NumberOfElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRule>} Parent 
     * @returns {HRESULT} 
     */
    get_Parent(Parent) {
        result := ComCall(11, this, "ptr*", Parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRules>} Children 
     * @returns {HRESULT} 
     */
    get_Children(Children) {
        result := ComCall(12, this, "ptr*", Children, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ActualConfidence 
     * @returns {HRESULT} 
     */
    get_Confidence(ActualConfidence) {
        result := ComCall(13, this, "int*", ActualConfidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} EngineConfidence 
     * @returns {HRESULT} 
     */
    get_EngineConfidence(EngineConfidence) {
        result := ComCall(14, this, "float*", EngineConfidence, "HRESULT")
        return result
    }
}
