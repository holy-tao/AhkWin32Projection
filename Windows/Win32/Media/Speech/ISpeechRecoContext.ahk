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
     * 
     * @param {Pointer<ISpeechRecognizer>} Recognizer 
     * @returns {HRESULT} 
     */
    get_Recognizer(Recognizer) {
        result := ComCall(7, this, "ptr", Recognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Interference 
     * @returns {HRESULT} 
     */
    get_AudioInputInterferenceStatus(Interference) {
        result := ComCall(8, this, "int*", Interference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} UIType 
     * @returns {HRESULT} 
     */
    get_RequestedUIType(UIType) {
        result := ComCall(9, this, "ptr", UIType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechVoice>} Voice 
     * @returns {HRESULT} 
     */
    putref_Voice(Voice) {
        result := ComCall(10, this, "ptr", Voice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechVoice>} Voice 
     * @returns {HRESULT} 
     */
    get_Voice(Voice) {
        result := ComCall(11, this, "ptr", Voice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowVoiceFormatMatchingOnNextSet(Allow) {
        result := ComCall(12, this, "short", Allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pAllow 
     * @returns {HRESULT} 
     */
    get_AllowVoiceFormatMatchingOnNextSet(pAllow) {
        result := ComCall(13, this, "ptr", pAllow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventInterest 
     * @returns {HRESULT} 
     */
    put_VoicePurgeEvent(EventInterest) {
        result := ComCall(14, this, "int", EventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EventInterest 
     * @returns {HRESULT} 
     */
    get_VoicePurgeEvent(EventInterest) {
        result := ComCall(15, this, "int*", EventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventInterest 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterest) {
        result := ComCall(16, this, "int", EventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EventInterest 
     * @returns {HRESULT} 
     */
    get_EventInterests(EventInterest) {
        result := ComCall(17, this, "int*", EventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MaxAlternates 
     * @returns {HRESULT} 
     */
    put_CmdMaxAlternates(MaxAlternates) {
        result := ComCall(18, this, "int", MaxAlternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxAlternates 
     * @returns {HRESULT} 
     */
    get_CmdMaxAlternates(MaxAlternates) {
        result := ComCall(19, this, "int*", MaxAlternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(20, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        result := ComCall(21, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Option 
     * @returns {HRESULT} 
     */
    put_RetainedAudio(Option) {
        result := ComCall(22, this, "int", Option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Option 
     * @returns {HRESULT} 
     */
    get_RetainedAudio(Option) {
        result := ComCall(23, this, "int*", Option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    putref_RetainedAudioFormat(Format) {
        result := ComCall(24, this, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    get_RetainedAudioFormat(Format) {
        result := ComCall(25, this, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} GrammarId 
     * @param {Pointer<ISpeechRecoGrammar>} Grammar 
     * @returns {HRESULT} 
     */
    CreateGrammar(GrammarId, Grammar) {
        result := ComCall(28, this, "ptr", GrammarId, "ptr", Grammar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @param {Pointer<ISpeechRecoResult>} Result 
     * @returns {HRESULT} 
     */
    CreateResultFromMemory(ResultBlock, Result) {
        result := ComCall(29, this, "ptr", ResultBlock, "ptr", Result, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(30, this, "int", Options, "ptr", StreamPos, "ptr", BookmarkId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} AdaptationString 
     * @returns {HRESULT} 
     */
    SetAdaptationData(AdaptationString) {
        AdaptationString := AdaptationString is String ? BSTR.Alloc(AdaptationString).Value : AdaptationString

        result := ComCall(31, this, "ptr", AdaptationString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
