#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoGrammar extends IDispatch{
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
     * 
     * @param {Pointer<VARIANT>} Id 
     * @returns {HRESULT} 
     */
    get_Id(Id) {
        result := ComCall(7, this, "ptr", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecoContext>} RecoContext 
     * @returns {HRESULT} 
     */
    get_RecoContext(RecoContext) {
        result := ComCall(8, this, "ptr", RecoContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(9, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        result := ComCall(10, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechGrammarRules>} Rules 
     * @returns {HRESULT} 
     */
    get_Rules(Rules) {
        result := ComCall(11, this, "ptr", Rules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewLanguage 
     * @returns {HRESULT} 
     */
    Reset(NewLanguage) {
        result := ComCall(12, this, "int", NewLanguage, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(13, this, "ptr", FileName, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(14, this, "ptr", ClassId, "ptr", GrammarName, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(15, this, "int", hModule, "ptr", ResourceName, "ptr", ResourceType, "int", LanguageId, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} GrammarData 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromMemory(GrammarData, LoadOption) {
        result := ComCall(16, this, "ptr", GrammarData, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(17, this, "ptr", ProprietaryGuid, "ptr", ProprietaryString, "ptr", ProprietaryData, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(18, this, "ptr", Name, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RuleId 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleIdState(RuleId, State) {
        result := ComCall(19, this, "int", RuleId, "int", State, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(20, this, "ptr", TopicName, "int", LoadOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DictationUnload() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    DictationSetState(State) {
        result := ComCall(22, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Text 
     * @param {Integer} TextLength 
     * @param {Pointer<ISpeechTextSelectionInformation>} Info 
     * @returns {HRESULT} 
     */
    SetWordSequenceData(Text, TextLength, Info) {
        Text := Text is String ? BSTR.Alloc(Text).Value : Text

        result := ComCall(23, this, "ptr", Text, "int", TextLength, "ptr", Info, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechTextSelectionInformation>} Info 
     * @returns {HRESULT} 
     */
    SetTextSelection(Info) {
        result := ComCall(24, this, "ptr", Info, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Word 
     * @param {Pointer<Int32>} WordPronounceable 
     * @returns {HRESULT} 
     */
    IsPronounceable(Word, WordPronounceable) {
        Word := Word is String ? BSTR.Alloc(Word).Value : Word

        result := ComCall(25, this, "ptr", Word, "int*", WordPronounceable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
