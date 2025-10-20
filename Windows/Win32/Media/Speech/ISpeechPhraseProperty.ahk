#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseProperty extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
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
        result := ComCall(8, this, "int*", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    get_Value(Value) {
        result := ComCall(9, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        result := ComCall(10, this, "int*", FirstElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElements(NumberOfElements) {
        result := ComCall(11, this, "int*", NumberOfElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} Confidence 
     * @returns {HRESULT} 
     */
    get_EngineConfidence(Confidence) {
        result := ComCall(12, this, "float*", Confidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Confidence 
     * @returns {HRESULT} 
     */
    get_Confidence(Confidence) {
        result := ComCall(13, this, "int*", Confidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperty>} ParentProperty 
     * @returns {HRESULT} 
     */
    get_Parent(ParentProperty) {
        result := ComCall(14, this, "ptr", ParentProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperties>} Children 
     * @returns {HRESULT} 
     */
    get_Children(Children) {
        result := ComCall(15, this, "ptr", Children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
