#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecognizer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizer
     * @type {Guid}
     */
    static IID => Guid("{2d5f1c0c-bd75-4b08-9478-3b11fea2586c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_Recognizer", "get_Recognizer", "put_AllowAudioInputFormatChangesOnNextSet", "get_AllowAudioInputFormatChangesOnNextSet", "putref_AudioInput", "get_AudioInput", "putref_AudioInputStream", "get_AudioInputStream", "get_IsShared", "put_State", "get_State", "get_Status", "putref_Profile", "get_Profile", "EmulateRecognition", "CreateRecoContext", "GetFormat", "SetPropertyNumber", "GetPropertyNumber", "SetPropertyString", "GetPropertyString", "IsUISupported", "DisplayUI", "GetRecognizers", "GetAudioInputs", "GetProfiles"]

    /**
     * 
     * @param {ISpeechObjectToken} Recognizer 
     * @returns {HRESULT} 
     */
    putref_Recognizer(Recognizer) {
        result := ComCall(7, this, "ptr", Recognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} Recognizer 
     * @returns {HRESULT} 
     */
    get_Recognizer(Recognizer) {
        result := ComCall(8, this, "ptr*", Recognizer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Allow 
     * @returns {HRESULT} 
     */
    put_AllowAudioInputFormatChangesOnNextSet(Allow) {
        result := ComCall(9, this, "short", Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Allow 
     * @returns {HRESULT} 
     */
    get_AllowAudioInputFormatChangesOnNextSet(Allow) {
        result := ComCall(10, this, "ptr", Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechObjectToken} AudioInput 
     * @returns {HRESULT} 
     */
    putref_AudioInput(AudioInput) {
        result := ComCall(11, this, "ptr", AudioInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} AudioInput 
     * @returns {HRESULT} 
     */
    get_AudioInput(AudioInput) {
        result := ComCall(12, this, "ptr*", AudioInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechBaseStream} AudioInputStream 
     * @returns {HRESULT} 
     */
    putref_AudioInputStream(AudioInputStream) {
        result := ComCall(13, this, "ptr", AudioInputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechBaseStream>} AudioInputStream 
     * @returns {HRESULT} 
     */
    get_AudioInputStream(AudioInputStream) {
        result := ComCall(14, this, "ptr*", AudioInputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Shared 
     * @returns {HRESULT} 
     */
    get_IsShared(Shared) {
        result := ComCall(15, this, "ptr", Shared, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(16, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        result := ComCall(17, this, "int*", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecognizerStatus>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(18, this, "ptr*", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechObjectToken} Profile 
     * @returns {HRESULT} 
     */
    putref_Profile(Profile) {
        result := ComCall(19, this, "ptr", Profile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectToken>} Profile 
     * @returns {HRESULT} 
     */
    get_Profile(Profile) {
        result := ComCall(20, this, "ptr*", Profile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} TextElements 
     * @param {Pointer<VARIANT>} ElementDisplayAttributes 
     * @param {Integer} LanguageId 
     * @returns {HRESULT} 
     */
    EmulateRecognition(TextElements, ElementDisplayAttributes, LanguageId) {
        result := ComCall(21, this, "ptr", TextElements, "ptr", ElementDisplayAttributes, "int", LanguageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecoContext>} NewContext 
     * @returns {HRESULT} 
     */
    CreateRecoContext(NewContext) {
        result := ComCall(22, this, "ptr*", NewContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    GetFormat(Type, Format) {
        result := ComCall(23, this, "int", Type, "ptr*", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} Value 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    SetPropertyNumber(Name, Value, Supported) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(24, this, "ptr", Name, "int", Value, "ptr", Supported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<Integer>} Value 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    GetPropertyNumber(Name, Value, Supported) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(25, this, "ptr", Name, "int*", Value, "ptr", Supported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {BSTR} Value 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    SetPropertyString(Name, Value, Supported) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(26, this, "ptr", Name, "ptr", Value, "ptr", Supported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<BSTR>} Value 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    GetPropertyString(Name, Value, Supported) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(27, this, "ptr", Name, "ptr", Value, "ptr", Supported, "HRESULT")
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

        result := ComCall(28, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Supported, "HRESULT")
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

        result := ComCall(29, this, "int", hWndParent, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} ObjectTokens 
     * @returns {HRESULT} 
     */
    GetRecognizers(RequiredAttributes, OptionalAttributes, ObjectTokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(30, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", ObjectTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} ObjectTokens 
     * @returns {HRESULT} 
     */
    GetAudioInputs(RequiredAttributes, OptionalAttributes, ObjectTokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(31, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", ObjectTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} ObjectTokens 
     * @returns {HRESULT} 
     */
    GetProfiles(RequiredAttributes, OptionalAttributes, ObjectTokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(32, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", ObjectTokens, "HRESULT")
        return result
    }
}
