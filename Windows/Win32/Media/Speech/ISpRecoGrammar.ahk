#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpRecoContext.ahk
#Include .\ISpGrammarBuilder.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoGrammar extends ISpGrammarBuilder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoGrammar
     * @type {Guid}
     */
    static IID => Guid("{2177db29-7f45-47d0-8554-067e91c80502}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGrammarId", "GetRecoContext", "LoadCmdFromFile", "LoadCmdFromObject", "LoadCmdFromResource", "LoadCmdFromMemory", "LoadCmdFromProprietaryGrammar", "SetRuleState", "SetRuleIdState", "LoadDictation", "UnloadDictation", "SetDictationState", "SetWordSequenceData", "SetTextSelection", "IsPronounceable", "SetGrammarState", "SaveCmd", "GetGrammarState"]

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
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromFile(pszFileName, Options) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(13, this, "ptr", pszFileName, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rcid 
     * @param {PWSTR} pszGrammarName 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromObject(rcid, pszGrammarName, Options) {
        pszGrammarName := pszGrammarName is String ? StrPtr(pszGrammarName) : pszGrammarName

        result := ComCall(14, this, "ptr", rcid, "ptr", pszGrammarName, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMODULE} hModule 
     * @param {PWSTR} pszResourceName 
     * @param {PWSTR} pszResourceType 
     * @param {Integer} wLanguage 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromResource(hModule, pszResourceName, pszResourceType, wLanguage, Options) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName
        pszResourceType := pszResourceType is String ? StrPtr(pszResourceType) : pszResourceType

        result := ComCall(15, this, "ptr", hModule, "ptr", pszResourceName, "ptr", pszResourceType, "ushort", wLanguage, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pGrammar 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromMemory(pGrammar, Options) {
        result := ComCall(16, this, "ptr", pGrammar, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidParam 
     * @param {PWSTR} pszStringParam 
     * @param {Pointer<Void>} pvDataPrarm 
     * @param {Integer} cbDataSize 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadCmdFromProprietaryGrammar(rguidParam, pszStringParam, pvDataPrarm, cbDataSize, Options) {
        pszStringParam := pszStringParam is String ? StrPtr(pszStringParam) : pszStringParam

        pvDataPrarmMarshal := pvDataPrarm is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, "ptr", rguidParam, "ptr", pszStringParam, pvDataPrarmMarshal, pvDataPrarm, "uint", cbDataSize, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Void>} pReserved 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetRuleState(pszName, pReserved, NewState) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, "ptr", pszName, pReservedMarshal, pReserved, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRuleId 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetRuleIdState(ulRuleId, NewState) {
        result := ComCall(19, this, "uint", ulRuleId, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTopicName 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadDictation(pszTopicName, Options) {
        pszTopicName := pszTopicName is String ? StrPtr(pszTopicName) : pszTopicName

        result := ComCall(20, this, "ptr", pszTopicName, "int", Options, "HRESULT")
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
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetDictationState(NewState) {
        result := ComCall(22, this, "int", NewState, "HRESULT")
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

        result := ComCall(23, this, "ptr", pText, "uint", cchText, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPTEXTSELECTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    SetTextSelection(pInfo) {
        result := ComCall(24, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {Pointer<Integer>} pWordPronounceable 
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
     * @param {Integer} eGrammarState 
     * @returns {HRESULT} 
     */
    SetGrammarState(eGrammarState) {
        result := ComCall(26, this, "int", eGrammarState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {PWSTR} 
     */
    SaveCmd(pStream) {
        result := ComCall(27, this, "ptr", pStream, "ptr*", &ppszCoMemErrorText := 0, "HRESULT")
        return ppszCoMemErrorText
    }

    /**
     * 
     * @param {Pointer<Integer>} peGrammarState 
     * @returns {HRESULT} 
     */
    GetGrammarState(peGrammarState) {
        peGrammarStateMarshal := peGrammarState is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, peGrammarStateMarshal, peGrammarState, "HRESULT")
        return result
    }
}
