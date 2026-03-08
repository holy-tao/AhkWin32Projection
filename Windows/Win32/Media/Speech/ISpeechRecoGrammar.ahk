#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISpeechRecoContext.ahk
#Include .\ISpeechGrammarRules.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoGrammar extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecoGrammar
     * @type {Guid}
     */
    static IID => Guid("{b6d6f79f-2158-4e50-b5bc-9a9ccd852a09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_RecoContext", "put_State", "get_State", "get_Rules", "Reset", "CmdLoadFromFile", "CmdLoadFromObject", "CmdLoadFromResource", "CmdLoadFromMemory", "CmdLoadFromProprietaryGrammar", "CmdSetRuleState", "CmdSetRuleIdState", "DictationLoad", "DictationUnload", "DictationSetState", "SetWordSequenceData", "SetTextSelection", "IsPronounceable"]

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
     * @type {Integer} 
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
        result := ComCall(7, this, "ptr", Id, "HRESULT")
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
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(9, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} NewLanguage 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned. The following table lists some of the common return values.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                            | Description                                                                                                                                                                                                                                                               |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                            | The method was successful.<br/>                                                                                                                                                                                                                                     |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl> | The provided owner authorization value is incorrect. Additional attempts at resetting the lock will fail with this same error. Please wait until the time-out period or other manufacturer-specific mechanism has expired before retrying locked TPM commands.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/resetauthlockout-win32-tpm
     */
    Reset(NewLanguage) {
        result := ComCall(12, this, "int", NewLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromFile(FileName, LoadOption) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(13, this, "ptr", FileName, "int", LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ClassId 
     * @param {BSTR} GrammarName 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromObject(ClassId, GrammarName, LoadOption) {
        ClassId := ClassId is String ? BSTR.Alloc(ClassId).Value : ClassId
        GrammarName := GrammarName is String ? BSTR.Alloc(GrammarName).Value : GrammarName

        result := ComCall(14, this, "ptr", ClassId, "ptr", GrammarName, "int", LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hModule 
     * @param {VARIANT} ResourceName 
     * @param {VARIANT} ResourceType 
     * @param {Integer} LanguageId 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromResource(hModule, ResourceName, ResourceType, LanguageId, LoadOption) {
        result := ComCall(15, this, "int", hModule, "ptr", ResourceName, "ptr", ResourceType, "int", LanguageId, "int", LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} GrammarData 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromMemory(GrammarData, LoadOption) {
        result := ComCall(16, this, "ptr", GrammarData, "int", LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProprietaryGuid 
     * @param {BSTR} ProprietaryString 
     * @param {VARIANT} ProprietaryData 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromProprietaryGrammar(ProprietaryGuid, ProprietaryString, ProprietaryData, LoadOption) {
        ProprietaryGuid := ProprietaryGuid is String ? BSTR.Alloc(ProprietaryGuid).Value : ProprietaryGuid
        ProprietaryString := ProprietaryString is String ? BSTR.Alloc(ProprietaryString).Value : ProprietaryString

        result := ComCall(17, this, "ptr", ProprietaryGuid, "ptr", ProprietaryString, "ptr", ProprietaryData, "int", LoadOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleState(Name, State) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(18, this, "ptr", Name, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RuleId 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleIdState(RuleId, State) {
        result := ComCall(19, this, "int", RuleId, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TopicName 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    DictationLoad(TopicName, LoadOption) {
        TopicName := TopicName is String ? BSTR.Alloc(TopicName).Value : TopicName

        result := ComCall(20, this, "ptr", TopicName, "int", LoadOption, "HRESULT")
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
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    DictationSetState(State) {
        result := ComCall(22, this, "int", State, "HRESULT")
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

        result := ComCall(23, this, "ptr", Text, "int", TextLength, "ptr", Info, "HRESULT")
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
     * @returns {Integer} 
     */
    IsPronounceable(Word) {
        Word := Word is String ? BSTR.Alloc(Word).Value : Word

        result := ComCall(25, this, "ptr", Word, "int*", &WordPronounceable := 0, "HRESULT")
        return WordPronounceable
    }
}
