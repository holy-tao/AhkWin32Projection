#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechTextSelectionInformation.ahk" { ISpeechTextSelectionInformation }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\SpeechRuleState.ahk" { SpeechRuleState }
#Import ".\SpeechLoadOption.ahk" { SpeechLoadOption }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SpeechWordPronounceable.ahk" { SpeechWordPronounceable }
#Import ".\ISpeechGrammarRules.ahk" { ISpeechGrammarRules }
#Import ".\SpeechGrammarState.ahk" { SpeechGrammarState }
#Import ".\ISpeechRecoContext.ahk" { ISpeechRecoContext }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecoGrammar extends IDispatch {
    /**
     * The interface identifier for ISpeechRecoGrammar
     * @type {Guid}
     */
    static IID := Guid("{b6d6f79f-2158-4e50-b5bc-9a9ccd852a09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecoGrammar interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id                        : IntPtr
        get_RecoContext               : IntPtr
        put_State                     : IntPtr
        get_State                     : IntPtr
        get_Rules                     : IntPtr
        Reset                         : IntPtr
        CmdLoadFromFile               : IntPtr
        CmdLoadFromObject             : IntPtr
        CmdLoadFromResource           : IntPtr
        CmdLoadFromMemory             : IntPtr
        CmdLoadFromProprietaryGrammar : IntPtr
        CmdSetRuleState               : IntPtr
        CmdSetRuleIdState             : IntPtr
        DictationLoad                 : IntPtr
        DictationUnload               : IntPtr
        DictationSetState             : IntPtr
        SetWordSequenceData           : IntPtr
        SetTextSelection              : IntPtr
        IsPronounceable               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecoGrammar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {ISpeechRecoContext} 
     */
    RecoContext {
        get => this.get_RecoContext()
    }

    /**
     * @type {SpeechGrammarState} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {ISpeechGrammarRules} 
     */
    Rules {
        get => this.get_Rules()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Id() {
        Id := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * 
     * @returns {ISpeechRecoContext} 
     */
    get_RecoContext() {
        result := ComCall(8, this, "ptr*", &RecoContext := 0, "HRESULT")
        return ISpeechRecoContext(RecoContext)
    }

    /**
     * 
     * @param {SpeechGrammarState} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(9, this, SpeechGrammarState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SpeechGrammarState} 
     */
    get_State() {
        result := ComCall(10, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {ISpeechGrammarRules} 
     */
    get_Rules() {
        result := ComCall(11, this, "ptr*", &Rules := 0, "HRESULT")
        return ISpeechGrammarRules(Rules)
    }

    /**
     * 
     * @param {Integer} NewLanguage 
     * @returns {HRESULT} 
     */
    Reset(NewLanguage) {
        result := ComCall(12, this, "int", NewLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromFile(FileName, LoadOption) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(13, this, BSTR, FileName, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ClassId 
     * @param {BSTR} GrammarName 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromObject(ClassId, GrammarName, LoadOption) {
        ClassId := ClassId is String ? BSTR.Alloc(ClassId).Value : ClassId
        GrammarName := GrammarName is String ? BSTR.Alloc(GrammarName).Value : GrammarName

        result := ComCall(14, this, BSTR, ClassId, BSTR, GrammarName, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _hModule 
     * @param {VARIANT} ResourceName 
     * @param {VARIANT} _ResourceType 
     * @param {Integer} LanguageId 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromResource(_hModule, ResourceName, _ResourceType, LanguageId, LoadOption) {
        result := ComCall(15, this, "int", _hModule, VARIANT, ResourceName, VARIANT, _ResourceType, "int", LanguageId, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} GrammarData 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromMemory(GrammarData, LoadOption) {
        result := ComCall(16, this, VARIANT, GrammarData, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProprietaryGuid 
     * @param {BSTR} ProprietaryString 
     * @param {VARIANT} ProprietaryData 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromProprietaryGrammar(ProprietaryGuid, ProprietaryString, ProprietaryData, LoadOption) {
        ProprietaryGuid := ProprietaryGuid is String ? BSTR.Alloc(ProprietaryGuid).Value : ProprietaryGuid
        ProprietaryString := ProprietaryString is String ? BSTR.Alloc(ProprietaryString).Value : ProprietaryString

        result := ComCall(17, this, BSTR, ProprietaryGuid, BSTR, ProprietaryString, VARIANT, ProprietaryData, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {SpeechRuleState} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleState(Name, State) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(18, this, BSTR, Name, SpeechRuleState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RuleId 
     * @param {SpeechRuleState} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleIdState(RuleId, State) {
        result := ComCall(19, this, "int", RuleId, SpeechRuleState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TopicName 
     * @param {SpeechLoadOption} LoadOption 
     * @returns {HRESULT} 
     */
    DictationLoad(TopicName, LoadOption) {
        TopicName := TopicName is String ? BSTR.Alloc(TopicName).Value : TopicName

        result := ComCall(20, this, BSTR, TopicName, SpeechLoadOption, LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DictationUnload() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SpeechRuleState} State 
     * @returns {HRESULT} 
     */
    DictationSetState(State) {
        result := ComCall(22, this, SpeechRuleState, State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {Integer} TextLength 
     * @param {ISpeechTextSelectionInformation} Info 
     * @returns {HRESULT} 
     */
    SetWordSequenceData(Text, TextLength, Info) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        result := ComCall(23, this, BSTR, Text, "int", TextLength, "ptr", Info, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechTextSelectionInformation} Info 
     * @returns {HRESULT} 
     */
    SetTextSelection(Info) {
        result := ComCall(24, this, "ptr", Info, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Word 
     * @returns {SpeechWordPronounceable} 
     */
    IsPronounceable(Word) {
        Word := Word is String ? BSTR.Alloc(Word).Value : Word

        result := ComCall(25, this, BSTR, Word, "int*", &WordPronounceable := 0, "HRESULT")
        return WordPronounceable
    }

    Query(iid) {
        if (ISpeechRecoGrammar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_RecoContext := CallbackCreate(GetMethod(implObj, "get_RecoContext"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Rules := CallbackCreate(GetMethod(implObj, "get_Rules"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.CmdLoadFromFile := CallbackCreate(GetMethod(implObj, "CmdLoadFromFile"), flags, 3)
        this.vtbl.CmdLoadFromObject := CallbackCreate(GetMethod(implObj, "CmdLoadFromObject"), flags, 4)
        this.vtbl.CmdLoadFromResource := CallbackCreate(GetMethod(implObj, "CmdLoadFromResource"), flags, 6)
        this.vtbl.CmdLoadFromMemory := CallbackCreate(GetMethod(implObj, "CmdLoadFromMemory"), flags, 3)
        this.vtbl.CmdLoadFromProprietaryGrammar := CallbackCreate(GetMethod(implObj, "CmdLoadFromProprietaryGrammar"), flags, 5)
        this.vtbl.CmdSetRuleState := CallbackCreate(GetMethod(implObj, "CmdSetRuleState"), flags, 3)
        this.vtbl.CmdSetRuleIdState := CallbackCreate(GetMethod(implObj, "CmdSetRuleIdState"), flags, 3)
        this.vtbl.DictationLoad := CallbackCreate(GetMethod(implObj, "DictationLoad"), flags, 3)
        this.vtbl.DictationUnload := CallbackCreate(GetMethod(implObj, "DictationUnload"), flags, 1)
        this.vtbl.DictationSetState := CallbackCreate(GetMethod(implObj, "DictationSetState"), flags, 2)
        this.vtbl.SetWordSequenceData := CallbackCreate(GetMethod(implObj, "SetWordSequenceData"), flags, 4)
        this.vtbl.SetTextSelection := CallbackCreate(GetMethod(implObj, "SetTextSelection"), flags, 2)
        this.vtbl.IsPronounceable := CallbackCreate(GetMethod(implObj, "IsPronounceable"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_RecoContext)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Rules)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.CmdLoadFromFile)
        CallbackFree(this.vtbl.CmdLoadFromObject)
        CallbackFree(this.vtbl.CmdLoadFromResource)
        CallbackFree(this.vtbl.CmdLoadFromMemory)
        CallbackFree(this.vtbl.CmdLoadFromProprietaryGrammar)
        CallbackFree(this.vtbl.CmdSetRuleState)
        CallbackFree(this.vtbl.CmdSetRuleIdState)
        CallbackFree(this.vtbl.DictationLoad)
        CallbackFree(this.vtbl.DictationUnload)
        CallbackFree(this.vtbl.DictationSetState)
        CallbackFree(this.vtbl.SetWordSequenceData)
        CallbackFree(this.vtbl.SetTextSelection)
        CallbackFree(this.vtbl.IsPronounceable)
    }
}
