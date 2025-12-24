#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {Integer} 
     */
    AudioTimeOffset {
        get => this.get_AudioTimeOffset()
    }

    /**
     * @type {Integer} 
     */
    AudioSizeTime {
        get => this.get_AudioSizeTime()
    }

    /**
     * @type {Integer} 
     */
    AudioStreamOffset {
        get => this.get_AudioStreamOffset()
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
    RetainedStreamOffset {
        get => this.get_RetainedStreamOffset()
    }

    /**
     * @type {Integer} 
     */
    RetainedSizeBytes {
        get => this.get_RetainedSizeBytes()
    }

    /**
     * @type {BSTR} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * @type {BSTR} 
     */
    LexicalForm {
        get => this.get_LexicalForm()
    }

    /**
     * @type {VARIANT} 
     */
    Pronunciation {
        get => this.get_Pronunciation()
    }

    /**
     * @type {Integer} 
     */
    DisplayAttributes {
        get => this.get_DisplayAttributes()
    }

    /**
     * @type {Integer} 
     */
    RequiredConfidence {
        get => this.get_RequiredConfidence()
    }

    /**
     * @type {Integer} 
     */
    ActualConfidence {
        get => this.get_ActualConfidence()
    }

    /**
     * @type {Float} 
     */
    EngineConfidence {
        get => this.get_EngineConfidence()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioTimeOffset() {
        result := ComCall(7, this, "int*", &AudioTimeOffset := 0, "HRESULT")
        return AudioTimeOffset
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeTime() {
        result := ComCall(8, this, "int*", &AudioSizeTime := 0, "HRESULT")
        return AudioSizeTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioStreamOffset() {
        result := ComCall(9, this, "int*", &AudioStreamOffset := 0, "HRESULT")
        return AudioStreamOffset
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSizeBytes() {
        result := ComCall(10, this, "int*", &AudioSizeBytes := 0, "HRESULT")
        return AudioSizeBytes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetainedStreamOffset() {
        result := ComCall(11, this, "int*", &RetainedStreamOffset := 0, "HRESULT")
        return RetainedStreamOffset
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
     * @returns {BSTR} 
     */
    get_DisplayText() {
        DisplayText := BSTR()
        result := ComCall(13, this, "ptr", DisplayText, "HRESULT")
        return DisplayText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LexicalForm() {
        LexicalForm := BSTR()
        result := ComCall(14, this, "ptr", LexicalForm, "HRESULT")
        return LexicalForm
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Pronunciation() {
        Pronunciation := VARIANT()
        result := ComCall(15, this, "ptr", Pronunciation, "HRESULT")
        return Pronunciation
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayAttributes() {
        result := ComCall(16, this, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequiredConfidence() {
        result := ComCall(17, this, "int*", &RequiredConfidence := 0, "HRESULT")
        return RequiredConfidence
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualConfidence() {
        result := ComCall(18, this, "int*", &ActualConfidence := 0, "HRESULT")
        return ActualConfidence
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EngineConfidence() {
        result := ComCall(19, this, "float*", &EngineConfidence := 0, "HRESULT")
        return EngineConfidence
    }
}
