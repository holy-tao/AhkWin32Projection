#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SpeechRetainedAudioOptions.ahk" { SpeechRetainedAudioOptions }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISpeechRecognizer.ahk" { ISpeechRecognizer }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechAudioFormat.ahk" { ISpeechAudioFormat }
#Import ".\SpeechInterference.ahk" { SpeechInterference }
#Import ".\ISpeechRecoGrammar.ahk" { ISpeechRecoGrammar }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechRecoEvents.ahk" { SpeechRecoEvents }
#Import ".\ISpeechVoice.ahk" { ISpeechVoice }
#Import ".\ISpeechRecoResult.ahk" { ISpeechRecoResult }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SpeechRecoContextState.ahk" { SpeechRecoContextState }
#Import ".\SpeechBookmarkOptions.ahk" { SpeechBookmarkOptions }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecoContext extends IDispatch {
    /**
     * The interface identifier for ISpeechRecoContext
     * @type {Guid}
     */
    static IID := Guid("{580aa49d-7e1e-4809-b8e2-57da806104b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecoContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Recognizer                        : IntPtr
        get_AudioInputInterferenceStatus      : IntPtr
        get_RequestedUIType                   : IntPtr
        putref_Voice                          : IntPtr
        get_Voice                             : IntPtr
        put_AllowVoiceFormatMatchingOnNextSet : IntPtr
        get_AllowVoiceFormatMatchingOnNextSet : IntPtr
        put_VoicePurgeEvent                   : IntPtr
        get_VoicePurgeEvent                   : IntPtr
        put_EventInterests                    : IntPtr
        get_EventInterests                    : IntPtr
        put_CmdMaxAlternates                  : IntPtr
        get_CmdMaxAlternates                  : IntPtr
        put_State                             : IntPtr
        get_State                             : IntPtr
        put_RetainedAudio                     : IntPtr
        get_RetainedAudio                     : IntPtr
        putref_RetainedAudioFormat            : IntPtr
        get_RetainedAudioFormat               : IntPtr
        Pause                                 : IntPtr
        Resume                                : IntPtr
        CreateGrammar                         : IntPtr
        CreateResultFromMemory                : IntPtr
        Bookmark                              : IntPtr
        SetAdaptationData                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecoContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechRecognizer} 
     */
    Recognizer {
        get => this.get_Recognizer()
    }

    /**
     * @type {SpeechInterference} 
     */
    AudioInputInterferenceStatus {
        get => this.get_AudioInputInterferenceStatus()
    }

    /**
     * @type {BSTR} 
     */
    RequestedUIType {
        get => this.get_RequestedUIType()
    }

    /**
     * @type {ISpeechVoice} 
     */
    Voice {
        get => this.get_Voice()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowVoiceFormatMatchingOnNextSet {
        get => this.get_AllowVoiceFormatMatchingOnNextSet()
        set => this.put_AllowVoiceFormatMatchingOnNextSet(value)
    }

    /**
     * @type {SpeechRecoEvents} 
     */
    VoicePurgeEvent {
        get => this.get_VoicePurgeEvent()
        set => this.put_VoicePurgeEvent(value)
    }

    /**
     * @type {SpeechRecoEvents} 
     */
    EventInterests {
        get => this.get_EventInterests()
        set => this.put_EventInterests(value)
    }

    /**
     * @type {Integer} 
     */
    CmdMaxAlternates {
        get => this.get_CmdMaxAlternates()
        set => this.put_CmdMaxAlternates(value)
    }

    /**
     * @type {SpeechRecoContextState} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {SpeechRetainedAudioOptions} 
     */
    RetainedAudio {
        get => this.get_RetainedAudio()
        set => this.put_RetainedAudio(value)
    }

    /**
     * @type {ISpeechAudioFormat} 
     */
    RetainedAudioFormat {
        get => this.get_RetainedAudioFormat()
    }

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
     * @returns {SpeechInterference} 
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
        UIType := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, UIType, "HRESULT")
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
        result := ComCall(12, this, VARIANT_BOOL, Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowVoiceFormatMatchingOnNextSet() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pAllow := 0, "HRESULT")
        return pAllow
    }

    /**
     * 
     * @param {SpeechRecoEvents} EventInterest 
     * @returns {HRESULT} 
     */
    put_VoicePurgeEvent(EventInterest) {
        result := ComCall(14, this, SpeechRecoEvents, EventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechRecoEvents} 
     */
    get_VoicePurgeEvent() {
        result := ComCall(15, this, "int*", &EventInterest := 0, "HRESULT")
        return EventInterest
    }

    /**
     * 
     * @param {SpeechRecoEvents} EventInterest 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterest) {
        result := ComCall(16, this, SpeechRecoEvents, EventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechRecoEvents} 
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
     * @param {SpeechRecoContextState} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(20, this, SpeechRecoContextState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechRecoContextState} 
     */
    get_State() {
        result := ComCall(21, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @param {SpeechRetainedAudioOptions} Option 
     * @returns {HRESULT} 
     */
    put_RetainedAudio(Option) {
        result := ComCall(22, this, SpeechRetainedAudioOptions, Option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechRetainedAudioOptions} 
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
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
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
        result := ComCall(28, this, VARIANT, GrammarId, "ptr*", &Grammar := 0, "HRESULT")
        return ISpeechRecoGrammar(Grammar)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @returns {ISpeechRecoResult} 
     */
    CreateResultFromMemory(ResultBlock) {
        result := ComCall(29, this, VARIANT.Ptr, ResultBlock, "ptr*", &Result := 0, "HRESULT")
        return ISpeechRecoResult(Result)
    }

    /**
     * 
     * @param {SpeechBookmarkOptions} Options 
     * @param {VARIANT} StreamPos 
     * @param {VARIANT} BookmarkId 
     * @returns {HRESULT} 
     */
    Bookmark(Options, StreamPos, BookmarkId) {
        result := ComCall(30, this, SpeechBookmarkOptions, Options, VARIANT, StreamPos, VARIANT, BookmarkId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AdaptationString 
     * @returns {HRESULT} 
     */
    SetAdaptationData(AdaptationString) {
        AdaptationString := AdaptationString is String ? BSTR.Alloc(AdaptationString).Value : AdaptationString

        result := ComCall(31, this, BSTR, AdaptationString, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechRecoContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Recognizer := CallbackCreate(GetMethod(implObj, "get_Recognizer"), flags, 2)
        this.vtbl.get_AudioInputInterferenceStatus := CallbackCreate(GetMethod(implObj, "get_AudioInputInterferenceStatus"), flags, 2)
        this.vtbl.get_RequestedUIType := CallbackCreate(GetMethod(implObj, "get_RequestedUIType"), flags, 2)
        this.vtbl.putref_Voice := CallbackCreate(GetMethod(implObj, "putref_Voice"), flags, 2)
        this.vtbl.get_Voice := CallbackCreate(GetMethod(implObj, "get_Voice"), flags, 2)
        this.vtbl.put_AllowVoiceFormatMatchingOnNextSet := CallbackCreate(GetMethod(implObj, "put_AllowVoiceFormatMatchingOnNextSet"), flags, 2)
        this.vtbl.get_AllowVoiceFormatMatchingOnNextSet := CallbackCreate(GetMethod(implObj, "get_AllowVoiceFormatMatchingOnNextSet"), flags, 2)
        this.vtbl.put_VoicePurgeEvent := CallbackCreate(GetMethod(implObj, "put_VoicePurgeEvent"), flags, 2)
        this.vtbl.get_VoicePurgeEvent := CallbackCreate(GetMethod(implObj, "get_VoicePurgeEvent"), flags, 2)
        this.vtbl.put_EventInterests := CallbackCreate(GetMethod(implObj, "put_EventInterests"), flags, 2)
        this.vtbl.get_EventInterests := CallbackCreate(GetMethod(implObj, "get_EventInterests"), flags, 2)
        this.vtbl.put_CmdMaxAlternates := CallbackCreate(GetMethod(implObj, "put_CmdMaxAlternates"), flags, 2)
        this.vtbl.get_CmdMaxAlternates := CallbackCreate(GetMethod(implObj, "get_CmdMaxAlternates"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.put_RetainedAudio := CallbackCreate(GetMethod(implObj, "put_RetainedAudio"), flags, 2)
        this.vtbl.get_RetainedAudio := CallbackCreate(GetMethod(implObj, "get_RetainedAudio"), flags, 2)
        this.vtbl.putref_RetainedAudioFormat := CallbackCreate(GetMethod(implObj, "putref_RetainedAudioFormat"), flags, 2)
        this.vtbl.get_RetainedAudioFormat := CallbackCreate(GetMethod(implObj, "get_RetainedAudioFormat"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.CreateGrammar := CallbackCreate(GetMethod(implObj, "CreateGrammar"), flags, 3)
        this.vtbl.CreateResultFromMemory := CallbackCreate(GetMethod(implObj, "CreateResultFromMemory"), flags, 3)
        this.vtbl.Bookmark := CallbackCreate(GetMethod(implObj, "Bookmark"), flags, 4)
        this.vtbl.SetAdaptationData := CallbackCreate(GetMethod(implObj, "SetAdaptationData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Recognizer)
        CallbackFree(this.vtbl.get_AudioInputInterferenceStatus)
        CallbackFree(this.vtbl.get_RequestedUIType)
        CallbackFree(this.vtbl.putref_Voice)
        CallbackFree(this.vtbl.get_Voice)
        CallbackFree(this.vtbl.put_AllowVoiceFormatMatchingOnNextSet)
        CallbackFree(this.vtbl.get_AllowVoiceFormatMatchingOnNextSet)
        CallbackFree(this.vtbl.put_VoicePurgeEvent)
        CallbackFree(this.vtbl.get_VoicePurgeEvent)
        CallbackFree(this.vtbl.put_EventInterests)
        CallbackFree(this.vtbl.get_EventInterests)
        CallbackFree(this.vtbl.put_CmdMaxAlternates)
        CallbackFree(this.vtbl.get_CmdMaxAlternates)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.put_RetainedAudio)
        CallbackFree(this.vtbl.get_RetainedAudio)
        CallbackFree(this.vtbl.putref_RetainedAudioFormat)
        CallbackFree(this.vtbl.get_RetainedAudioFormat)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.CreateGrammar)
        CallbackFree(this.vtbl.CreateResultFromMemory)
        CallbackFree(this.vtbl.Bookmark)
        CallbackFree(this.vtbl.SetAdaptationData)
    }
}
