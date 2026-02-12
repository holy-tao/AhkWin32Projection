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
     * @type {Integer} 
     */
    LanguageId {
        get => this.get_LanguageId()
    }

    /**
     * @type {VARIANT} 
     */
    GrammarId {
        get => this.get_GrammarId()
    }

    /**
     * @type {VARIANT} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {VARIANT} 
     */
    AudioStreamPosition {
        get => this.get_AudioStreamPosition()
    }

    /**
     * @type {Integer} 
     */
    AudioSizeBytes {
        get => this.get_AudioSizeBytes()
    }

    /**
     * @type {Integer} 
     */
    RetainedSizeBytes {
        get => this.get_RetainedSizeBytes()
    }

    /**
     * @type {Integer} 
     */
    AudioSizeTime {
        get => this.get_AudioSizeTime()
    }

    /**
     * @type {ISpeechPhraseRule} 
     */
    Rule {
        get => this.get_Rule()
    }

    /**
     * @type {ISpeechPhraseProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {ISpeechPhraseElements} 
     */
    Elements {
        get => this.get_Elements()
    }

    /**
     * @type {ISpeechPhraseReplacements} 
     */
    Replacements {
        get => this.get_Replacements()
    }

    /**
     * @type {BSTR} 
     */
    EngineId {
        get => this.get_EngineId()
    }

    /**
     * @type {VARIANT} 
     */
    EnginePrivateData {
        get => this.get_EnginePrivateData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LanguageId() {
        result := ComCall(7, this, "int*", &LanguageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_GrammarId() {
        GrammarId := VARIANT()
        result := ComCall(8, this, "ptr", GrammarId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GrammarId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_StartTime() {
        StartTime := VARIANT()
        result := ComCall(9, this, "ptr", StartTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StartTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_AudioStreamPosition() {
        AudioStreamPosition := VARIANT()
        result := ComCall(10, this, "ptr", AudioStreamPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStreamPosition
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeBytes() {
        result := ComCall(11, this, "int*", &pAudioSizeBytes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pAudioSizeBytes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetainedSizeBytes() {
        result := ComCall(12, this, "int*", &RetainedSizeBytes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RetainedSizeBytes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeTime() {
        result := ComCall(13, this, "int*", &AudioSizeTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioSizeTime
    }

    /**
     * 
     * @returns {ISpeechPhraseRule} 
     */
    get_Rule() {
        result := ComCall(14, this, "ptr*", &Rule := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechPhraseRule(Rule)
    }

    /**
     * 
     * @returns {ISpeechPhraseProperties} 
     */
    get_Properties() {
        result := ComCall(15, this, "ptr*", &Properties_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechPhraseProperties(Properties_)
    }

    /**
     * 
     * @returns {ISpeechPhraseElements} 
     */
    get_Elements() {
        result := ComCall(16, this, "ptr*", &Elements := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechPhraseElements(Elements)
    }

    /**
     * 
     * @returns {ISpeechPhraseReplacements} 
     */
    get_Replacements() {
        result := ComCall(17, this, "ptr*", &Replacements := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechPhraseReplacements(Replacements)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_EngineId() {
        EngineIdGuid := BSTR()
        result := ComCall(18, this, "ptr", EngineIdGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EngineIdGuid
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_EnginePrivateData() {
        PrivateData_ := VARIANT()
        result := ComCall(19, this, "ptr", PrivateData_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrivateData_
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveToMemory() {
        PhraseBlock := VARIANT()
        result := ComCall(20, this, "ptr", PhraseBlock, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhraseBlock
    }

    /**
     * The GetTextAlign function retrieves the text-alignment setting for the specified device context.
     * @remarks
     * The bounding rectangle is a rectangle bounding all of the character cells in a string of text. Its dimensions can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function.
     * 
     * The text-alignment flags determine how the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions align a string of text in relation to the string's reference point provided to <b>TextOut</b> or <b>ExtTextOut</b>.
     * 
     * The text-alignment flags are not necessarily single bit flags and may be equal to zero. The flags must be examined in groups of related flags, as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and TA_CENTER</li>
     * <li>TA_BOTTOM, TA_TOP, and TA_BASELINE</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * If the current font has a vertical default base line, the related flags are as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and VTA_BASELINE</li>
     * <li>TA_BOTTOM, TA_TOP, and VTA_CENTER</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * <p class="proch"><b>To verify that a particular flag is set in the return value of this function:</b>
     * 
     * <ol>
     * <li>Apply the bitwise OR operator to the flag and its related flags.</li>
     * <li>Apply the bitwise AND operator to the result and the return value.</li>
     * <li>Test for the equality of this result and the flag.</li>
     * </ol>
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-gettextalign
     */
    GetText(StartElement, Elements, UseReplacements) {
        Text := BSTR()
        result := ComCall(21, this, "int", StartElement, "int", Elements, "short", UseReplacements, "ptr", Text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(22, this, "int", StartElement, "int", Elements, "short", UseReplacements, "int*", &DisplayAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayAttributes
    }
}
