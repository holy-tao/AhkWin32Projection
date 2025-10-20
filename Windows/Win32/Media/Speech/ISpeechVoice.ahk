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
     * 
     * @param {Pointer<ISpeechVoiceStatus>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(7, this, "ptr", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} Voice 
     * @returns {HRESULT} 
     */
    get_Voice(Voice) {
        result := ComCall(8, this, "ptr", Voice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} Voice 
     * @returns {HRESULT} 
     */
    putref_Voice(Voice) {
        result := ComCall(9, this, "ptr", Voice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} AudioOutput 
     * @returns {HRESULT} 
     */
    get_AudioOutput(AudioOutput) {
        result := ComCall(10, this, "ptr", AudioOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} AudioOutput 
     * @returns {HRESULT} 
     */
    putref_AudioOutput(AudioOutput) {
        result := ComCall(11, this, "ptr", AudioOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechBaseStream>} AudioOutputStream 
     * @returns {HRESULT} 
     */
    get_AudioOutputStream(AudioOutputStream) {
        result := ComCall(12, this, "ptr", AudioOutputStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechBaseStream>} AudioOutputStream 
     * @returns {HRESULT} 
     */
    putref_AudioOutputStream(AudioOutputStream) {
        result := ComCall(13, this, "ptr", AudioOutputStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Rate 
     * @returns {HRESULT} 
     */
    get_Rate(Rate) {
        result := ComCall(14, this, "int*", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Rate 
     * @returns {HRESULT} 
     */
    put_Rate(Rate) {
        result := ComCall(15, this, "int", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Volume 
     * @returns {HRESULT} 
     */
    get_Volume(Volume) {
        result := ComCall(16, this, "int*", Volume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(17, this, "int", Volume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowAudioOutputFormatChangesOnNextSet(Allow) {
        result := ComCall(18, this, "short", Allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Allow 
     * @returns {HRESULT} 
     */
    get_AllowAudioOutputFormatChangesOnNextSet(Allow) {
        result := ComCall(19, this, "ptr", Allow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EventInterestFlags 
     * @returns {HRESULT} 
     */
    get_EventInterests(EventInterestFlags) {
        result := ComCall(20, this, "int*", EventInterestFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventInterestFlags 
     * @returns {HRESULT} 
     */
    put_EventInterests(EventInterestFlags) {
        result := ComCall(21, this, "int", EventInterestFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    put_Priority(Priority) {
        result := ComCall(22, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Priority 
     * @returns {HRESULT} 
     */
    get_Priority(Priority) {
        result := ComCall(23, this, "int*", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Boundary 
     * @returns {HRESULT} 
     */
    put_AlertBoundary(Boundary) {
        result := ComCall(24, this, "int", Boundary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Boundary 
     * @returns {HRESULT} 
     */
    get_AlertBoundary(Boundary) {
        result := ComCall(25, this, "int*", Boundary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    put_SynchronousSpeakTimeout(msTimeout) {
        result := ComCall(26, this, "int", msTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} msTimeout 
     * @returns {HRESULT} 
     */
    get_SynchronousSpeakTimeout(msTimeout) {
        result := ComCall(27, this, "int*", msTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    Speak(Text, Flags, StreamNumber) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        result := ComCall(28, this, "ptr", Text, "int", Flags, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechBaseStream>} Stream 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    SpeakStream(Stream, Flags, StreamNumber) {
        result := ComCall(29, this, "ptr", Stream, "int", Flags, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Type 
     * @param {Integer} NumItems 
     * @param {Pointer<Int32>} NumSkipped 
     * @returns {HRESULT} 
     */
    Skip(Type, NumItems, NumSkipped) {
        Type := Type is String ? BSTR.Alloc(Type).Value : Type

        result := ComCall(32, this, "ptr", Type, "int", NumItems, "int*", NumSkipped, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(33, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr", ObjectTokens, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(34, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr", ObjectTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @param {Pointer<VARIANT_BOOL>} Done 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout, Done) {
        result := ComCall(35, this, "int", msTimeout, "ptr", Done, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Handle 
     * @returns {HRESULT} 
     */
    SpeakCompleteEvent(Handle) {
        result := ComCall(36, this, "int*", Handle, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(37, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Supported, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(38, this, "int", hWndParent, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
