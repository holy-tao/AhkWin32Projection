#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechRecoContext.ahk
#Include .\ISpeechRecoResultTimes.ahk
#Include .\ISpeechAudioFormat.ahk
#Include .\ISpeechPhraseInfo.ahk
#Include .\ISpeechPhraseAlternates.ahk
#Include .\ISpeechMemoryStream.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoResultDispatch extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecoResultDispatch
     * @type {Guid}
     */
    static IID => Guid("{6d60eb64-aced-40a6-bbf3-4e557f71dee2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecoContext", "get_Times", "putref_AudioFormat", "get_AudioFormat", "get_PhraseInfo", "Alternates", "Audio", "SpeakAudio", "SaveToMemory", "DiscardResultInfo", "GetXMLResult", "GetXMLErrorInfo", "SetTextFeedback"]

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
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @returns {ISpeechMemoryStream} 
     */
    Audio(StartElement, Elements) {
        result := ComCall(13, this, "int", StartElement, "int", Elements, "ptr*", &Stream := 0, "HRESULT")
        return ISpeechMemoryStream(Stream)
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    SpeakAudio(StartElement, Elements, Flags) {
        result := ComCall(14, this, "int", StartElement, "int", Elements, "int", Flags, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveToMemory() {
        ResultBlock := VARIANT()
        result := ComCall(15, this, "ptr", ResultBlock, "HRESULT")
        return ResultBlock
    }

    /**
     * 
     * @param {Integer} ValueTypes 
     * @returns {HRESULT} 
     */
    DiscardResultInfo(ValueTypes) {
        result := ComCall(16, this, "int", ValueTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {BSTR} 
     */
    GetXMLResult(Options) {
        pResult := BSTR()
        result := ComCall(17, this, "int", Options, "ptr", pResult, "HRESULT")
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

        result := ComCall(18, this, LineNumberMarshal, LineNumber, "ptr", ScriptLine, "ptr", Source, "ptr", Description, ResultCodeMarshal, ResultCode, IsErrorMarshal, IsError, "HRESULT")
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

        result := ComCall(19, this, "ptr", Feedback, "short", WasSuccessful, "HRESULT")
        return result
    }
}
