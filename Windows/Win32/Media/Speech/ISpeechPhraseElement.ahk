#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseElement extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioTimeOffset", "get_AudioSizeTime", "get_AudioStreamOffset", "get_AudioSizeBytes", "get_RetainedStreamOffset", "get_RetainedSizeBytes", "get_DisplayText", "get_LexicalForm", "get_Pronunciation", "get_DisplayAttributes", "get_RequiredConfidence", "get_ActualConfidence", "get_EngineConfidence"]

    /**
     * 
     * @param {Pointer<Integer>} AudioTimeOffset 
     * @returns {HRESULT} 
     */
    get_AudioTimeOffset(AudioTimeOffset) {
        AudioTimeOffsetMarshal := AudioTimeOffset is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, AudioTimeOffsetMarshal, AudioTimeOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AudioSizeTime 
     * @returns {HRESULT} 
     */
    get_AudioSizeTime(AudioSizeTime) {
        AudioSizeTimeMarshal := AudioSizeTime is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, AudioSizeTimeMarshal, AudioSizeTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AudioStreamOffset 
     * @returns {HRESULT} 
     */
    get_AudioStreamOffset(AudioStreamOffset) {
        AudioStreamOffsetMarshal := AudioStreamOffset is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, AudioStreamOffsetMarshal, AudioStreamOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AudioSizeBytes 
     * @returns {HRESULT} 
     */
    get_AudioSizeBytes(AudioSizeBytes) {
        AudioSizeBytesMarshal := AudioSizeBytes is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, AudioSizeBytesMarshal, AudioSizeBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} RetainedStreamOffset 
     * @returns {HRESULT} 
     */
    get_RetainedStreamOffset(RetainedStreamOffset) {
        RetainedStreamOffsetMarshal := RetainedStreamOffset is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, RetainedStreamOffsetMarshal, RetainedStreamOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} RetainedSizeBytes 
     * @returns {HRESULT} 
     */
    get_RetainedSizeBytes(RetainedSizeBytes) {
        RetainedSizeBytesMarshal := RetainedSizeBytes is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, RetainedSizeBytesMarshal, RetainedSizeBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} DisplayText 
     * @returns {HRESULT} 
     */
    get_DisplayText(DisplayText) {
        result := ComCall(13, this, "ptr", DisplayText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LexicalForm 
     * @returns {HRESULT} 
     */
    get_LexicalForm(LexicalForm) {
        result := ComCall(14, this, "ptr", LexicalForm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Pronunciation 
     * @returns {HRESULT} 
     */
    get_Pronunciation(Pronunciation) {
        result := ComCall(15, this, "ptr", Pronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    get_DisplayAttributes(DisplayAttributes) {
        DisplayAttributesMarshal := DisplayAttributes is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, DisplayAttributesMarshal, DisplayAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} RequiredConfidence 
     * @returns {HRESULT} 
     */
    get_RequiredConfidence(RequiredConfidence) {
        RequiredConfidenceMarshal := RequiredConfidence is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, RequiredConfidenceMarshal, RequiredConfidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ActualConfidence 
     * @returns {HRESULT} 
     */
    get_ActualConfidence(ActualConfidence) {
        ActualConfidenceMarshal := ActualConfidence is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, ActualConfidenceMarshal, ActualConfidence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} EngineConfidence 
     * @returns {HRESULT} 
     */
    get_EngineConfidence(EngineConfidence) {
        EngineConfidenceMarshal := EngineConfidence is VarRef ? "float*" : "ptr"

        result := ComCall(19, this, EngineConfidenceMarshal, EngineConfidence, "HRESULT")
        return result
    }
}
