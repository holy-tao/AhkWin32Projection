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
        result := ComCall(7, this, "ptr", Id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * 
     * @returns {ISpeechRecoContext} 
     */
    get_RecoContext() {
        result := ComCall(8, this, "ptr*", &RecoContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechRecoContext(RecoContext)
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(9, this, "int", State, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(10, this, "int*", &State := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return State
    }

    /**
     * 
     * @returns {ISpeechGrammarRules} 
     */
    get_Rules() {
        result := ComCall(11, this, "ptr*", &Rules := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechGrammarRules(Rules)
    }

    /**
     * Reset Method (RDS)
     * @remarks
     * The [SortColumn](./sortcolumn-property-rds.md), [SortDirection](./sortdirection-property-rds.md), [FilterValue](./filtervalue-property-rds.md), [FilterCriterion](./filtercriterion-property-rds.md), and [FilterColumn](./filtercolumn-property-rds.md) properties provide sorting and filtering functionality on the client-side cache. The sorting functionality orders records by values from one column. The filtering functionality displays a subset of records based on a find criteria, while the full [Recordset](../ado-api/recordset-object-ado.md) is maintained in the cache. The **Reset** method will execute the criteria and replace the current **Recordset** with an updatable **Recordset**.  
     *   
     *  If there are changes to the original data that have not been submitted, the **Reset** method will fail. First, use the [SubmitChanges](./submitchanges-method-rds.md) method to save any changes in a read/write **Recordset**, and then use the **Reset** method to sort or filter the records.  
     *   
     *  If you want to perform more than one filter on your rowset, you can use the optional *Boolean* argument with the **Reset** method. The following example shows how to do this:  
     *   
     * ```  
     * ADC.SQL = "Select au_lname from authors"  
     * ADC.Refresh    ' Get the new rowset.  
     *   
     * ADC.FilterColumn = "au_lname"  
     * ADC.FilterCriterion = "<"  
     * ADC.FilterValue = "'M'"  
     * ADC.Reset         ' Rowset now has all Last Names < "M".  
     *   
     * ADC.FilterCriterion = ">"  
     * ADC.FilterValue = "'F'"  
     * ' Passing True is not necessary, because it is the   
     * ' default filter on the current "filtered" rowset.  
     * ADC.Reset(TRUE)     ' Rowset now has all Last   
     *                     ' Names < "M" and > "F".  
     *   
     * ADC.FilterCriterion = ">"  
     * ADC.FilterValue = "'T'"  
     * ' Filter on the original rowset, throwing out the  
     * ' previous filter options.  
     * ADC.Reset(FALSE)   ' Rowset now has all Last Names > "T".  
     * ```
     * @param {Integer} NewLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/reset-method-rds
     */
    Reset(NewLanguage) {
        result := ComCall(12, this, "int", NewLanguage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromFile(FileName, LoadOption) {
        if(FileName is String) {
            pin := BSTR.Alloc(FileName)
            FileName := pin.Value
        }

        result := ComCall(13, this, "ptr", FileName, "int", LoadOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(ClassId is String) {
            pin := BSTR.Alloc(ClassId)
            ClassId := pin.Value
        }
        if(GrammarName is String) {
            pin := BSTR.Alloc(GrammarName)
            GrammarName := pin.Value
        }

        result := ComCall(14, this, "ptr", ClassId, "ptr", GrammarName, "int", LoadOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} hModule_ 
     * @param {VARIANT} ResourceName 
     * @param {VARIANT} ResourceType_ 
     * @param {Integer} LanguageId 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    CmdLoadFromResource(hModule_, ResourceName, ResourceType_, LanguageId, LoadOption) {
        result := ComCall(15, this, "int", hModule_, "ptr", ResourceName, "ptr", ResourceType_, "int", LanguageId, "int", LoadOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(ProprietaryGuid is String) {
            pin := BSTR.Alloc(ProprietaryGuid)
            ProprietaryGuid := pin.Value
        }
        if(ProprietaryString is String) {
            pin := BSTR.Alloc(ProprietaryString)
            ProprietaryString := pin.Value
        }

        result := ComCall(17, this, "ptr", ProprietaryGuid, "ptr", ProprietaryString, "ptr", ProprietaryData, "int", LoadOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    CmdSetRuleState(Name, State) {
        if(Name is String) {
            pin := BSTR.Alloc(Name)
            Name := pin.Value
        }

        result := ComCall(18, this, "ptr", Name, "int", State, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} TopicName 
     * @param {Integer} LoadOption 
     * @returns {HRESULT} 
     */
    DictationLoad(TopicName, LoadOption) {
        if(TopicName is String) {
            pin := BSTR.Alloc(TopicName)
            TopicName := pin.Value
        }

        result := ComCall(20, this, "ptr", TopicName, "int", LoadOption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DictationUnload() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    DictationSetState(State) {
        result := ComCall(22, this, "int", State, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(Text is String) {
            pin := BSTR.Alloc(Text)
            Text := pin.Value
        }

        result := ComCall(23, this, "ptr", Text, "int", TextLength, "ptr", Info, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISpeechTextSelectionInformation} Info 
     * @returns {HRESULT} 
     */
    SetTextSelection(Info) {
        result := ComCall(24, this, "ptr", Info, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} Word 
     * @returns {Integer} 
     */
    IsPronounceable(Word) {
        if(Word is String) {
            pin := BSTR.Alloc(Word)
            Word := pin.Value
        }

        result := ComCall(25, this, "ptr", Word, "int*", &WordPronounceable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WordPronounceable
    }
}
