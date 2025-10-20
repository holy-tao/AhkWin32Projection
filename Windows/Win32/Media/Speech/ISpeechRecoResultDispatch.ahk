#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<ISpeechRecoContext>} RecoContext 
     * @returns {HRESULT} 
     */
    get_RecoContext(RecoContext) {
        result := ComCall(7, this, "ptr*", RecoContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecoResultTimes>} Times 
     * @returns {HRESULT} 
     */
    get_Times(Times) {
        result := ComCall(8, this, "ptr*", Times, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    get_AudioFormat(Format) {
        result := ComCall(10, this, "ptr*", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseInfo>} PhraseInfo 
     * @returns {HRESULT} 
     */
    get_PhraseInfo(PhraseInfo) {
        result := ComCall(11, this, "ptr*", PhraseInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequestCount 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Pointer<ISpeechPhraseAlternates>} Alternates 
     * @returns {HRESULT} 
     */
    Alternates(RequestCount, StartElement, Elements, Alternates) {
        result := ComCall(12, this, "int", RequestCount, "int", StartElement, "int", Elements, "ptr*", Alternates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Pointer<ISpeechMemoryStream>} Stream 
     * @returns {HRESULT} 
     */
    Audio(StartElement, Elements, Stream) {
        result := ComCall(13, this, "int", StartElement, "int", Elements, "ptr*", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    SpeakAudio(StartElement, Elements, Flags, StreamNumber) {
        result := ComCall(14, this, "int", StartElement, "int", Elements, "int", Flags, "int*", StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @returns {HRESULT} 
     */
    SaveToMemory(ResultBlock) {
        result := ComCall(15, this, "ptr", ResultBlock, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetXMLResult(Options, pResult) {
        result := ComCall(17, this, "int", Options, "ptr", pResult, "HRESULT")
        return result
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
        result := ComCall(18, this, "int*", LineNumber, "ptr", ScriptLine, "ptr", Source, "ptr", Description, "ptr", ResultCode, "ptr", IsError, "HRESULT")
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
