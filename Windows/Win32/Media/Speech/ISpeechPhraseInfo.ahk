#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseInfo extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} LanguageId 
     * @returns {HRESULT} 
     */
    get_LanguageId(LanguageId) {
        result := ComCall(7, this, "int*", LanguageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} GrammarId 
     * @returns {HRESULT} 
     */
    get_GrammarId(GrammarId) {
        result := ComCall(8, this, "ptr", GrammarId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} StartTime 
     * @returns {HRESULT} 
     */
    get_StartTime(StartTime) {
        result := ComCall(9, this, "ptr", StartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} AudioStreamPosition 
     * @returns {HRESULT} 
     */
    get_AudioStreamPosition(AudioStreamPosition) {
        result := ComCall(10, this, "ptr", AudioStreamPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAudioSizeBytes 
     * @returns {HRESULT} 
     */
    get_AudioSizeBytes(pAudioSizeBytes) {
        result := ComCall(11, this, "int*", pAudioSizeBytes, "int")
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
     * @param {Pointer<Int32>} AudioSizeTime 
     * @returns {HRESULT} 
     */
    get_AudioSizeTime(AudioSizeTime) {
        result := ComCall(13, this, "int*", AudioSizeTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseRule>} Rule 
     * @returns {HRESULT} 
     */
    get_Rule(Rule) {
        result := ComCall(14, this, "ptr", Rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseProperties>} Properties 
     * @returns {HRESULT} 
     */
    get_Properties(Properties) {
        result := ComCall(15, this, "ptr", Properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseElements>} Elements 
     * @returns {HRESULT} 
     */
    get_Elements(Elements) {
        result := ComCall(16, this, "ptr", Elements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseReplacements>} Replacements 
     * @returns {HRESULT} 
     */
    get_Replacements(Replacements) {
        result := ComCall(17, this, "ptr", Replacements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} EngineIdGuid 
     * @returns {HRESULT} 
     */
    get_EngineId(EngineIdGuid) {
        result := ComCall(18, this, "ptr", EngineIdGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PrivateData 
     * @returns {HRESULT} 
     */
    get_EnginePrivateData(PrivateData) {
        result := ComCall(19, this, "ptr", PrivateData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PhraseBlock 
     * @returns {HRESULT} 
     */
    SaveToMemory(PhraseBlock) {
        result := ComCall(20, this, "ptr", PhraseBlock, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(21, this, "int", StartElement, "int", Elements, "short", UseReplacements, "ptr", Text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @param {Pointer<Int32>} DisplayAttributes 
     * @returns {HRESULT} 
     */
    GetDisplayAttributes(StartElement, Elements, UseReplacements, DisplayAttributes) {
        result := ComCall(22, this, "int", StartElement, "int", Elements, "short", UseReplacements, "int*", DisplayAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
