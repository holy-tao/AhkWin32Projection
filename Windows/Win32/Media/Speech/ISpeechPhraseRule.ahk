#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseRule extends IDispatch{
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
     * @param {Pointer<Int32>} FirstElement 
     * @returns {HRESULT} 
     */
    get_FirstElement(FirstElement) {
        result := ComCall(9, this, "int*", FirstElement, "int")
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
        result := ComCall(10, this, "int*", NumberOfElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRule>} Parent 
     * @returns {HRESULT} 
     */
    get_Parent(Parent) {
        result := ComCall(11, this, "ptr", Parent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRules>} Children 
     * @returns {HRESULT} 
     */
    get_Children(Children) {
        result := ComCall(12, this, "ptr", Children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ActualConfidence 
     * @returns {HRESULT} 
     */
    get_Confidence(ActualConfidence) {
        result := ComCall(13, this, "int*", ActualConfidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} EngineConfidence 
     * @returns {HRESULT} 
     */
    get_EngineConfidence(EngineConfidence) {
        result := ComCall(14, this, "float*", EngineConfidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
