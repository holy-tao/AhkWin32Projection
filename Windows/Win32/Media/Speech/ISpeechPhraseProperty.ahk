#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseProperty
     * @type {Guid}
     */
    static IID => Guid("{ce563d48-961e-4732-a2e1-378a42b430be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "get_Value", "get_FirstElement", "get_NumberOfElements", "get_EngineConfidence", "get_Confidence", "get_Parent", "get_Children"]

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
        IdMarshal := Id is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, IdMarshal, Id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    get_Value(Value) {
        result := ComCall(9, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        FirstElementMarshal := FirstElement is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, FirstElementMarshal, FirstElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElements(NumberOfElements) {
        NumberOfElementsMarshal := NumberOfElements is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, NumberOfElementsMarshal, NumberOfElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Confidence 
     * @returns {HRESULT} 
     */
    get_EngineConfidence(Confidence) {
        ConfidenceMarshal := Confidence is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, ConfidenceMarshal, Confidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Confidence 
     * @returns {HRESULT} 
     */
    get_Confidence(Confidence) {
        ConfidenceMarshal := Confidence is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, ConfidenceMarshal, Confidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperty>} ParentProperty 
     * @returns {HRESULT} 
     */
    get_Parent(ParentProperty) {
        result := ComCall(14, this, "ptr*", ParentProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperties>} Children 
     * @returns {HRESULT} 
     */
    get_Children(Children) {
        result := ComCall(15, this, "ptr*", Children, "HRESULT")
        return result
    }
}
