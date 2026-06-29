#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechPhraseReplacements.ahk" { ISpeechPhraseReplacements }
#Import ".\ISpeechPhraseProperties.ahk" { ISpeechPhraseProperties }
#Import ".\SpeechDisplayAttributes.ahk" { SpeechDisplayAttributes }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISpeechPhraseElements.ahk" { ISpeechPhraseElements }
#Import ".\ISpeechPhraseRule.ahk" { ISpeechPhraseRule }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseInfo extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseInfo
     * @type {Guid}
     */
    static IID := Guid("{961559cf-4e67-4662-8bf0-d93f1fcd61b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LanguageId          : IntPtr
        get_GrammarId           : IntPtr
        get_StartTime           : IntPtr
        get_AudioStreamPosition : IntPtr
        get_AudioSizeBytes      : IntPtr
        get_RetainedSizeBytes   : IntPtr
        get_AudioSizeTime       : IntPtr
        get_Rule                : IntPtr
        get_Properties          : IntPtr
        get_Elements            : IntPtr
        get_Replacements        : IntPtr
        get_EngineId            : IntPtr
        get_EnginePrivateData   : IntPtr
        SaveToMemory            : IntPtr
        GetText                 : IntPtr
        GetDisplayAttributes    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, "int*", &LanguageId := 0, "HRESULT")
        return LanguageId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_GrammarId() {
        GrammarId := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, GrammarId, "HRESULT")
        return GrammarId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_StartTime() {
        StartTime := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, StartTime, "HRESULT")
        return StartTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_AudioStreamPosition() {
        AudioStreamPosition := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, AudioStreamPosition, "HRESULT")
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
        result := ComCall(15, this, "ptr*", &_Properties := 0, "HRESULT")
        return ISpeechPhraseProperties(_Properties)
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
        EngineIdGuid := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, EngineIdGuid, "HRESULT")
        return EngineIdGuid
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_EnginePrivateData() {
        _PrivateData := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, _PrivateData, "HRESULT")
        return _PrivateData
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveToMemory() {
        PhraseBlock := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, PhraseBlock, "HRESULT")
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
        Text := BSTR.Owned()
        result := ComCall(21, this, "int", StartElement, "int", Elements, VARIANT_BOOL, UseReplacements, BSTR.Ptr, Text, "HRESULT")
        return Text
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {VARIANT_BOOL} UseReplacements 
     * @returns {SpeechDisplayAttributes} 
     */
    GetDisplayAttributes(StartElement, Elements, UseReplacements) {
        result := ComCall(22, this, "int", StartElement, "int", Elements, VARIANT_BOOL, UseReplacements, "int*", &DisplayAttributes := 0, "HRESULT")
        return DisplayAttributes
    }

    Query(iid) {
        if (ISpeechPhraseInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LanguageId := CallbackCreate(GetMethod(implObj, "get_LanguageId"), flags, 2)
        this.vtbl.get_GrammarId := CallbackCreate(GetMethod(implObj, "get_GrammarId"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.get_AudioStreamPosition := CallbackCreate(GetMethod(implObj, "get_AudioStreamPosition"), flags, 2)
        this.vtbl.get_AudioSizeBytes := CallbackCreate(GetMethod(implObj, "get_AudioSizeBytes"), flags, 2)
        this.vtbl.get_RetainedSizeBytes := CallbackCreate(GetMethod(implObj, "get_RetainedSizeBytes"), flags, 2)
        this.vtbl.get_AudioSizeTime := CallbackCreate(GetMethod(implObj, "get_AudioSizeTime"), flags, 2)
        this.vtbl.get_Rule := CallbackCreate(GetMethod(implObj, "get_Rule"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.get_Elements := CallbackCreate(GetMethod(implObj, "get_Elements"), flags, 2)
        this.vtbl.get_Replacements := CallbackCreate(GetMethod(implObj, "get_Replacements"), flags, 2)
        this.vtbl.get_EngineId := CallbackCreate(GetMethod(implObj, "get_EngineId"), flags, 2)
        this.vtbl.get_EnginePrivateData := CallbackCreate(GetMethod(implObj, "get_EnginePrivateData"), flags, 2)
        this.vtbl.SaveToMemory := CallbackCreate(GetMethod(implObj, "SaveToMemory"), flags, 2)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 5)
        this.vtbl.GetDisplayAttributes := CallbackCreate(GetMethod(implObj, "GetDisplayAttributes"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LanguageId)
        CallbackFree(this.vtbl.get_GrammarId)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.get_AudioStreamPosition)
        CallbackFree(this.vtbl.get_AudioSizeBytes)
        CallbackFree(this.vtbl.get_RetainedSizeBytes)
        CallbackFree(this.vtbl.get_AudioSizeTime)
        CallbackFree(this.vtbl.get_Rule)
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.get_Elements)
        CallbackFree(this.vtbl.get_Replacements)
        CallbackFree(this.vtbl.get_EngineId)
        CallbackFree(this.vtbl.get_EnginePrivateData)
        CallbackFree(this.vtbl.SaveToMemory)
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.GetDisplayAttributes)
    }
}
