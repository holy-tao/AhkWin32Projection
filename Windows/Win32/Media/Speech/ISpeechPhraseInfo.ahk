#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISpeechPhraseRule.ahk
#Include .\ISpeechPhraseProperties.ahk
#Include .\ISpeechPhraseElements.ahk
#Include .\ISpeechPhraseReplacements.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     */
    get_LanguageId() {
        result := ComCall(7, this, "int*", &LanguageId := 0, "HRESULT")
        return LanguageId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_GrammarId() {
        GrammarId := VARIANT()
        result := ComCall(8, this, "ptr", GrammarId, "HRESULT")
        return GrammarId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_StartTime() {
        StartTime := VARIANT()
        result := ComCall(9, this, "ptr", StartTime, "HRESULT")
        return StartTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_AudioStreamPosition() {
        AudioStreamPosition := VARIANT()
        result := ComCall(10, this, "ptr", AudioStreamPosition, "HRESULT")
        return AudioStreamPosition
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeBytes() {
        result := ComCall(11, this, "int*", &pAudioSizeBytes := 0, "HRESULT")
        return pAudioSizeBytes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetainedSizeBytes() {
        result := ComCall(12, this, "int*", &RetainedSizeBytes := 0, "HRESULT")
        return RetainedSizeBytes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeTime() {
        result := ComCall(13, this, "int*", &AudioSizeTime := 0, "HRESULT")
        return AudioSizeTime
    }

    /**
     * 
     * @returns {ISpeechPhraseRule} 
     */
    get_Rule() {
        result := ComCall(14, this, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechPhraseRule(Rule)
    }

    /**
     * 
     * @returns {ISpeechPhraseProperties} 
     */
    get_Properties() {
        result := ComCall(15, this, "ptr*", &Properties := 0, "HRESULT")
        return ISpeechPhraseProperties(Properties)
    }

    /**
     * 
     * @returns {ISpeechPhraseElements} 
     */
    get_Elements() {
        result := ComCall(16, this, "ptr*", &Elements := 0, "HRESULT")
        return ISpeechPhraseElements(Elements)
    }

    /**
     * 
     * @returns {ISpeechPhraseReplacements} 
     */
    get_Replacements() {
        result := ComCall(17, this, "ptr*", &Replacements := 0, "HRESULT")
        return ISpeechPhraseReplacements(Replacements)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_EngineId() {
        EngineIdGuid := BSTR()
        result := ComCall(18, this, "ptr", EngineIdGuid, "HRESULT")
        return EngineIdGuid
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_EnginePrivateData() {
        PrivateData := VARIANT()
        result := ComCall(19, this, "ptr", PrivateData, "HRESULT")
        return PrivateData
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveToMemory() {
        PhraseBlock := VARIANT()
        result := ComCall(20, this, "ptr", PhraseBlock, "HRESULT")
        return PhraseBlock
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @returns {BSTR} 
     */
    GetText(StartElement, Elements, UseReplacements) {
        Text := BSTR()
        result := ComCall(21, this, "int", StartElement, "int", Elements, "short", UseReplacements, "ptr", Text, "HRESULT")
        return Text
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @returns {Integer} 
     */
    GetDisplayAttributes(StartElement, Elements, UseReplacements) {
        result := ComCall(22, this, "int", StartElement, "int", Elements, "short", UseReplacements, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }
}
