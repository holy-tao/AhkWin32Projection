#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseInfo
     * @type {Guid}
     */
    static IID => Guid("{961559cf-4e67-4662-8bf0-d93f1fcd61b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LanguageId", "get_GrammarId", "get_StartTime", "get_AudioStreamPosition", "get_AudioSizeBytes", "get_RetainedSizeBytes", "get_AudioSizeTime", "get_Rule", "get_Properties", "get_Elements", "get_Replacements", "get_EngineId", "get_EnginePrivateData", "SaveToMemory", "GetText", "GetDisplayAttributes"]

    /**
     * 
     * @param {Pointer<Integer>} LanguageId 
     * @returns {HRESULT} 
     */
    get_LanguageId(LanguageId) {
        LanguageIdMarshal := LanguageId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, LanguageIdMarshal, LanguageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} GrammarId 
     * @returns {HRESULT} 
     */
    get_GrammarId(GrammarId) {
        result := ComCall(8, this, "ptr", GrammarId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} StartTime 
     * @returns {HRESULT} 
     */
    get_StartTime(StartTime) {
        result := ComCall(9, this, "ptr", StartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} AudioStreamPosition 
     * @returns {HRESULT} 
     */
    get_AudioStreamPosition(AudioStreamPosition) {
        result := ComCall(10, this, "ptr", AudioStreamPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAudioSizeBytes 
     * @returns {HRESULT} 
     */
    get_AudioSizeBytes(pAudioSizeBytes) {
        pAudioSizeBytesMarshal := pAudioSizeBytes is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pAudioSizeBytesMarshal, pAudioSizeBytes, "HRESULT")
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
     * @param {Pointer<Integer>} AudioSizeTime 
     * @returns {HRESULT} 
     */
    get_AudioSizeTime(AudioSizeTime) {
        AudioSizeTimeMarshal := AudioSizeTime is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, AudioSizeTimeMarshal, AudioSizeTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRule>} Rule 
     * @returns {HRESULT} 
     */
    get_Rule(Rule) {
        result := ComCall(14, this, "ptr*", Rule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperties>} Properties 
     * @returns {HRESULT} 
     */
    get_Properties(Properties) {
        result := ComCall(15, this, "ptr*", Properties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseElements>} Elements 
     * @returns {HRESULT} 
     */
    get_Elements(Elements) {
        result := ComCall(16, this, "ptr*", Elements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseReplacements>} Replacements 
     * @returns {HRESULT} 
     */
    get_Replacements(Replacements) {
        result := ComCall(17, this, "ptr*", Replacements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} EngineIdGuid 
     * @returns {HRESULT} 
     */
    get_EngineId(EngineIdGuid) {
        result := ComCall(18, this, "ptr", EngineIdGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PrivateData 
     * @returns {HRESULT} 
     */
    get_EnginePrivateData(PrivateData) {
        result := ComCall(19, this, "ptr", PrivateData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PhraseBlock 
     * @returns {HRESULT} 
     */
    SaveToMemory(PhraseBlock) {
        result := ComCall(20, this, "ptr", PhraseBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @param {Pointer<BSTR>} Text 
     * @returns {HRESULT} 
     */
    GetText(StartElement, Elements, UseReplacements, Text) {
        result := ComCall(21, this, "int", StartElement, "int", Elements, "short", UseReplacements, "ptr", Text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @param {Pointer<Integer>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    GetDisplayAttributes(StartElement, Elements, UseReplacements, DisplayAttributes) {
        DisplayAttributesMarshal := DisplayAttributes is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "int", StartElement, "int", Elements, "short", UseReplacements, DisplayAttributesMarshal, DisplayAttributes, "HRESULT")
        return result
    }
}
