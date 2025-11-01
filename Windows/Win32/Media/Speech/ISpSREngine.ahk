#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSREngine
     * @type {Guid}
     */
    static IID => Guid("{2f472991-854b-4465-b613-fbafb3ad8ed8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSite", "GetInputAudioFormat", "RecognizeStream", "SetRecoProfile", "OnCreateGrammar", "OnDeleteGrammar", "LoadProprietaryGrammar", "UnloadProprietaryGrammar", "SetProprietaryRuleState", "SetProprietaryRuleIdState", "LoadSLM", "UnloadSLM", "SetSLMState", "SetWordSequenceData", "SetTextSelection", "IsPronounceable", "OnCreateRecoContext", "OnDeleteRecoContext", "PrivateCall", "SetAdaptationData", "SetPropertyNum", "GetPropertyNum", "SetPropertyString", "GetPropertyString", "SetGrammarState", "WordNotify", "RuleNotify", "PrivateCallEx", "SetContextState"]

    /**
     * 
     * @param {ISpSREngineSite} pSite 
     * @returns {HRESULT} 
     */
    SetSite(pSite) {
        result := ComCall(3, this, "ptr", pSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidSourceFormatId 
     * @param {Pointer<WAVEFORMATEX>} pSourceWaveFormatEx 
     * @param {Pointer<Guid>} pguidDesiredFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemDesiredWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetInputAudioFormat(pguidSourceFormatId, pSourceWaveFormatEx, pguidDesiredFormatId, ppCoMemDesiredWaveFormatEx) {
        result := ComCall(4, this, "ptr", pguidSourceFormatId, "ptr", pSourceWaveFormatEx, "ptr", pguidDesiredFormatId, "ptr*", ppCoMemDesiredWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFmtId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {HANDLE} hRequestSync 
     * @param {HANDLE} hDataAvailable 
     * @param {HANDLE} hExit 
     * @param {BOOL} fNewAudioStream 
     * @param {BOOL} fRealTimeAudio 
     * @param {ISpObjectToken} pAudioObjectToken 
     * @returns {HRESULT} 
     */
    RecognizeStream(rguidFmtId, pWaveFormatEx, hRequestSync, hDataAvailable, hExit, fNewAudioStream, fRealTimeAudio, pAudioObjectToken) {
        hRequestSync := hRequestSync is Win32Handle ? NumGet(hRequestSync, "ptr") : hRequestSync
        hDataAvailable := hDataAvailable is Win32Handle ? NumGet(hDataAvailable, "ptr") : hDataAvailable
        hExit := hExit is Win32Handle ? NumGet(hExit, "ptr") : hExit

        result := ComCall(5, this, "ptr", rguidFmtId, "ptr", pWaveFormatEx, "ptr", hRequestSync, "ptr", hDataAvailable, "ptr", hExit, "int", fNewAudioStream, "int", fRealTimeAudio, "ptr", pAudioObjectToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpObjectToken} pProfile 
     * @returns {HRESULT} 
     */
    SetRecoProfile(pProfile) {
        result := ComCall(6, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineRecoContext 
     * @param {SPGRAMMARHANDLE} hSAPIGrammar 
     * @param {Pointer<Pointer<Void>>} ppvEngineGrammarContext 
     * @returns {HRESULT} 
     */
    OnCreateGrammar(pvEngineRecoContext, hSAPIGrammar, ppvEngineGrammarContext) {
        hSAPIGrammar := hSAPIGrammar is Win32Handle ? NumGet(hSAPIGrammar, "ptr") : hSAPIGrammar

        pvEngineRecoContextMarshal := pvEngineRecoContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pvEngineRecoContextMarshal, pvEngineRecoContext, "ptr", hSAPIGrammar, "ptr*", ppvEngineGrammarContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @returns {HRESULT} 
     */
    OnDeleteGrammar(pvEngineGrammar) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, pvEngineGrammarMarshal, pvEngineGrammar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Pointer<Guid>} rguidParam 
     * @param {PWSTR} pszStringParam 
     * @param {Pointer<Void>} pvDataParam 
     * @param {Integer} ulDataSize 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    LoadProprietaryGrammar(pvEngineGrammar, rguidParam, pszStringParam, pvDataParam, ulDataSize, Options) {
        pszStringParam := pszStringParam is String ? StrPtr(pszStringParam) : pszStringParam

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"
        pvDataParamMarshal := pvDataParam is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", rguidParam, "ptr", pszStringParam, pvDataParamMarshal, pvDataParam, "uint", ulDataSize, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @returns {HRESULT} 
     */
    UnloadProprietaryGrammar(pvEngineGrammar) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, pvEngineGrammarMarshal, pvEngineGrammar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pszName 
     * @param {Pointer<Void>} pReserved 
     * @param {Integer} NewState 
     * @param {Pointer<Integer>} pcRulesChanged 
     * @returns {HRESULT} 
     */
    SetProprietaryRuleState(pvEngineGrammar, pszName, pReserved, NewState, pcRulesChanged) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"
        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"
        pcRulesChangedMarshal := pcRulesChanged is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszName, pReservedMarshal, pReserved, "int", NewState, pcRulesChangedMarshal, pcRulesChanged, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} dwRuleId 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetProprietaryRuleIdState(pvEngineGrammar, dwRuleId, NewState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pvEngineGrammarMarshal, pvEngineGrammar, "uint", dwRuleId, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pszTopicName 
     * @returns {HRESULT} 
     */
    LoadSLM(pvEngineGrammar, pszTopicName) {
        pszTopicName := pszTopicName is String ? StrPtr(pszTopicName) : pszTopicName

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszTopicName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @returns {HRESULT} 
     */
    UnloadSLM(pvEngineGrammar) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, pvEngineGrammarMarshal, pvEngineGrammar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetSLMState(pvEngineGrammar, NewState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, pvEngineGrammarMarshal, pvEngineGrammar, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pText 
     * @param {Integer} cchText 
     * @param {Pointer<SPTEXTSELECTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    SetWordSequenceData(pvEngineGrammar, pText, cchText, pInfo) {
        pText := pText is String ? StrPtr(pText) : pText

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pText, "uint", cchText, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Pointer<SPTEXTSELECTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    SetTextSelection(pvEngineGrammar, pInfo) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pszWord 
     * @param {Pointer<Integer>} pWordPronounceable 
     * @returns {HRESULT} 
     */
    IsPronounceable(pvEngineGrammar, pszWord, pWordPronounceable) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"
        pWordPronounceableMarshal := pWordPronounceable is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszWord, pWordPronounceableMarshal, pWordPronounceable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @param {Pointer<Pointer<Void>>} ppvEngineContext 
     * @returns {HRESULT} 
     */
    OnCreateRecoContext(hSAPIRecoContext, ppvEngineContext) {
        hSAPIRecoContext := hSAPIRecoContext is Win32Handle ? NumGet(hSAPIRecoContext, "ptr") : hSAPIRecoContext

        result := ComCall(19, this, "ptr", hSAPIRecoContext, "ptr*", ppvEngineContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @returns {HRESULT} 
     */
    OnDeleteRecoContext(pvEngineContext) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, pvEngineContextMarshal, pvEngineContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {Pointer<Void>} pCallFrame 
     * @param {Integer} ulCallFrameSize 
     * @returns {HRESULT} 
     */
    PrivateCall(pvEngineContext, pCallFrame, ulCallFrameSize) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"
        pCallFrameMarshal := pCallFrame is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, pvEngineContextMarshal, pvEngineContext, pCallFrameMarshal, pCallFrame, "uint", ulCallFrameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    SetAdaptationData(pvEngineContext, pAdaptationData, cch) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData

        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"

        result := ComCall(22, this, pvEngineContextMarshal, pvEngineContext, "ptr", pAdaptationData, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    SetPropertyNum(eSrc, pvSrcObj, pName, lValue) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(23, this, "int", eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {Pointer<Integer>} lValue 
     * @returns {HRESULT} 
     */
    GetPropertyNum(eSrc, pvSrcObj, pName, lValue) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"
        lValueMarshal := lValue is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "int", eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, lValueMarshal, lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {PWSTR} pValue 
     * @returns {HRESULT} 
     */
    SetPropertyString(eSrc, pvSrcObj, pName, pValue) {
        pName := pName is String ? StrPtr(pName) : pName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(25, this, "int", eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {Pointer<PWSTR>} ppCoMemValue 
     * @returns {HRESULT} 
     */
    GetPropertyString(eSrc, pvSrcObj, pName, ppCoMemValue) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(26, this, "int", eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "ptr", ppCoMemValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} eGrammarState 
     * @returns {HRESULT} 
     */
    SetGrammarState(pvEngineGrammar, eGrammarState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(27, this, pvEngineGrammarMarshal, pvEngineGrammar, "int", eGrammarState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Action 
     * @param {Integer} cWords 
     * @param {Pointer<SPWORDENTRY>} pWords 
     * @returns {HRESULT} 
     */
    WordNotify(Action, cWords, pWords) {
        result := ComCall(28, this, "int", Action, "uint", cWords, "ptr", pWords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Action 
     * @param {Integer} cRules 
     * @param {Pointer<SPRULEENTRY>} pRules 
     * @returns {HRESULT} 
     */
    RuleNotify(Action, cRules, pRules) {
        result := ComCall(29, this, "int", Action, "uint", cRules, "ptr", pRules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {Pointer<Void>} pInCallFrame 
     * @param {Integer} ulInCallFrameSize 
     * @param {Pointer<Pointer<Void>>} ppvCoMemResponse 
     * @param {Pointer<Integer>} pulResponseSize 
     * @returns {HRESULT} 
     */
    PrivateCallEx(pvEngineContext, pInCallFrame, ulInCallFrameSize, ppvCoMemResponse, pulResponseSize) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"
        pInCallFrameMarshal := pInCallFrame is VarRef ? "ptr" : "ptr"
        pulResponseSizeMarshal := pulResponseSize is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pvEngineContextMarshal, pvEngineContext, pInCallFrameMarshal, pInCallFrame, "uint", ulInCallFrameSize, "ptr*", ppvCoMemResponse, pulResponseSizeMarshal, pulResponseSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {Integer} eContextState 
     * @returns {HRESULT} 
     */
    SetContextState(pvEngineContext, eContextState) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"

        result := ComCall(31, this, pvEngineContextMarshal, pvEngineContext, "int", eContextState, "HRESULT")
        return result
    }
}
