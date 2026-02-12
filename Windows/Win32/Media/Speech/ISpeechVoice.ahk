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
        result := ComCall(7, this, "ptr*", &Status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechVoiceStatus(Status_)
    }

    /**
     * 
     * @returns {ISpeechObjectToken} 
     */
    get_Voice() {
        result := ComCall(8, this, "ptr*", &Voice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechObjectToken(Voice)
    }

    /**
     * 
     * @param {ISpeechObjectToken} Voice 
     * @returns {HRESULT} 
     */
    putref_Voice(Voice) {
        result := ComCall(9, this, "ptr", Voice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISpeechObjectToken} 
     */
    get_AudioOutput() {
        result := ComCall(10, this, "ptr*", &AudioOutput := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechObjectToken(AudioOutput)
    }

    /**
     * 
     * @param {ISpeechObjectToken} AudioOutput 
     * @returns {HRESULT} 
     */
    putref_AudioOutput(AudioOutput) {
        result := ComCall(11, this, "ptr", AudioOutput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISpeechBaseStream} 
     */
    get_AudioOutputStream() {
        result := ComCall(12, this, "ptr*", &AudioOutputStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechBaseStream(AudioOutputStream)
    }

    /**
     * 
     * @param {ISpeechBaseStream} AudioOutputStream 
     * @returns {HRESULT} 
     */
    putref_AudioOutputStream(AudioOutputStream) {
        result := ComCall(13, this, "ptr", AudioOutputStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rate() {
        result := ComCall(14, this, "int*", &Rate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Rate
    }

    /**
     * 
     * @param {Integer} Rate 
     * @returns {HRESULT} 
     */
    put_Rate(Rate) {
        result := ComCall(15, this, "int", Rate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Volume() {
        result := ComCall(16, this, "int*", &Volume := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Volume
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(17, this, "int", Volume, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowAudioOutputFormatChangesOnNextSet(Allow) {
        result := ComCall(18, this, "short", Allow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowAudioOutputFormatChangesOnNextSet() {
        result := ComCall(19, this, "short*", &Allow := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Allow
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventInterests() {
        result := ComCall(20, this, "int*", &EventInterestFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EventInterestFlags
    }

    /**
     * 
     * @param {Integer} EventInterestFlags 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterestFlags) {
        result := ComCall(21, this, "int", EventInterestFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Priority_ 
     * @returns {HRESULT} 
     */
    put_Priority(Priority_) {
        result := ComCall(22, this, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(23, this, "int*", &Priority_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Priority_
    }

    /**
     * 
     * @param {Integer} Boundary 
     * @returns {HRESULT} 
     */
    put_AlertBoundary(Boundary) {
        result := ComCall(24, this, "int", Boundary, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlertBoundary() {
        result := ComCall(25, this, "int*", &Boundary := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Boundary
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    put_SynchronousSpeakTimeout(msTimeout) {
        result := ComCall(26, this, "int", msTimeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SynchronousSpeakTimeout() {
        result := ComCall(27, this, "int*", &msTimeout := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return msTimeout
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    Speak(Text, Flags) {
        if(Text is String) {
            pin := BSTR.Alloc(Text)
            Text := pin.Value
        }

        result := ComCall(28, this, "ptr", Text, "int", Flags, "int*", &StreamNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamNumber
    }

    /**
     * 
     * @param {ISpeechBaseStream} Stream 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    SpeakStream(Stream, Flags) {
        result := ComCall(29, this, "ptr", Stream, "int", Flags, "int*", &StreamNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamNumber
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(30, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(31, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * SkipLine Method
     * @remarks
     * All characters up to and including the next line separator are skipped. By default, the [LineSeparator](./lineseparator-property-ado.md) is **adCRLF**. If you attempt to skip past [EOS](./eos-property.md), the current position will remain at **EOS**.  
     *   
     *  The **SkipLine** method is used with text streams ([Type](./type-property-ado-stream.md) is **adTypeText**).
     * @param {BSTR} Type 
     * @param {Integer} NumItems 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/skipline-method
     */
    Skip(Type, NumItems) {
        if(Type is String) {
            pin := BSTR.Alloc(Type)
            Type := pin.Value
        }

        result := ComCall(32, this, "ptr", Type, "int", NumItems, "int*", &NumSkipped := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NumSkipped
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetVoices(RequiredAttributes, OptionalAttributes) {
        if(RequiredAttributes is String) {
            pin := BSTR.Alloc(RequiredAttributes)
            RequiredAttributes := pin.Value
        }
        if(OptionalAttributes is String) {
            pin := BSTR.Alloc(OptionalAttributes)
            OptionalAttributes := pin.Value
        }

        result := ComCall(33, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetAudioOutputs(RequiredAttributes, OptionalAttributes) {
        if(RequiredAttributes is String) {
            pin := BSTR.Alloc(RequiredAttributes)
            RequiredAttributes := pin.Value
        }
        if(OptionalAttributes is String) {
            pin := BSTR.Alloc(OptionalAttributes)
            OptionalAttributes := pin.Value
        }

        result := ComCall(34, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {VARIANT_BOOL} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(35, this, "int", msTimeout, "short*", &Done := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Done
    }

    /**
     * 
     * @returns {Integer} 
     */
    SpeakCompleteEvent() {
        result := ComCall(36, this, "int*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData) {
        if(TypeOfUI is String) {
            pin := BSTR.Alloc(TypeOfUI)
            TypeOfUI := pin.Value
        }

        result := ComCall(37, this, "ptr", TypeOfUI, "ptr", ExtraData, "short*", &Supported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(Title is String) {
            pin := BSTR.Alloc(Title)
            Title := pin.Value
        }
        if(TypeOfUI is String) {
            pin := BSTR.Alloc(TypeOfUI)
            TypeOfUI := pin.Value
        }

        result := ComCall(38, this, "int", hWndParent, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
