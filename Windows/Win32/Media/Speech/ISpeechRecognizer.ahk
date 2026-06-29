#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechAudioFormat.ahk" { ISpeechAudioFormat }
#Import ".\SpeechFormatType.ahk" { SpeechFormatType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISpeechObjectTokens.ahk" { ISpeechObjectTokens }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISpeechRecognizerStatus.ahk" { ISpeechRecognizerStatus }
#Import ".\ISpeechObjectToken.ahk" { ISpeechObjectToken }
#Import ".\SpeechRecognizerState.ahk" { SpeechRecognizerState }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import ".\ISpeechRecoContext.ahk" { ISpeechRecoContext }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecognizer extends IDispatch {
    /**
     * The interface identifier for ISpeechRecognizer
     * @type {Guid}
     */
    static IID := Guid("{2d5f1c0c-bd75-4b08-9478-3b11fea2586c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecognizer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_Recognizer                         : IntPtr
        get_Recognizer                            : IntPtr
        put_AllowAudioInputFormatChangesOnNextSet : IntPtr
        get_AllowAudioInputFormatChangesOnNextSet : IntPtr
        putref_AudioInput                         : IntPtr
        get_AudioInput                            : IntPtr
        putref_AudioInputStream                   : IntPtr
        get_AudioInputStream                      : IntPtr
        get_IsShared                              : IntPtr
        put_State                                 : IntPtr
        get_State                                 : IntPtr
        get_Status                                : IntPtr
        putref_Profile                            : IntPtr
        get_Profile                               : IntPtr
        EmulateRecognition                        : IntPtr
        CreateRecoContext                         : IntPtr
        GetFormat                                 : IntPtr
        SetPropertyNumber                         : IntPtr
        GetPropertyNumber                         : IntPtr
        SetPropertyString                         : IntPtr
        GetPropertyString                         : IntPtr
        IsUISupported                             : IntPtr
        DisplayUI                                 : IntPtr
        GetRecognizers                            : IntPtr
        GetAudioInputs                            : IntPtr
        GetProfiles                               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecognizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechObjectToken} 
     */
    Recognizer {
        get => this.get_Recognizer()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AllowAudioInputFormatChangesOnNextSet {
        get => this.get_AllowAudioInputFormatChangesOnNextSet()
        set => this.put_AllowAudioInputFormatChangesOnNextSet(value)
    }

    /**
     * @type {ISpeechObjectToken} 
     */
    AudioInput {
        get => this.get_AudioInput()
    }

    /**
     * @type {ISpeechBaseStream} 
     */
    AudioInputStream {
        get => this.get_AudioInputStream()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsShared {
        get => this.get_IsShared()
    }

    /**
     * @type {SpeechRecognizerState} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {ISpeechRecognizerStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {ISpeechObjectToken} 
     */
    Profile {
        get => this.get_Profile()
    }

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
        result := ComCall(9, this, VARIANT_BOOL, Allow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AllowAudioInputFormatChangesOnNextSet() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &Allow := 0, "HRESULT")
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
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &Shared := 0, "HRESULT")
        return Shared
    }

    /**
     * 
     * @param {SpeechRecognizerState} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(16, this, SpeechRecognizerState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechRecognizerState} 
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
        result := ComCall(18, this, "ptr*", &_Status := 0, "HRESULT")
        return ISpeechRecognizerStatus(_Status)
    }

    /**
     * 
     * @param {ISpeechObjectToken} _Profile 
     * @returns {HRESULT} 
     */
    putref_Profile(_Profile) {
        result := ComCall(19, this, "ptr", _Profile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechObjectToken} 
     */
    get_Profile() {
        result := ComCall(20, this, "ptr*", &_Profile := 0, "HRESULT")
        return ISpeechObjectToken(_Profile)
    }

    /**
     * 
     * @param {VARIANT} TextElements 
     * @param {Pointer<VARIANT>} ElementDisplayAttributes 
     * @param {Integer} LanguageId 
     * @returns {HRESULT} 
     */
    EmulateRecognition(TextElements, ElementDisplayAttributes, LanguageId) {
        result := ComCall(21, this, VARIANT, TextElements, VARIANT.Ptr, ElementDisplayAttributes, "int", LanguageId, "HRESULT")
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
     * @param {SpeechFormatType} Type 
     * @returns {ISpeechAudioFormat} 
     */
    GetFormat(Type) {
        result := ComCall(23, this, SpeechFormatType, Type, "ptr*", &Format := 0, "HRESULT")
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

        result := ComCall(24, this, BSTR, Name, "int", Value, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
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

        result := ComCall(25, this, BSTR, Name, ValueMarshal, Value, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
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

        result := ComCall(26, this, BSTR, Name, BSTR, Value, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
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

        result := ComCall(27, this, BSTR, Name, BSTR.Ptr, Value, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
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

        result := ComCall(28, this, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
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

        result := ComCall(29, this, "int", hWndParent, BSTR, Title, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, "HRESULT")
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

        result := ComCall(30, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
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

        result := ComCall(31, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
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

        result := ComCall(32, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &ObjectTokens := 0, "HRESULT")
        return ISpeechObjectTokens(ObjectTokens)
    }

    Query(iid) {
        if (ISpeechRecognizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_Recognizer := CallbackCreate(GetMethod(implObj, "putref_Recognizer"), flags, 2)
        this.vtbl.get_Recognizer := CallbackCreate(GetMethod(implObj, "get_Recognizer"), flags, 2)
        this.vtbl.put_AllowAudioInputFormatChangesOnNextSet := CallbackCreate(GetMethod(implObj, "put_AllowAudioInputFormatChangesOnNextSet"), flags, 2)
        this.vtbl.get_AllowAudioInputFormatChangesOnNextSet := CallbackCreate(GetMethod(implObj, "get_AllowAudioInputFormatChangesOnNextSet"), flags, 2)
        this.vtbl.putref_AudioInput := CallbackCreate(GetMethod(implObj, "putref_AudioInput"), flags, 2)
        this.vtbl.get_AudioInput := CallbackCreate(GetMethod(implObj, "get_AudioInput"), flags, 2)
        this.vtbl.putref_AudioInputStream := CallbackCreate(GetMethod(implObj, "putref_AudioInputStream"), flags, 2)
        this.vtbl.get_AudioInputStream := CallbackCreate(GetMethod(implObj, "get_AudioInputStream"), flags, 2)
        this.vtbl.get_IsShared := CallbackCreate(GetMethod(implObj, "get_IsShared"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.putref_Profile := CallbackCreate(GetMethod(implObj, "putref_Profile"), flags, 2)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.EmulateRecognition := CallbackCreate(GetMethod(implObj, "EmulateRecognition"), flags, 4)
        this.vtbl.CreateRecoContext := CallbackCreate(GetMethod(implObj, "CreateRecoContext"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
        this.vtbl.SetPropertyNumber := CallbackCreate(GetMethod(implObj, "SetPropertyNumber"), flags, 4)
        this.vtbl.GetPropertyNumber := CallbackCreate(GetMethod(implObj, "GetPropertyNumber"), flags, 4)
        this.vtbl.SetPropertyString := CallbackCreate(GetMethod(implObj, "SetPropertyString"), flags, 4)
        this.vtbl.GetPropertyString := CallbackCreate(GetMethod(implObj, "GetPropertyString"), flags, 4)
        this.vtbl.IsUISupported := CallbackCreate(GetMethod(implObj, "IsUISupported"), flags, 4)
        this.vtbl.DisplayUI := CallbackCreate(GetMethod(implObj, "DisplayUI"), flags, 5)
        this.vtbl.GetRecognizers := CallbackCreate(GetMethod(implObj, "GetRecognizers"), flags, 4)
        this.vtbl.GetAudioInputs := CallbackCreate(GetMethod(implObj, "GetAudioInputs"), flags, 4)
        this.vtbl.GetProfiles := CallbackCreate(GetMethod(implObj, "GetProfiles"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_Recognizer)
        CallbackFree(this.vtbl.get_Recognizer)
        CallbackFree(this.vtbl.put_AllowAudioInputFormatChangesOnNextSet)
        CallbackFree(this.vtbl.get_AllowAudioInputFormatChangesOnNextSet)
        CallbackFree(this.vtbl.putref_AudioInput)
        CallbackFree(this.vtbl.get_AudioInput)
        CallbackFree(this.vtbl.putref_AudioInputStream)
        CallbackFree(this.vtbl.get_AudioInputStream)
        CallbackFree(this.vtbl.get_IsShared)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.putref_Profile)
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.EmulateRecognition)
        CallbackFree(this.vtbl.CreateRecoContext)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.SetPropertyNumber)
        CallbackFree(this.vtbl.GetPropertyNumber)
        CallbackFree(this.vtbl.SetPropertyString)
        CallbackFree(this.vtbl.GetPropertyString)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
        CallbackFree(this.vtbl.GetRecognizers)
        CallbackFree(this.vtbl.GetAudioInputs)
        CallbackFree(this.vtbl.GetProfiles)
    }
}
