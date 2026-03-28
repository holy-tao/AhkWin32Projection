#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechVoiceStatus.ahk
#Include .\ISpeechObjectToken.ahk
#Include .\ISpeechBaseStream.ahk
#Include .\ISpeechObjectTokens.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechVoice extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechVoice
     * @type {Guid}
     */
    static IID => Guid("{269316d8-57bd-11d2-9eee-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Voice", "putref_Voice", "get_AudioOutput", "putref_AudioOutput", "get_AudioOutputStream", "putref_AudioOutputStream", "get_Rate", "put_Rate", "get_Volume", "put_Volume", "put_AllowAudioOutputFormatChangesOnNextSet", "get_AllowAudioOutputFormatChangesOnNextSet", "get_EventInterests", "put_EventInterests", "put_Priority", "get_Priority", "put_AlertBoundary", "get_AlertBoundary", "put_SynchronousSpeakTimeout", "get_SynchronousSpeakTimeout", "Speak", "SpeakStream", "Pause", "Resume", "Skip", "GetVoices", "GetAudioOutputs", "WaitUntilDone", "SpeakCompleteEvent", "IsUISupported", "DisplayUI"]

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
     * @type {Integer} 
     */
    EventInterests {
        get => this.get_EventInterests()
        set => this.put_EventInterests(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {Integer} 
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
        result := ComCall(18, this, "short", Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowAudioOutputFormatChangesOnNextSet() {
        result := ComCall(19, this, "short*", &Allow := 0, "HRESULT")
        return Allow
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventInterests() {
        result := ComCall(20, this, "int*", &EventInterestFlags := 0, "HRESULT")
        return EventInterestFlags
    }

    /**
     * 
     * @param {Integer} EventInterestFlags 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterestFlags) {
        result := ComCall(21, this, "int", EventInterestFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Priority 
     * @returns {HRESULT} 
     */
    put_Priority(_Priority) {
        result := ComCall(22, this, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(23, this, "int*", &_Priority := 0, "HRESULT")
        return _Priority
    }

    /**
     * 
     * @param {Integer} Boundary 
     * @returns {HRESULT} 
     */
    put_AlertBoundary(Boundary) {
        result := ComCall(24, this, "int", Boundary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    Speak(Text, Flags) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        result := ComCall(28, this, "ptr", Text, "int", Flags, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @param {ISpeechBaseStream} Stream 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    SpeakStream(Stream, Flags) {
        result := ComCall(29, this, "ptr", Stream, "int", Flags, "int*", &StreamNumber := 0, "HRESULT")
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
     * Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * The <b>SkipPointerFrameMessages</b> function can be used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function (or one of its type-specific variants) to consume entire frames as a single input.
     * 
     * When an application sees a pointer message, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function to retrieve the entire pointer input frame to which the pointer message belongs, hence obtaining an updated view of all of the pointers currently owned by the window. Note that the returned frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * Having retrieved the entire frame of information, the application can then call the <b>SkipPointerFrameMessages</b> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one.
     * 
     * <div class="alert"><b>Warning</b>  The <b>SkipPointerFrameMessages</b> function should be used only when the caller can be sure that no other entity on the caller’s thread (such as  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>) is expecting to retrieve pending pointer messages. For this reason, <b>SkipPointerFrameMessages</b> should not be used in conjunction with Direct Manipulation when processing multiple, simultaneous interactions.</div>
     * <div> </div>
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds with no action.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {BSTR} Type 
     * @param {Integer} NumItems 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-skippointerframemessages
     */
    Skip(Type, NumItems) {
        Type := Type is String ? BSTR.Alloc(Type).Value : Type

        result := ComCall(32, this, "ptr", Type, "int", NumItems, "int*", &NumSkipped := 0, "HRESULT")
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

        result := ComCall(33, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
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

        result := ComCall(34, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {VARIANT_BOOL} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(35, this, "int", msTimeout, "short*", &Done := 0, "HRESULT")
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

        result := ComCall(37, this, "ptr", TypeOfUI, "ptr", ExtraData, "short*", &Supported := 0, "HRESULT")
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

        result := ComCall(38, this, "int", hWndParent, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "HRESULT")
        return result
    }
}
