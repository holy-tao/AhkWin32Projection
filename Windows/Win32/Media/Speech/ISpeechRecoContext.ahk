#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechRecognizer.ahk
#Include .\ISpeechVoice.ahk
#Include .\ISpeechAudioFormat.ahk
#Include .\ISpeechRecoGrammar.ahk
#Include .\ISpeechRecoResult.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecoContext
     * @type {Guid}
     */
    static IID => Guid("{580aa49d-7e1e-4809-b8e2-57da806104b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Recognizer", "get_AudioInputInterferenceStatus", "get_RequestedUIType", "putref_Voice", "get_Voice", "put_AllowVoiceFormatMatchingOnNextSet", "get_AllowVoiceFormatMatchingOnNextSet", "put_VoicePurgeEvent", "get_VoicePurgeEvent", "put_EventInterests", "get_EventInterests", "put_CmdMaxAlternates", "get_CmdMaxAlternates", "put_State", "get_State", "put_RetainedAudio", "get_RetainedAudio", "putref_RetainedAudioFormat", "get_RetainedAudioFormat", "Pause", "Resume", "CreateGrammar", "CreateResultFromMemory", "Bookmark", "SetAdaptationData"]

    /**
     * 
     * @returns {ISpeechRecognizer} 
     */
    get_Recognizer() {
        result := ComCall(7, this, "ptr*", &Recognizer := 0, "HRESULT")
        return ISpeechRecognizer(Recognizer)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioInputInterferenceStatus() {
        result := ComCall(8, this, "int*", &Interference := 0, "HRESULT")
        return Interference
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RequestedUIType() {
        UIType := BSTR()
        result := ComCall(9, this, "ptr", UIType, "HRESULT")
        return UIType
    }

    /**
     * 
     * @param {ISpeechVoice} Voice 
     * @returns {HRESULT} 
     */
    putref_Voice(Voice) {
        result := ComCall(10, this, "ptr", Voice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechVoice} 
     */
    get_Voice() {
        result := ComCall(11, this, "ptr*", &Voice := 0, "HRESULT")
        return ISpeechVoice(Voice)
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowVoiceFormatMatchingOnNextSet(Allow) {
        result := ComCall(12, this, "short", Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowVoiceFormatMatchingOnNextSet() {
        result := ComCall(13, this, "short*", &pAllow := 0, "HRESULT")
        return pAllow
    }

    /**
     * 
     * @param {Integer} EventInterest 
     * @returns {HRESULT} 
     */
    put_VoicePurgeEvent(EventInterest) {
        result := ComCall(14, this, "int", EventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VoicePurgeEvent() {
        result := ComCall(15, this, "int*", &EventInterest := 0, "HRESULT")
        return EventInterest
    }

    /**
     * 
     * @param {Integer} EventInterest 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterest) {
        result := ComCall(16, this, "int", EventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventInterests() {
        result := ComCall(17, this, "int*", &EventInterest := 0, "HRESULT")
        return EventInterest
    }

    /**
     * 
     * @param {Integer} MaxAlternates 
     * @returns {HRESULT} 
     */
    put_CmdMaxAlternates(MaxAlternates) {
        result := ComCall(18, this, "int", MaxAlternates, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CmdMaxAlternates() {
        result := ComCall(19, this, "int*", &MaxAlternates := 0, "HRESULT")
        return MaxAlternates
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(20, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(21, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @param {Integer} Option 
     * @returns {HRESULT} 
     */
    put_RetainedAudio(Option) {
        result := ComCall(22, this, "int", Option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetainedAudio() {
        result := ComCall(23, this, "int*", &Option := 0, "HRESULT")
        return Option
    }

    /**
     * 
     * @param {ISpeechAudioFormat} Format 
     * @returns {HRESULT} 
     */
    putref_RetainedAudioFormat(Format) {
        result := ComCall(24, this, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_RetainedAudioFormat() {
        result := ComCall(25, this, "ptr*", &Format := 0, "HRESULT")
        return ISpeechAudioFormat(Format)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} GrammarId 
     * @returns {ISpeechRecoGrammar} 
     */
    CreateGrammar(GrammarId) {
        result := ComCall(28, this, "ptr", GrammarId, "ptr*", &Grammar := 0, "HRESULT")
        return ISpeechRecoGrammar(Grammar)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @returns {ISpeechRecoResult} 
     */
    CreateResultFromMemory(ResultBlock) {
        result := ComCall(29, this, "ptr", ResultBlock, "ptr*", &Result := 0, "HRESULT")
        return ISpeechRecoResult(Result)
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {VARIANT} StreamPos 
     * @param {VARIANT} BookmarkId 
     * @returns {HRESULT} 
     */
    Bookmark(Options, StreamPos, BookmarkId) {
        result := ComCall(30, this, "int", Options, "ptr", StreamPos, "ptr", BookmarkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AdaptationString 
     * @returns {HRESULT} 
     */
    SetAdaptationData(AdaptationString) {
        AdaptationString := AdaptationString is String ? BSTR.Alloc(AdaptationString).Value : AdaptationString

        result := ComCall(31, this, "ptr", AdaptationString, "HRESULT")
        return result
    }
}
