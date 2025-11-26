#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISpeechPhraseProperty.ahk
#Include .\ISpeechPhraseProperties.ahk
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Integer} 
     */
    FirstElement {
        get => this.get_FirstElement()
    }

    /**
     * @type {Integer} 
     */
    NumberOfElements {
        get => this.get_NumberOfElements()
    }

    /**
     * @type {Float} 
     */
    EngineConfidence {
        get => this.get_EngineConfidence()
    }

    /**
     * @type {Integer} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {ISpeechPhraseProperty} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {ISpeechPhraseProperties} 
     */
    Children {
        get => this.get_Children()
    }

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
     * @returns {VARIANT} 
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(9, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstElement() {
        result := ComCall(10, this, "int*", &FirstElement := 0, "HRESULT")
        return FirstElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElements() {
        result := ComCall(11, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EngineConfidence() {
        result := ComCall(12, this, "float*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Confidence() {
        result := ComCall(13, this, "int*", &Confidence := 0, "HRESULT")
        return Confidence
    }

    /**
     * 
     * @returns {ISpeechPhraseProperty} 
     */
    get_Parent() {
        result := ComCall(14, this, "ptr*", &ParentProperty := 0, "HRESULT")
        return ISpeechPhraseProperty(ParentProperty)
    }

    /**
     * 
     * @returns {ISpeechPhraseProperties} 
     */
    get_Children() {
        result := ComCall(15, this, "ptr*", &Children := 0, "HRESULT")
        return ISpeechPhraseProperties(Children)
    }
}
