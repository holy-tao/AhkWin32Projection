#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPXMLRESULTOPTIONS.ahk" { SPXMLRESULTOPTIONS }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISpeechPhraseInfo.ahk" { ISpeechPhraseInfo }
#Import ".\ISpeechMemoryStream.ahk" { ISpeechMemoryStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechAudioFormat.ahk" { ISpeechAudioFormat }
#Import ".\SpeechVoiceSpeakFlags.ahk" { SpeechVoiceSpeakFlags }
#Import ".\ISpeechPhraseAlternates.ahk" { ISpeechPhraseAlternates }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechRecoResultTimes.ahk" { ISpeechRecoResultTimes }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SpeechDiscardType.ahk" { SpeechDiscardType }
#Import ".\ISpeechRecoContext.ahk" { ISpeechRecoContext }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecoResultDispatch extends IDispatch {
    /**
     * The interface identifier for ISpeechRecoResultDispatch
     * @type {Guid}
     */
    static IID := Guid("{6d60eb64-aced-40a6-bbf3-4e557f71dee2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecoResultDispatch interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RecoContext    : IntPtr
        get_Times          : IntPtr
        putref_AudioFormat : IntPtr
        get_AudioFormat    : IntPtr
        get_PhraseInfo     : IntPtr
        Alternates         : IntPtr
        Audio              : IntPtr
        SpeakAudio         : IntPtr
        SaveToMemory       : IntPtr
        DiscardResultInfo  : IntPtr
        GetXMLResult       : IntPtr
        GetXMLErrorInfo    : IntPtr
        SetTextFeedback    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecoResultDispatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechRecoContext} 
     */
    RecoContext {
        get => this.get_RecoContext()
    }

    /**
     * @type {ISpeechRecoResultTimes} 
     */
    Times {
        get => this.get_Times()
    }

    /**
     * @type {ISpeechAudioFormat} 
     */
    AudioFormat {
        get => this.get_AudioFormat()
    }

    /**
     * @type {ISpeechPhraseInfo} 
     */
    PhraseInfo {
        get => this.get_PhraseInfo()
    }

    /**
     * 
     * @returns {ISpeechRecoContext} 
     */
    get_RecoContext() {
        result := ComCall(7, this, "ptr*", &RecoContext := 0, "HRESULT")
        return ISpeechRecoContext(RecoContext)
    }

    /**
     * 
     * @returns {ISpeechRecoResultTimes} 
     */
    get_Times() {
        result := ComCall(8, this, "ptr*", &Times := 0, "HRESULT")
        return ISpeechRecoResultTimes(Times)
    }

    /**
     * 
     * @param {ISpeechAudioFormat} Format 
     * @returns {HRESULT} 
     */
    putref_AudioFormat(Format) {
        result := ComCall(9, this, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_AudioFormat() {
        result := ComCall(10, this, "ptr*", &Format := 0, "HRESULT")
        return ISpeechAudioFormat(Format)
    }

    /**
     * 
     * @returns {ISpeechPhraseInfo} 
     */
    get_PhraseInfo() {
        result := ComCall(11, this, "ptr*", &PhraseInfo := 0, "HRESULT")
        return ISpeechPhraseInfo(PhraseInfo)
    }

    /**
     * 
     * @param {Integer} RequestCount 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @returns {ISpeechPhraseAlternates} 
     */
    Alternates(RequestCount, StartElement, Elements) {
        result := ComCall(12, this, "int", RequestCount, "int", StartElement, "int", Elements, "ptr*", &Alternates := 0, "HRESULT")
        return ISpeechPhraseAlternates(Alternates)
    }

    /**
     * The Audio Resampler performs one or both of the following actions on an audio stream.Change the sampling rate.Change the number of channels.
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @returns {ISpeechMemoryStream} 
     * @see https://learn.microsoft.com/windows/win32/medfound/audioresampler
     */
    Audio(StartElement, Elements) {
        result := ComCall(13, this, "int", StartElement, "int", Elements, "ptr*", &Stream := 0, "HRESULT")
        return ISpeechMemoryStream(Stream)
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {SpeechVoiceSpeakFlags} Flags 
     * @returns {Integer} 
     */
    SpeakAudio(StartElement, Elements, Flags) {
        result := ComCall(14, this, "int", StartElement, "int", Elements, SpeechVoiceSpeakFlags, Flags, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveToMemory() {
        ResultBlock := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, ResultBlock, "HRESULT")
        return ResultBlock
    }

    /**
     * 
     * @param {SpeechDiscardType} ValueTypes 
     * @returns {HRESULT} 
     */
    DiscardResultInfo(ValueTypes) {
        result := ComCall(16, this, SpeechDiscardType, ValueTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPXMLRESULTOPTIONS} Options 
     * @returns {BSTR} 
     */
    GetXMLResult(Options) {
        pResult := BSTR.Owned()
        result := ComCall(17, this, SPXMLRESULTOPTIONS, Options, BSTR.Ptr, pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Pointer<Integer>} LineNumber 
     * @param {Pointer<BSTR>} ScriptLine 
     * @param {Pointer<BSTR>} Source 
     * @param {Pointer<BSTR>} Description 
     * @param {Pointer<HRESULT>} ResultCode 
     * @param {Pointer<VARIANT_BOOL>} IsError 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(LineNumber, ScriptLine, Source, Description, ResultCode, IsError) {
        LineNumberMarshal := LineNumber is VarRef ? "int*" : "ptr"
        ResultCodeMarshal := ResultCode is VarRef ? "int*" : "ptr"
        IsErrorMarshal := IsError is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, LineNumberMarshal, LineNumber, BSTR.Ptr, ScriptLine, BSTR.Ptr, Source, BSTR.Ptr, Description, ResultCodeMarshal, ResultCode, IsErrorMarshal, IsError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Feedback 
     * @param {VARIANT_BOOL} WasSuccessful 
     * @returns {HRESULT} 
     */
    SetTextFeedback(Feedback, WasSuccessful) {
        Feedback := Feedback is String ? BSTR.Alloc(Feedback).Value : Feedback

        result := ComCall(19, this, BSTR, Feedback, VARIANT_BOOL, WasSuccessful, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechRecoResultDispatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RecoContext := CallbackCreate(GetMethod(implObj, "get_RecoContext"), flags, 2)
        this.vtbl.get_Times := CallbackCreate(GetMethod(implObj, "get_Times"), flags, 2)
        this.vtbl.putref_AudioFormat := CallbackCreate(GetMethod(implObj, "putref_AudioFormat"), flags, 2)
        this.vtbl.get_AudioFormat := CallbackCreate(GetMethod(implObj, "get_AudioFormat"), flags, 2)
        this.vtbl.get_PhraseInfo := CallbackCreate(GetMethod(implObj, "get_PhraseInfo"), flags, 2)
        this.vtbl.Alternates := CallbackCreate(GetMethod(implObj, "Alternates"), flags, 5)
        this.vtbl.Audio := CallbackCreate(GetMethod(implObj, "Audio"), flags, 4)
        this.vtbl.SpeakAudio := CallbackCreate(GetMethod(implObj, "SpeakAudio"), flags, 5)
        this.vtbl.SaveToMemory := CallbackCreate(GetMethod(implObj, "SaveToMemory"), flags, 2)
        this.vtbl.DiscardResultInfo := CallbackCreate(GetMethod(implObj, "DiscardResultInfo"), flags, 2)
        this.vtbl.GetXMLResult := CallbackCreate(GetMethod(implObj, "GetXMLResult"), flags, 3)
        this.vtbl.GetXMLErrorInfo := CallbackCreate(GetMethod(implObj, "GetXMLErrorInfo"), flags, 7)
        this.vtbl.SetTextFeedback := CallbackCreate(GetMethod(implObj, "SetTextFeedback"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RecoContext)
        CallbackFree(this.vtbl.get_Times)
        CallbackFree(this.vtbl.putref_AudioFormat)
        CallbackFree(this.vtbl.get_AudioFormat)
        CallbackFree(this.vtbl.get_PhraseInfo)
        CallbackFree(this.vtbl.Alternates)
        CallbackFree(this.vtbl.Audio)
        CallbackFree(this.vtbl.SpeakAudio)
        CallbackFree(this.vtbl.SaveToMemory)
        CallbackFree(this.vtbl.DiscardResultInfo)
        CallbackFree(this.vtbl.GetXMLResult)
        CallbackFree(this.vtbl.GetXMLErrorInfo)
        CallbackFree(this.vtbl.SetTextFeedback)
    }
}
