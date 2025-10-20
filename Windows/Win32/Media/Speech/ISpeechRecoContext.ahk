#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<ISpeechRecognizer>} Recognizer 
     * @returns {HRESULT} 
     */
    get_Recognizer(Recognizer) {
        result := ComCall(7, this, "ptr*", Recognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Interference 
     * @returns {HRESULT} 
     */
    get_AudioInputInterferenceStatus(Interference) {
        result := ComCall(8, this, "int*", Interference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} UIType 
     * @returns {HRESULT} 
     */
    get_RequestedUIType(UIType) {
        result := ComCall(9, this, "ptr", UIType, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechVoice>} Voice 
     * @returns {HRESULT} 
     */
    get_Voice(Voice) {
        result := ComCall(11, this, "ptr*", Voice, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pAllow 
     * @returns {HRESULT} 
     */
    get_AllowVoiceFormatMatchingOnNextSet(pAllow) {
        result := ComCall(13, this, "ptr", pAllow, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} EventInterest 
     * @returns {HRESULT} 
     */
    get_VoicePurgeEvent(EventInterest) {
        result := ComCall(15, this, "int*", EventInterest, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} EventInterest 
     * @returns {HRESULT} 
     */
    get_EventInterests(EventInterest) {
        result := ComCall(17, this, "int*", EventInterest, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MaxAlternates 
     * @returns {HRESULT} 
     */
    get_CmdMaxAlternates(MaxAlternates) {
        result := ComCall(19, this, "int*", MaxAlternates, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        result := ComCall(21, this, "int*", State, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Option 
     * @returns {HRESULT} 
     */
    get_RetainedAudio(Option) {
        result := ComCall(23, this, "int*", Option, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    get_RetainedAudioFormat(Format) {
        result := ComCall(25, this, "ptr*", Format, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechRecoGrammar>} Grammar 
     * @returns {HRESULT} 
     */
    CreateGrammar(GrammarId, Grammar) {
        result := ComCall(28, this, "ptr", GrammarId, "ptr*", Grammar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @param {Pointer<ISpeechRecoResult>} Result 
     * @returns {HRESULT} 
     */
    CreateResultFromMemory(ResultBlock, Result) {
        result := ComCall(29, this, "ptr", ResultBlock, "ptr*", Result, "HRESULT")
        return result
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
