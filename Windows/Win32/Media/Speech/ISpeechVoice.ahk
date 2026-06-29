#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechVoicePriority.ahk" { SpeechVoicePriority }
#Import ".\ISpeechVoiceStatus.ahk" { ISpeechVoiceStatus }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SpeechVoiceSpeakFlags.ahk" { SpeechVoiceSpeakFlags }
#Import ".\ISpeechObjectTokens.ahk" { ISpeechObjectTokens }
#Import ".\SpeechVoiceEvents.ahk" { SpeechVoiceEvents }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISpeechObjectToken.ahk" { ISpeechObjectToken }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechVoice extends IDispatch {
    /**
     * The interface identifier for ISpeechVoice
     * @type {Guid}
     */
    static IID := Guid("{269316d8-57bd-11d2-9eee-00c04f797396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechVoice interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Status                                 : IntPtr
        get_Voice                                  : IntPtr
        putref_Voice                               : IntPtr
        get_AudioOutput                            : IntPtr
        putref_AudioOutput                         : IntPtr
        get_AudioOutputStream                      : IntPtr
        putref_AudioOutputStream                   : IntPtr
        get_Rate                                   : IntPtr
        put_Rate                                   : IntPtr
        get_Volume                                 : IntPtr
        put_Volume                                 : IntPtr
        put_AllowAudioOutputFormatChangesOnNextSet : IntPtr
        get_AllowAudioOutputFormatChangesOnNextSet : IntPtr
        get_EventInterests                         : IntPtr
        put_EventInterests                         : IntPtr
        put_Priority                               : IntPtr
        get_Priority                               : IntPtr
        put_AlertBoundary                          : IntPtr
        get_AlertBoundary                          : IntPtr
        put_SynchronousSpeakTimeout                : IntPtr
        get_SynchronousSpeakTimeout                : IntPtr
        Speak                                      : IntPtr
        SpeakStream                                : IntPtr
        Pause                                      : IntPtr
        Resume                                     : IntPtr
        Skip                                       : IntPtr
        GetVoices                                  : IntPtr
        GetAudioOutputs                            : IntPtr
        WaitUntilDone                              : IntPtr
        SpeakCompleteEvent                         : IntPtr
        IsUISupported                              : IntPtr
        DisplayUI                                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechVoice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechVoiceStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {ISpeechObjectToken} 
     */
    Voice {
        get => this.get_Voice()
    }

    /**
     * @type {ISpeechObjectToken} 
     */
    AudioOutput {
        get => this.get_AudioOutput()
    }

    /**
     * @type {ISpeechBaseStream} 
     */
    AudioOutputStream {
        get => this.get_AudioOutputStream()
    }

    /**
     * @type {Integer} 
     */
    Rate {
        get => this.get_Rate()
        set => this.put_Rate(value)
    }

    /**
     * @type {Integer} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowAudioOutputFormatChangesOnNextSet {
        get => this.get_AllowAudioOutputFormatChangesOnNextSet()
        set => this.put_AllowAudioOutputFormatChangesOnNextSet(value)
    }

    /**
     * @type {SpeechVoiceEvents} 
     */
    EventInterests {
        get => this.get_EventInterests()
        set => this.put_EventInterests(value)
    }

    /**
     * @type {SpeechVoicePriority} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {SpeechVoiceEvents} 
     */
    AlertBoundary {
        get => this.get_AlertBoundary()
        set => this.put_AlertBoundary(value)
    }

    /**
     * @type {Integer} 
     */
    SynchronousSpeakTimeout {
        get => this.get_SynchronousSpeakTimeout()
        set => this.put_SynchronousSpeakTimeout(value)
    }

    /**
     * 
     * @returns {ISpeechVoiceStatus} 
     */
    get_Status() {
        result := ComCall(7, this, "ptr*", &_Status := 0, "HRESULT")
        return ISpeechVoiceStatus(_Status)
    }

    /**
     * 
     * @returns {ISpeechObjectToken} 
     */
    get_Voice() {
        result := ComCall(8, this, "ptr*", &Voice := 0, "HRESULT")
        return ISpeechObjectToken(Voice)
    }

    /**
     * 
     * @param {ISpeechObjectToken} Voice 
     * @returns {HRESULT} 
     */
    putref_Voice(Voice) {
        result := ComCall(9, this, "ptr", Voice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechObjectToken} 
     */
    get_AudioOutput() {
        result := ComCall(10, this, "ptr*", &AudioOutput := 0, "HRESULT")
        return ISpeechObjectToken(AudioOutput)
    }

    /**
     * 
     * @param {ISpeechObjectToken} AudioOutput 
     * @returns {HRESULT} 
     */
    putref_AudioOutput(AudioOutput) {
        result := ComCall(11, this, "ptr", AudioOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechBaseStream} 
     */
    get_AudioOutputStream() {
        result := ComCall(12, this, "ptr*", &AudioOutputStream := 0, "HRESULT")
        return ISpeechBaseStream(AudioOutputStream)
    }

    /**
     * 
     * @param {ISpeechBaseStream} AudioOutputStream 
     * @returns {HRESULT} 
     */
    putref_AudioOutputStream(AudioOutputStream) {
        result := ComCall(13, this, "ptr", AudioOutputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rate() {
        result := ComCall(14, this, "int*", &Rate := 0, "HRESULT")
        return Rate
    }

    /**
     * 
     * @param {Integer} Rate 
     * @returns {HRESULT} 
     */
    put_Rate(Rate) {
        result := ComCall(15, this, "int", Rate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Volume() {
        result := ComCall(16, this, "int*", &Volume := 0, "HRESULT")
        return Volume
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(17, this, "int", Volume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowAudioOutputFormatChangesOnNextSet(Allow) {
        result := ComCall(18, this, VARIANT_BOOL, Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowAudioOutputFormatChangesOnNextSet() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &Allow := 0, "HRESULT")
        return Allow
    }

    /**
     * 
     * @returns {SpeechVoiceEvents} 
     */
    get_EventInterests() {
        result := ComCall(20, this, "int*", &EventInterestFlags := 0, "HRESULT")
        return EventInterestFlags
    }

    /**
     * 
     * @param {SpeechVoiceEvents} EventInterestFlags 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterestFlags) {
        result := ComCall(21, this, SpeechVoiceEvents, EventInterestFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SpeechVoicePriority} _Priority 
     * @returns {HRESULT} 
     */
    put_Priority(_Priority) {
        result := ComCall(22, this, SpeechVoicePriority, _Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechVoicePriority} 
     */
    get_Priority() {
        result := ComCall(23, this, "int*", &_Priority := 0, "HRESULT")
        return _Priority
    }

    /**
     * 
     * @param {SpeechVoiceEvents} Boundary 
     * @returns {HRESULT} 
     */
    put_AlertBoundary(Boundary) {
        result := ComCall(24, this, SpeechVoiceEvents, Boundary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechVoiceEvents} 
     */
    get_AlertBoundary() {
        result := ComCall(25, this, "int*", &Boundary := 0, "HRESULT")
        return Boundary
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    put_SynchronousSpeakTimeout(msTimeout) {
        result := ComCall(26, this, "int", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SynchronousSpeakTimeout() {
        result := ComCall(27, this, "int*", &msTimeout := 0, "HRESULT")
        return msTimeout
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {SpeechVoiceSpeakFlags} Flags 
     * @returns {Integer} 
     */
    Speak(Text, Flags) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        result := ComCall(28, this, BSTR, Text, SpeechVoiceSpeakFlags, Flags, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @param {ISpeechBaseStream} Stream 
     * @param {SpeechVoiceSpeakFlags} Flags 
     * @returns {Integer} 
     */
    SpeakStream(Stream, Flags) {
        result := ComCall(29, this, "ptr", Stream, SpeechVoiceSpeakFlags, Flags, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Type 
     * @param {Integer} NumItems 
     * @returns {Integer} 
     */
    Skip(Type, NumItems) {
        Type := Type is String ? BSTR.Alloc(Type).Value : Type

        result := ComCall(32, this, BSTR, Type, "int", NumItems, "int*", &NumSkipped := 0, "HRESULT")
        return NumSkipped
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetVoices(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(33, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetAudioOutputs(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(34, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {VARIANT_BOOL} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(35, this, "int", msTimeout, VARIANT_BOOL.Ptr, &Done := 0, "HRESULT")
        return Done
    }

    /**
     * 
     * @returns {Integer} 
     */
    SpeakCompleteEvent() {
        result := ComCall(36, this, "int*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(37, this, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {Integer} hWndParent 
     * @param {BSTR} Title 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {HRESULT} 
     */
    DisplayUI(hWndParent, Title, TypeOfUI, ExtraData) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(38, this, "int", hWndParent, BSTR, Title, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechVoice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Voice := CallbackCreate(GetMethod(implObj, "get_Voice"), flags, 2)
        this.vtbl.putref_Voice := CallbackCreate(GetMethod(implObj, "putref_Voice"), flags, 2)
        this.vtbl.get_AudioOutput := CallbackCreate(GetMethod(implObj, "get_AudioOutput"), flags, 2)
        this.vtbl.putref_AudioOutput := CallbackCreate(GetMethod(implObj, "putref_AudioOutput"), flags, 2)
        this.vtbl.get_AudioOutputStream := CallbackCreate(GetMethod(implObj, "get_AudioOutputStream"), flags, 2)
        this.vtbl.putref_AudioOutputStream := CallbackCreate(GetMethod(implObj, "putref_AudioOutputStream"), flags, 2)
        this.vtbl.get_Rate := CallbackCreate(GetMethod(implObj, "get_Rate"), flags, 2)
        this.vtbl.put_Rate := CallbackCreate(GetMethod(implObj, "put_Rate"), flags, 2)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 2)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 2)
        this.vtbl.put_AllowAudioOutputFormatChangesOnNextSet := CallbackCreate(GetMethod(implObj, "put_AllowAudioOutputFormatChangesOnNextSet"), flags, 2)
        this.vtbl.get_AllowAudioOutputFormatChangesOnNextSet := CallbackCreate(GetMethod(implObj, "get_AllowAudioOutputFormatChangesOnNextSet"), flags, 2)
        this.vtbl.get_EventInterests := CallbackCreate(GetMethod(implObj, "get_EventInterests"), flags, 2)
        this.vtbl.put_EventInterests := CallbackCreate(GetMethod(implObj, "put_EventInterests"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_AlertBoundary := CallbackCreate(GetMethod(implObj, "put_AlertBoundary"), flags, 2)
        this.vtbl.get_AlertBoundary := CallbackCreate(GetMethod(implObj, "get_AlertBoundary"), flags, 2)
        this.vtbl.put_SynchronousSpeakTimeout := CallbackCreate(GetMethod(implObj, "put_SynchronousSpeakTimeout"), flags, 2)
        this.vtbl.get_SynchronousSpeakTimeout := CallbackCreate(GetMethod(implObj, "get_SynchronousSpeakTimeout"), flags, 2)
        this.vtbl.Speak := CallbackCreate(GetMethod(implObj, "Speak"), flags, 4)
        this.vtbl.SpeakStream := CallbackCreate(GetMethod(implObj, "SpeakStream"), flags, 4)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 4)
        this.vtbl.GetVoices := CallbackCreate(GetMethod(implObj, "GetVoices"), flags, 4)
        this.vtbl.GetAudioOutputs := CallbackCreate(GetMethod(implObj, "GetAudioOutputs"), flags, 4)
        this.vtbl.WaitUntilDone := CallbackCreate(GetMethod(implObj, "WaitUntilDone"), flags, 3)
        this.vtbl.SpeakCompleteEvent := CallbackCreate(GetMethod(implObj, "SpeakCompleteEvent"), flags, 2)
        this.vtbl.IsUISupported := CallbackCreate(GetMethod(implObj, "IsUISupported"), flags, 4)
        this.vtbl.DisplayUI := CallbackCreate(GetMethod(implObj, "DisplayUI"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Voice)
        CallbackFree(this.vtbl.putref_Voice)
        CallbackFree(this.vtbl.get_AudioOutput)
        CallbackFree(this.vtbl.putref_AudioOutput)
        CallbackFree(this.vtbl.get_AudioOutputStream)
        CallbackFree(this.vtbl.putref_AudioOutputStream)
        CallbackFree(this.vtbl.get_Rate)
        CallbackFree(this.vtbl.put_Rate)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_Volume)
        CallbackFree(this.vtbl.put_AllowAudioOutputFormatChangesOnNextSet)
        CallbackFree(this.vtbl.get_AllowAudioOutputFormatChangesOnNextSet)
        CallbackFree(this.vtbl.get_EventInterests)
        CallbackFree(this.vtbl.put_EventInterests)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_AlertBoundary)
        CallbackFree(this.vtbl.get_AlertBoundary)
        CallbackFree(this.vtbl.put_SynchronousSpeakTimeout)
        CallbackFree(this.vtbl.get_SynchronousSpeakTimeout)
        CallbackFree(this.vtbl.Speak)
        CallbackFree(this.vtbl.SpeakStream)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.GetVoices)
        CallbackFree(this.vtbl.GetAudioOutputs)
        CallbackFree(this.vtbl.WaitUntilDone)
        CallbackFree(this.vtbl.SpeakCompleteEvent)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
    }
}
