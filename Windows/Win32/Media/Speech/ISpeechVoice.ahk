#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<ISpeechVoiceStatus>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(7, this, "ptr*", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} Voice 
     * @returns {HRESULT} 
     */
    get_Voice(Voice) {
        result := ComCall(8, this, "ptr*", Voice, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechObjectToken>} AudioOutput 
     * @returns {HRESULT} 
     */
    get_AudioOutput(AudioOutput) {
        result := ComCall(10, this, "ptr*", AudioOutput, "HRESULT")
        return result
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
     * @param {Pointer<ISpeechBaseStream>} AudioOutputStream 
     * @returns {HRESULT} 
     */
    get_AudioOutputStream(AudioOutputStream) {
        result := ComCall(12, this, "ptr*", AudioOutputStream, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Rate 
     * @returns {HRESULT} 
     */
    get_Rate(Rate) {
        RateMarshal := Rate is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, RateMarshal, Rate, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Volume 
     * @returns {HRESULT} 
     */
    get_Volume(Volume) {
        VolumeMarshal := Volume is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, VolumeMarshal, Volume, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Allow 
     * @returns {HRESULT} 
     */
    get_AllowAudioOutputFormatChangesOnNextSet(Allow) {
        result := ComCall(19, this, "ptr", Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} EventInterestFlags 
     * @returns {HRESULT} 
     */
    get_EventInterests(EventInterestFlags) {
        EventInterestFlagsMarshal := EventInterestFlags is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, EventInterestFlagsMarshal, EventInterestFlags, "HRESULT")
        return result
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
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    put_Priority(Priority) {
        result := ComCall(22, this, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Priority 
     * @returns {HRESULT} 
     */
    get_Priority(Priority) {
        PriorityMarshal := Priority is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, PriorityMarshal, Priority, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Boundary 
     * @returns {HRESULT} 
     */
    get_AlertBoundary(Boundary) {
        BoundaryMarshal := Boundary is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, BoundaryMarshal, Boundary, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} msTimeout 
     * @returns {HRESULT} 
     */
    get_SynchronousSpeakTimeout(msTimeout) {
        msTimeoutMarshal := msTimeout is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, msTimeoutMarshal, msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    Speak(Text, Flags, StreamNumber) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        StreamNumberMarshal := StreamNumber is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, "ptr", Text, "int", Flags, StreamNumberMarshal, StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechBaseStream} Stream 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    SpeakStream(Stream, Flags, StreamNumber) {
        StreamNumberMarshal := StreamNumber is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, "ptr", Stream, "int", Flags, StreamNumberMarshal, StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Type 
     * @param {Integer} NumItems 
     * @param {Pointer<Integer>} NumSkipped 
     * @returns {HRESULT} 
     */
    Skip(Type, NumItems, NumSkipped) {
        Type := Type is String ? BSTR.Alloc(Type).Value : Type

        NumSkippedMarshal := NumSkipped is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, "ptr", Type, "int", NumItems, NumSkippedMarshal, NumSkipped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} ObjectTokens 
     * @returns {HRESULT} 
     */
    GetVoices(RequiredAttributes, OptionalAttributes, ObjectTokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(33, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", ObjectTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} ObjectTokens 
     * @returns {HRESULT} 
     */
    GetAudioOutputs(RequiredAttributes, OptionalAttributes, ObjectTokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(34, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", ObjectTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @param {Pointer<VARIANT_BOOL>} Done 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout, Done) {
        result := ComCall(35, this, "int", msTimeout, "ptr", Done, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    SpeakCompleteEvent(Handle) {
        HandleMarshal := Handle is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, HandleMarshal, Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    IsUISupported(TypeOfUI, ExtraData, Supported) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(37, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Supported, "HRESULT")
        return result
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
