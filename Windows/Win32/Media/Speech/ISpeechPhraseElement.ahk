#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseElement extends IDispatch{
    /**
     * The interface identifier for ISpeechPhraseElement
     * @type {Guid}
     */
    static IID => Guid("{e6176f96-e373-4801-b223-3b62c068c0b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} AudioTimeOffset 
     * @returns {HRESULT} 
     */
    get_AudioTimeOffset(AudioTimeOffset) {
        result := ComCall(7, this, "int*", AudioTimeOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AudioSizeTime 
     * @returns {HRESULT} 
     */
    get_AudioSizeTime(AudioSizeTime) {
        result := ComCall(8, this, "int*", AudioSizeTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AudioStreamOffset 
     * @returns {HRESULT} 
     */
    get_AudioStreamOffset(AudioStreamOffset) {
        result := ComCall(9, this, "int*", AudioStreamOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AudioSizeBytes 
     * @returns {HRESULT} 
     */
    get_AudioSizeBytes(AudioSizeBytes) {
        result := ComCall(10, this, "int*", AudioSizeBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RetainedStreamOffset 
     * @returns {HRESULT} 
     */
    get_RetainedStreamOffset(RetainedStreamOffset) {
        result := ComCall(11, this, "int*", RetainedStreamOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RetainedSizeBytes 
     * @returns {HRESULT} 
     */
    get_RetainedSizeBytes(RetainedSizeBytes) {
        result := ComCall(12, this, "int*", RetainedSizeBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} DisplayText 
     * @returns {HRESULT} 
     */
    get_DisplayText(DisplayText) {
        result := ComCall(13, this, "ptr", DisplayText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LexicalForm 
     * @returns {HRESULT} 
     */
    get_LexicalForm(LexicalForm) {
        result := ComCall(14, this, "ptr", LexicalForm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Pronunciation 
     * @returns {HRESULT} 
     */
    get_Pronunciation(Pronunciation) {
        result := ComCall(15, this, "ptr", Pronunciation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    get_DisplayAttributes(DisplayAttributes) {
        result := ComCall(16, this, "int*", DisplayAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RequiredConfidence 
     * @returns {HRESULT} 
     */
    get_RequiredConfidence(RequiredConfidence) {
        result := ComCall(17, this, "int*", RequiredConfidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ActualConfidence 
     * @returns {HRESULT} 
     */
    get_ActualConfidence(ActualConfidence) {
        result := ComCall(18, this, "int*", ActualConfidence, "int")
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
        result := ComCall(19, this, "float*", EngineConfidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
