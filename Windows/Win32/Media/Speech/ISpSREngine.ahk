#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpSREngineSite.ahk" { ISpSREngineSite }
#Import ".\SPLOADOPTIONS.ahk" { SPLOADOPTIONS }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPRECOCONTEXTHANDLE.ahk" { SPRECOCONTEXTHANDLE }
#Import ".\SPRULESTATE.ahk" { SPRULESTATE }
#Import ".\SPWORDENTRY.ahk" { SPWORDENTRY }
#Import ".\SPCONTEXTSTATE.ahk" { SPCONTEXTSTATE }
#Import ".\SPTEXTSELECTIONINFO.ahk" { SPTEXTSELECTIONINFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SPPROPSRC.ahk" { SPPROPSRC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SPWORDPRONOUNCEABLE.ahk" { SPWORDPRONOUNCEABLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpObjectToken.ahk" { ISpObjectToken }
#Import ".\SPRULEENTRY.ahk" { SPRULEENTRY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPGRAMMARSTATE.ahk" { SPGRAMMARSTATE }
#Import ".\SPGRAMMARHANDLE.ahk" { SPGRAMMARHANDLE }
#Import ".\SPCFGNOTIFY.ahk" { SPCFGNOTIFY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSREngine extends IUnknown {
    /**
     * The interface identifier for ISpSREngine
     * @type {Guid}
     */
    static IID := Guid("{2f472991-854b-4465-b613-fbafb3ad8ed8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSREngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSite                   : IntPtr
        GetInputAudioFormat       : IntPtr
        RecognizeStream           : IntPtr
        SetRecoProfile            : IntPtr
        OnCreateGrammar           : IntPtr
        OnDeleteGrammar           : IntPtr
        LoadProprietaryGrammar    : IntPtr
        UnloadProprietaryGrammar  : IntPtr
        SetProprietaryRuleState   : IntPtr
        SetProprietaryRuleIdState : IntPtr
        LoadSLM                   : IntPtr
        UnloadSLM                 : IntPtr
        SetSLMState               : IntPtr
        SetWordSequenceData       : IntPtr
        SetTextSelection          : IntPtr
        IsPronounceable           : IntPtr
        OnCreateRecoContext       : IntPtr
        OnDeleteRecoContext       : IntPtr
        PrivateCall               : IntPtr
        SetAdaptationData         : IntPtr
        SetPropertyNum            : IntPtr
        GetPropertyNum            : IntPtr
        SetPropertyString         : IntPtr
        GetPropertyString         : IntPtr
        SetGrammarState           : IntPtr
        WordNotify                : IntPtr
        RuleNotify                : IntPtr
        PrivateCallEx             : IntPtr
        SetContextState           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSREngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        ppCoMemDesiredWaveFormatExMarshal := ppCoMemDesiredWaveFormatEx is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, pguidSourceFormatId, WAVEFORMATEX.Ptr, pSourceWaveFormatEx, Guid.Ptr, pguidDesiredFormatId, ppCoMemDesiredWaveFormatExMarshal, ppCoMemDesiredWaveFormatEx, "HRESULT")
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
        result := ComCall(5, this, Guid.Ptr, rguidFmtId, WAVEFORMATEX.Ptr, pWaveFormatEx, HANDLE, hRequestSync, HANDLE, hDataAvailable, HANDLE, hExit, BOOL, fNewAudioStream, BOOL, fRealTimeAudio, "ptr", pAudioObjectToken, "HRESULT")
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
     * @returns {Pointer<Void>} 
     */
    OnCreateGrammar(pvEngineRecoContext, hSAPIGrammar) {
        pvEngineRecoContextMarshal := pvEngineRecoContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pvEngineRecoContextMarshal, pvEngineRecoContext, SPGRAMMARHANDLE, hSAPIGrammar, "ptr*", &ppvEngineGrammarContext := 0, "HRESULT")
        return ppvEngineGrammarContext
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
     * @param {SPLOADOPTIONS} Options 
     * @returns {HRESULT} 
     */
    LoadProprietaryGrammar(pvEngineGrammar, rguidParam, pszStringParam, pvDataParam, ulDataSize, Options) {
        pszStringParam := pszStringParam is String ? StrPtr(pszStringParam) : pszStringParam

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"
        pvDataParamMarshal := pvDataParam is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvEngineGrammarMarshal, pvEngineGrammar, Guid.Ptr, rguidParam, "ptr", pszStringParam, pvDataParamMarshal, pvDataParam, "uint", ulDataSize, SPLOADOPTIONS, Options, "HRESULT")
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
     * @param {SPRULESTATE} NewState 
     * @returns {Integer} 
     */
    SetProprietaryRuleState(pvEngineGrammar, pszName, pReserved, NewState) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"
        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszName, pReservedMarshal, pReserved, SPRULESTATE, NewState, "uint*", &pcRulesChanged := 0, "HRESULT")
        return pcRulesChanged
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} dwRuleId 
     * @param {SPRULESTATE} NewState 
     * @returns {HRESULT} 
     */
    SetProprietaryRuleIdState(pvEngineGrammar, dwRuleId, NewState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pvEngineGrammarMarshal, pvEngineGrammar, "uint", dwRuleId, SPRULESTATE, NewState, "HRESULT")
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
     * @param {SPRULESTATE} NewState 
     * @returns {HRESULT} 
     */
    SetSLMState(pvEngineGrammar, NewState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, pvEngineGrammarMarshal, pvEngineGrammar, SPRULESTATE, NewState, "HRESULT")
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

        result := ComCall(16, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pText, "uint", cchText, SPTEXTSELECTIONINFO.Ptr, pInfo, "HRESULT")
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

        result := ComCall(17, this, pvEngineGrammarMarshal, pvEngineGrammar, SPTEXTSELECTIONINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pszWord 
     * @returns {SPWORDPRONOUNCEABLE} 
     */
    IsPronounceable(pvEngineGrammar, pszWord) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszWord, "int*", &pWordPronounceable := 0, "HRESULT")
        return pWordPronounceable
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {Pointer<Void>} 
     */
    OnCreateRecoContext(hSAPIRecoContext) {
        result := ComCall(19, this, SPRECOCONTEXTHANDLE, hSAPIRecoContext, "ptr*", &ppvEngineContext := 0, "HRESULT")
        return ppvEngineContext
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
     * @param {SPPROPSRC} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    SetPropertyNum(eSrc, pvSrcObj, pName, lValue) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(23, this, SPPROPSRC, eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPPROPSRC} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @returns {Integer} 
     */
    GetPropertyNum(eSrc, pvSrcObj, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(24, this, SPPROPSRC, eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "int*", &lValue := 0, "HRESULT")
        return lValue
    }

    /**
     * 
     * @param {SPPROPSRC} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @param {PWSTR} pValue 
     * @returns {HRESULT} 
     */
    SetPropertyString(eSrc, pvSrcObj, pName, pValue) {
        pName := pName is String ? StrPtr(pName) : pName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(25, this, SPPROPSRC, eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPPROPSRC} eSrc 
     * @param {Pointer<Void>} pvSrcObj 
     * @param {PWSTR} pName 
     * @returns {PWSTR} 
     */
    GetPropertyString(eSrc, pvSrcObj, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        pvSrcObjMarshal := pvSrcObj is VarRef ? "ptr" : "ptr"

        result := ComCall(26, this, SPPROPSRC, eSrc, pvSrcObjMarshal, pvSrcObj, "ptr", pName, PWSTR.Ptr, &ppCoMemValue := 0, "HRESULT")
        return ppCoMemValue
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {SPGRAMMARSTATE} eGrammarState 
     * @returns {HRESULT} 
     */
    SetGrammarState(pvEngineGrammar, eGrammarState) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(27, this, pvEngineGrammarMarshal, pvEngineGrammar, SPGRAMMARSTATE, eGrammarState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPCFGNOTIFY} Action 
     * @param {Integer} cWords 
     * @param {Pointer<SPWORDENTRY>} pWords 
     * @returns {HRESULT} 
     */
    WordNotify(Action, cWords, pWords) {
        result := ComCall(28, this, SPCFGNOTIFY, Action, "uint", cWords, SPWORDENTRY.Ptr, pWords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPCFGNOTIFY} Action 
     * @param {Integer} cRules 
     * @param {Pointer<SPRULEENTRY>} pRules 
     * @returns {HRESULT} 
     */
    RuleNotify(Action, cRules, pRules) {
        result := ComCall(29, this, SPCFGNOTIFY, Action, "uint", cRules, SPRULEENTRY.Ptr, pRules, "HRESULT")
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
        ppvCoMemResponseMarshal := ppvCoMemResponse is VarRef ? "ptr*" : "ptr"
        pulResponseSizeMarshal := pulResponseSize is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pvEngineContextMarshal, pvEngineContext, pInCallFrameMarshal, pInCallFrame, "uint", ulInCallFrameSize, ppvCoMemResponseMarshal, ppvCoMemResponse, pulResponseSizeMarshal, pulResponseSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {SPCONTEXTSTATE} eContextState 
     * @returns {HRESULT} 
     */
    SetContextState(pvEngineContext, eContextState) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"

        result := ComCall(31, this, pvEngineContextMarshal, pvEngineContext, SPCONTEXTSTATE, eContextState, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSREngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSite := CallbackCreate(GetMethod(implObj, "SetSite"), flags, 2)
        this.vtbl.GetInputAudioFormat := CallbackCreate(GetMethod(implObj, "GetInputAudioFormat"), flags, 5)
        this.vtbl.RecognizeStream := CallbackCreate(GetMethod(implObj, "RecognizeStream"), flags, 9)
        this.vtbl.SetRecoProfile := CallbackCreate(GetMethod(implObj, "SetRecoProfile"), flags, 2)
        this.vtbl.OnCreateGrammar := CallbackCreate(GetMethod(implObj, "OnCreateGrammar"), flags, 4)
        this.vtbl.OnDeleteGrammar := CallbackCreate(GetMethod(implObj, "OnDeleteGrammar"), flags, 2)
        this.vtbl.LoadProprietaryGrammar := CallbackCreate(GetMethod(implObj, "LoadProprietaryGrammar"), flags, 7)
        this.vtbl.UnloadProprietaryGrammar := CallbackCreate(GetMethod(implObj, "UnloadProprietaryGrammar"), flags, 2)
        this.vtbl.SetProprietaryRuleState := CallbackCreate(GetMethod(implObj, "SetProprietaryRuleState"), flags, 6)
        this.vtbl.SetProprietaryRuleIdState := CallbackCreate(GetMethod(implObj, "SetProprietaryRuleIdState"), flags, 4)
        this.vtbl.LoadSLM := CallbackCreate(GetMethod(implObj, "LoadSLM"), flags, 3)
        this.vtbl.UnloadSLM := CallbackCreate(GetMethod(implObj, "UnloadSLM"), flags, 2)
        this.vtbl.SetSLMState := CallbackCreate(GetMethod(implObj, "SetSLMState"), flags, 3)
        this.vtbl.SetWordSequenceData := CallbackCreate(GetMethod(implObj, "SetWordSequenceData"), flags, 5)
        this.vtbl.SetTextSelection := CallbackCreate(GetMethod(implObj, "SetTextSelection"), flags, 3)
        this.vtbl.IsPronounceable := CallbackCreate(GetMethod(implObj, "IsPronounceable"), flags, 4)
        this.vtbl.OnCreateRecoContext := CallbackCreate(GetMethod(implObj, "OnCreateRecoContext"), flags, 3)
        this.vtbl.OnDeleteRecoContext := CallbackCreate(GetMethod(implObj, "OnDeleteRecoContext"), flags, 2)
        this.vtbl.PrivateCall := CallbackCreate(GetMethod(implObj, "PrivateCall"), flags, 4)
        this.vtbl.SetAdaptationData := CallbackCreate(GetMethod(implObj, "SetAdaptationData"), flags, 4)
        this.vtbl.SetPropertyNum := CallbackCreate(GetMethod(implObj, "SetPropertyNum"), flags, 5)
        this.vtbl.GetPropertyNum := CallbackCreate(GetMethod(implObj, "GetPropertyNum"), flags, 5)
        this.vtbl.SetPropertyString := CallbackCreate(GetMethod(implObj, "SetPropertyString"), flags, 5)
        this.vtbl.GetPropertyString := CallbackCreate(GetMethod(implObj, "GetPropertyString"), flags, 5)
        this.vtbl.SetGrammarState := CallbackCreate(GetMethod(implObj, "SetGrammarState"), flags, 3)
        this.vtbl.WordNotify := CallbackCreate(GetMethod(implObj, "WordNotify"), flags, 4)
        this.vtbl.RuleNotify := CallbackCreate(GetMethod(implObj, "RuleNotify"), flags, 4)
        this.vtbl.PrivateCallEx := CallbackCreate(GetMethod(implObj, "PrivateCallEx"), flags, 6)
        this.vtbl.SetContextState := CallbackCreate(GetMethod(implObj, "SetContextState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSite)
        CallbackFree(this.vtbl.GetInputAudioFormat)
        CallbackFree(this.vtbl.RecognizeStream)
        CallbackFree(this.vtbl.SetRecoProfile)
        CallbackFree(this.vtbl.OnCreateGrammar)
        CallbackFree(this.vtbl.OnDeleteGrammar)
        CallbackFree(this.vtbl.LoadProprietaryGrammar)
        CallbackFree(this.vtbl.UnloadProprietaryGrammar)
        CallbackFree(this.vtbl.SetProprietaryRuleState)
        CallbackFree(this.vtbl.SetProprietaryRuleIdState)
        CallbackFree(this.vtbl.LoadSLM)
        CallbackFree(this.vtbl.UnloadSLM)
        CallbackFree(this.vtbl.SetSLMState)
        CallbackFree(this.vtbl.SetWordSequenceData)
        CallbackFree(this.vtbl.SetTextSelection)
        CallbackFree(this.vtbl.IsPronounceable)
        CallbackFree(this.vtbl.OnCreateRecoContext)
        CallbackFree(this.vtbl.OnDeleteRecoContext)
        CallbackFree(this.vtbl.PrivateCall)
        CallbackFree(this.vtbl.SetAdaptationData)
        CallbackFree(this.vtbl.SetPropertyNum)
        CallbackFree(this.vtbl.GetPropertyNum)
        CallbackFree(this.vtbl.SetPropertyString)
        CallbackFree(this.vtbl.GetPropertyString)
        CallbackFree(this.vtbl.SetGrammarState)
        CallbackFree(this.vtbl.WordNotify)
        CallbackFree(this.vtbl.RuleNotify)
        CallbackFree(this.vtbl.PrivateCallEx)
        CallbackFree(this.vtbl.SetContextState)
    }
}
