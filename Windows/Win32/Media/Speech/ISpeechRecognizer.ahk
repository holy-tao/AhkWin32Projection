#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechObjectToken.ahk
#Include .\ISpeechBaseStream.ahk
#Include .\ISpeechRecognizerStatus.ahk
#Include .\ISpeechRecoContext.ahk
#Include .\ISpeechAudioFormat.ahk
#Include .\ISpeechObjectTokens.ahk
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
     * @returns {ISpeechObjectToken} 
     */
    get_Recognizer() {
        result := ComCall(8, this, "ptr*", &Recognizer := 0, "HRESULT")
        return ISpeechObjectToken(Recognizer)
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
     * @returns {VARIANT_BOOL} 
     */
    get_AllowAudioInputFormatChangesOnNextSet() {
        result := ComCall(10, this, "short*", &Allow := 0, "HRESULT")
        return Allow
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
     * @returns {ISpeechObjectToken} 
     */
    get_AudioInput() {
        result := ComCall(12, this, "ptr*", &AudioInput := 0, "HRESULT")
        return ISpeechObjectToken(AudioInput)
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
     * @returns {ISpeechBaseStream} 
     */
    get_AudioInputStream() {
        result := ComCall(14, this, "ptr*", &AudioInputStream := 0, "HRESULT")
        return ISpeechBaseStream(AudioInputStream)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsShared() {
        result := ComCall(15, this, "short*", &Shared := 0, "HRESULT")
        return Shared
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
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(17, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {ISpeechRecognizerStatus} 
     */
    get_Status() {
        result := ComCall(18, this, "ptr*", &Status := 0, "HRESULT")
        return ISpeechRecognizerStatus(Status)
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
     * @returns {ISpeechObjectToken} 
     */
    get_Profile() {
        result := ComCall(20, this, "ptr*", &Profile := 0, "HRESULT")
        return ISpeechObjectToken(Profile)
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
     * @returns {ISpeechRecoContext} 
     */
    CreateRecoContext() {
        result := ComCall(22, this, "ptr*", &NewContext := 0, "HRESULT")
        return ISpeechRecoContext(NewContext)
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {ISpeechAudioFormat} 
     */
    GetFormat(Type) {
        result := ComCall(23, this, "int", Type, "ptr*", &Format := 0, "HRESULT")
        return ISpeechAudioFormat(Format)
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} Value 
     * @returns {VARIANT_BOOL} 
     */
    SetPropertyNumber(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(24, this, "ptr", Name, "int", Value, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<Integer>} Value 
     * @returns {VARIANT_BOOL} 
     */
    GetPropertyNumber(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        ValueMarshal := Value is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "ptr", Name, ValueMarshal, Value, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {BSTR} Value 
     * @returns {VARIANT_BOOL} 
     */
    SetPropertyString(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(26, this, "ptr", Name, "ptr", Value, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<BSTR>} Value 
     * @returns {VARIANT_BOOL} 
     */
    GetPropertyString(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(27, this, "ptr", Name, "ptr", Value, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(28, this, "ptr", TypeOfUI, "ptr", ExtraData, "short*", &Supported := 0, "HRESULT")
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

        result := ComCall(29, this, "int", hWndParent, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetRecognizers(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(30, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetAudioInputs(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(31, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    GetProfiles(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(32, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }
}
