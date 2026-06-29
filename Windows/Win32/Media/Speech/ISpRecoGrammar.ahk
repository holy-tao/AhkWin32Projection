#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPBINARYGRAMMAR.ahk" { SPBINARYGRAMMAR }
#Import ".\SPLOADOPTIONS.ahk" { SPLOADOPTIONS }
#Import ".\SPRULESTATE.ahk" { SPRULESTATE }
#Import ".\SPTEXTSELECTIONINFO.ahk" { SPTEXTSELECTIONINFO }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\SPWORDPRONOUNCEABLE.ahk" { SPWORDPRONOUNCEABLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpGrammarBuilder.ahk" { ISpGrammarBuilder }
#Import ".\ISpRecoContext.ahk" { ISpRecoContext }
#Import ".\SPGRAMMARSTATE.ahk" { SPGRAMMARSTATE }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoGrammar extends ISpGrammarBuilder {
    /**
     * The interface identifier for ISpRecoGrammar
     * @type {Guid}
     */
    static IID := Guid("{2177db29-7f45-47d0-8554-067e91c80502}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoGrammar interfaces
    */
    struct Vtbl extends ISpGrammarBuilder.Vtbl {
        GetGrammarId                  : IntPtr
        GetRecoContext                : IntPtr
        LoadCmdFromFile               : IntPtr
        LoadCmdFromObject             : IntPtr
        LoadCmdFromResource           : IntPtr
        LoadCmdFromMemory             : IntPtr
        LoadCmdFromProprietaryGrammar : IntPtr
        SetRuleState                  : IntPtr
        SetRuleIdState                : IntPtr
        LoadDictation                 : IntPtr
        UnloadDictation               : IntPtr
        SetDictationState             : IntPtr
        SetWordSequenceData           : IntPtr
        SetTextSelection              : IntPtr
        IsPronounceable               : IntPtr
        SetGrammarState               : IntPtr
        SaveCmd                       : IntPtr
        GetGrammarState               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoGrammar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pullGrammarId 
     * @returns {HRESULT} 
     */
    GetGrammarId(pullGrammarId) {
        pullGrammarIdMarshal := pullGrammarId is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pullGrammarIdMarshal, pullGrammarId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpRecoContext} 
     */
    GetRecoContext() {
        result := ComCall(12, this, "ptr*", &ppRecoCtxt := 0, "HRESULT")
        return ISpRecoContext(ppRecoCtxt)
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromFile(pszFileName, Options) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(13, this, "ptr", pszFileName, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rcid 
     * @param {PWSTR} pszGrammarName 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromObject(rcid, pszGrammarName, Options) {
        pszGrammarName := pszGrammarName is String ? StrPtr(pszGrammarName) : pszGrammarName

        result := ComCall(14, this, Guid.Ptr, rcid, "ptr", pszGrammarName, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMODULE} _hModule 
     * @param {PWSTR} pszResourceName 
     * @param {PWSTR} pszResourceType 
     * @param {Integer} wLanguage 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromResource(_hModule, pszResourceName, pszResourceType, wLanguage, Options) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName
        pszResourceType := pszResourceType is String ? StrPtr(pszResourceType) : pszResourceType

        result := ComCall(15, this, HMODULE, _hModule, "ptr", pszResourceName, "ptr", pszResourceType, "ushort", wLanguage, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pGrammar 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromMemory(pGrammar, Options) {
        result := ComCall(16, this, SPBINARYGRAMMAR.Ptr, pGrammar, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidParam 
     * @param {PWSTR} pszStringParam 
     * @param {Pointer<Void>} pvDataPrarm 
     * @param {Integer} cbDataSize 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromProprietaryGrammar(rguidParam, pszStringParam, pvDataPrarm, cbDataSize, Options) {
        pszStringParam := pszStringParam is String ? StrPtr(pszStringParam) : pszStringParam

        pvDataPrarmMarshal := pvDataPrarm is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, Guid.Ptr, rguidParam, "ptr", pszStringParam, pvDataPrarmMarshal, pvDataPrarm, "uint", cbDataSize, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Void>} pReserved 
     * @param {SPRULESTATE} NewState 
     * @returns {HRESULT} 
     */
    SetRuleState(pszName, pReserved, NewState) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, "ptr", pszName, pReservedMarshal, pReserved, SPRULESTATE, NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRuleId 
     * @param {SPRULESTATE} NewState 
     * @returns {HRESULT} 
     */
    SetRuleIdState(ulRuleId, NewState) {
        result := ComCall(19, this, "uint", ulRuleId, SPRULESTATE, NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTopicName 
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadDictation(pszTopicName, Options) {
        pszTopicName := pszTopicName is String ? StrPtr(pszTopicName) : pszTopicName

        result := ComCall(20, this, "ptr", pszTopicName, SPLOADOPTIONS, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnloadDictation() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULESTATE} NewState 
     * @returns {HRESULT} 
     */
    SetDictationState(NewState) {
        result := ComCall(22, this, SPRULESTATE, NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pText 
     * @param {Integer} cchText 
     * @param {Pointer<SPTEXTSELECTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    SetWordSequenceData(pText, cchText, pInfo) {
        pText := pText is String ? StrPtr(pText) : pText

        result := ComCall(23, this, "ptr", pText, "uint", cchText, SPTEXTSELECTIONINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPTEXTSELECTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    SetTextSelection(pInfo) {
        result := ComCall(24, this, SPTEXTSELECTIONINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Pointer<SPWORDPRONOUNCEABLE>} pWordPronounceable 
     * @returns {HRESULT} 
     */
    IsPronounceable(pszWord, pWordPronounceable) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        pWordPronounceableMarshal := pWordPronounceable is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "ptr", pszWord, pWordPronounceableMarshal, pWordPronounceable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPGRAMMARSTATE} eGrammarState 
     * @returns {HRESULT} 
     */
    SetGrammarState(eGrammarState) {
        result := ComCall(26, this, SPGRAMMARSTATE, eGrammarState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {PWSTR} 
     */
    SaveCmd(pStream) {
        result := ComCall(27, this, "ptr", pStream, PWSTR.Ptr, &ppszCoMemErrorText := 0, "HRESULT")
        return ppszCoMemErrorText
    }

    /**
     * 
     * @param {Pointer<SPGRAMMARSTATE>} peGrammarState 
     * @returns {HRESULT} 
     */
    GetGrammarState(peGrammarState) {
        peGrammarStateMarshal := peGrammarState is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, peGrammarStateMarshal, peGrammarState, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecoGrammar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGrammarId := CallbackCreate(GetMethod(implObj, "GetGrammarId"), flags, 2)
        this.vtbl.GetRecoContext := CallbackCreate(GetMethod(implObj, "GetRecoContext"), flags, 2)
        this.vtbl.LoadCmdFromFile := CallbackCreate(GetMethod(implObj, "LoadCmdFromFile"), flags, 3)
        this.vtbl.LoadCmdFromObject := CallbackCreate(GetMethod(implObj, "LoadCmdFromObject"), flags, 4)
        this.vtbl.LoadCmdFromResource := CallbackCreate(GetMethod(implObj, "LoadCmdFromResource"), flags, 6)
        this.vtbl.LoadCmdFromMemory := CallbackCreate(GetMethod(implObj, "LoadCmdFromMemory"), flags, 3)
        this.vtbl.LoadCmdFromProprietaryGrammar := CallbackCreate(GetMethod(implObj, "LoadCmdFromProprietaryGrammar"), flags, 6)
        this.vtbl.SetRuleState := CallbackCreate(GetMethod(implObj, "SetRuleState"), flags, 4)
        this.vtbl.SetRuleIdState := CallbackCreate(GetMethod(implObj, "SetRuleIdState"), flags, 3)
        this.vtbl.LoadDictation := CallbackCreate(GetMethod(implObj, "LoadDictation"), flags, 3)
        this.vtbl.UnloadDictation := CallbackCreate(GetMethod(implObj, "UnloadDictation"), flags, 1)
        this.vtbl.SetDictationState := CallbackCreate(GetMethod(implObj, "SetDictationState"), flags, 2)
        this.vtbl.SetWordSequenceData := CallbackCreate(GetMethod(implObj, "SetWordSequenceData"), flags, 4)
        this.vtbl.SetTextSelection := CallbackCreate(GetMethod(implObj, "SetTextSelection"), flags, 2)
        this.vtbl.IsPronounceable := CallbackCreate(GetMethod(implObj, "IsPronounceable"), flags, 3)
        this.vtbl.SetGrammarState := CallbackCreate(GetMethod(implObj, "SetGrammarState"), flags, 2)
        this.vtbl.SaveCmd := CallbackCreate(GetMethod(implObj, "SaveCmd"), flags, 3)
        this.vtbl.GetGrammarState := CallbackCreate(GetMethod(implObj, "GetGrammarState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGrammarId)
        CallbackFree(this.vtbl.GetRecoContext)
        CallbackFree(this.vtbl.LoadCmdFromFile)
        CallbackFree(this.vtbl.LoadCmdFromObject)
        CallbackFree(this.vtbl.LoadCmdFromResource)
        CallbackFree(this.vtbl.LoadCmdFromMemory)
        CallbackFree(this.vtbl.LoadCmdFromProprietaryGrammar)
        CallbackFree(this.vtbl.SetRuleState)
        CallbackFree(this.vtbl.SetRuleIdState)
        CallbackFree(this.vtbl.LoadDictation)
        CallbackFree(this.vtbl.UnloadDictation)
        CallbackFree(this.vtbl.SetDictationState)
        CallbackFree(this.vtbl.SetWordSequenceData)
        CallbackFree(this.vtbl.SetTextSelection)
        CallbackFree(this.vtbl.IsPronounceable)
        CallbackFree(this.vtbl.SetGrammarState)
        CallbackFree(this.vtbl.SaveCmd)
        CallbackFree(this.vtbl.GetGrammarState)
    }
}
