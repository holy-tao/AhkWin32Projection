#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\SpeechEngineConfidence.ahk" { SpeechEngineConfidence }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechDisplayAttributes.ahk" { SpeechDisplayAttributes }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseElement extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseElement
     * @type {Guid}
     */
    static IID := Guid("{e6176f96-e373-4801-b223-3b62c068c0b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AudioTimeOffset      : IntPtr
        get_AudioSizeTime        : IntPtr
        get_AudioStreamOffset    : IntPtr
        get_AudioSizeBytes       : IntPtr
        get_RetainedStreamOffset : IntPtr
        get_RetainedSizeBytes    : IntPtr
        get_DisplayText          : IntPtr
        get_LexicalForm          : IntPtr
        get_Pronunciation        : IntPtr
        get_DisplayAttributes    : IntPtr
        get_RequiredConfidence   : IntPtr
        get_ActualConfidence     : IntPtr
        get_EngineConfidence     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {SpeechDisplayAttributes} 
     */
    DisplayAttributes {
        get => this.get_DisplayAttributes()
    }

    /**
     * @type {SpeechEngineConfidence} 
     */
    RequiredConfidence {
        get => this.get_RequiredConfidence()
    }

    /**
     * @type {SpeechEngineConfidence} 
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
        DisplayText := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, DisplayText, "HRESULT")
        return DisplayText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LexicalForm() {
        LexicalForm := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, LexicalForm, "HRESULT")
        return LexicalForm
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Pronunciation() {
        Pronunciation := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, Pronunciation, "HRESULT")
        return Pronunciation
    }

    /**
     * 
     * @returns {SpeechDisplayAttributes} 
     */
    get_DisplayAttributes() {
        result := ComCall(16, this, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }

    /**
     * 
     * @returns {SpeechEngineConfidence} 
     */
    get_RequiredConfidence() {
        result := ComCall(17, this, "int*", &RequiredConfidence := 0, "HRESULT")
        return RequiredConfidence
    }

    /**
     * 
     * @returns {SpeechEngineConfidence} 
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

    Query(iid) {
        if (ISpeechPhraseElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AudioTimeOffset := CallbackCreate(GetMethod(implObj, "get_AudioTimeOffset"), flags, 2)
        this.vtbl.get_AudioSizeTime := CallbackCreate(GetMethod(implObj, "get_AudioSizeTime"), flags, 2)
        this.vtbl.get_AudioStreamOffset := CallbackCreate(GetMethod(implObj, "get_AudioStreamOffset"), flags, 2)
        this.vtbl.get_AudioSizeBytes := CallbackCreate(GetMethod(implObj, "get_AudioSizeBytes"), flags, 2)
        this.vtbl.get_RetainedStreamOffset := CallbackCreate(GetMethod(implObj, "get_RetainedStreamOffset"), flags, 2)
        this.vtbl.get_RetainedSizeBytes := CallbackCreate(GetMethod(implObj, "get_RetainedSizeBytes"), flags, 2)
        this.vtbl.get_DisplayText := CallbackCreate(GetMethod(implObj, "get_DisplayText"), flags, 2)
        this.vtbl.get_LexicalForm := CallbackCreate(GetMethod(implObj, "get_LexicalForm"), flags, 2)
        this.vtbl.get_Pronunciation := CallbackCreate(GetMethod(implObj, "get_Pronunciation"), flags, 2)
        this.vtbl.get_DisplayAttributes := CallbackCreate(GetMethod(implObj, "get_DisplayAttributes"), flags, 2)
        this.vtbl.get_RequiredConfidence := CallbackCreate(GetMethod(implObj, "get_RequiredConfidence"), flags, 2)
        this.vtbl.get_ActualConfidence := CallbackCreate(GetMethod(implObj, "get_ActualConfidence"), flags, 2)
        this.vtbl.get_EngineConfidence := CallbackCreate(GetMethod(implObj, "get_EngineConfidence"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AudioTimeOffset)
        CallbackFree(this.vtbl.get_AudioSizeTime)
        CallbackFree(this.vtbl.get_AudioStreamOffset)
        CallbackFree(this.vtbl.get_AudioSizeBytes)
        CallbackFree(this.vtbl.get_RetainedStreamOffset)
        CallbackFree(this.vtbl.get_RetainedSizeBytes)
        CallbackFree(this.vtbl.get_DisplayText)
        CallbackFree(this.vtbl.get_LexicalForm)
        CallbackFree(this.vtbl.get_Pronunciation)
        CallbackFree(this.vtbl.get_DisplayAttributes)
        CallbackFree(this.vtbl.get_RequiredConfidence)
        CallbackFree(this.vtbl.get_ActualConfidence)
        CallbackFree(this.vtbl.get_EngineConfidence)
    }
}
