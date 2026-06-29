#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPADAPTATIONSETTINGS.ahk" { SPADAPTATIONSETTINGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPBINARYGRAMMAR.ahk" { SPBINARYGRAMMAR }
#Import ".\SPADAPTATIONRELEVANCE.ahk" { SPADAPTATIONRELEVANCE }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpSREngine.ahk" { ISpSREngine }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSREngine2 extends ISpSREngine {
    /**
     * The interface identifier for ISpSREngine2
     * @type {Guid}
     */
    static IID := Guid("{7ba627d8-33f9-4375-90c5-9985aee5ede5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSREngine2 interfaces
    */
    struct Vtbl extends ISpSREngine.Vtbl {
        PrivateCallImmediate         : IntPtr
        SetAdaptationData2           : IntPtr
        SetGrammarPrefix             : IntPtr
        SetRulePriority              : IntPtr
        EmulateRecognition           : IntPtr
        SetSLMWeight                 : IntPtr
        SetRuleWeight                : IntPtr
        SetTrainingState             : IntPtr
        ResetAcousticModelAdaptation : IntPtr
        OnLoadCFG                    : IntPtr
        OnUnloadCFG                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSREngine2.Vtbl()
        }
        super.__New(implObj, flags)
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
    PrivateCallImmediate(pvEngineContext, pInCallFrame, ulInCallFrameSize, ppvCoMemResponse, pulResponseSize) {
        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"
        pInCallFrameMarshal := pInCallFrame is VarRef ? "ptr" : "ptr"
        ppvCoMemResponseMarshal := ppvCoMemResponse is VarRef ? "ptr*" : "ptr"
        pulResponseSizeMarshal := pulResponseSize is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, pvEngineContextMarshal, pvEngineContext, pInCallFrameMarshal, pInCallFrame, "uint", ulInCallFrameSize, ppvCoMemResponseMarshal, ppvCoMemResponse, pulResponseSizeMarshal, pulResponseSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @param {PWSTR} pTopicName 
     * @param {SPADAPTATIONSETTINGS} eSettings 
     * @param {SPADAPTATIONRELEVANCE} eRelevance 
     * @returns {HRESULT} 
     */
    SetAdaptationData2(pvEngineContext, pAdaptationData, cch, pTopicName, eSettings, eRelevance) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData
        pTopicName := pTopicName is String ? StrPtr(pTopicName) : pTopicName

        pvEngineContextMarshal := pvEngineContext is VarRef ? "ptr" : "ptr"

        result := ComCall(33, this, pvEngineContextMarshal, pvEngineContext, "ptr", pAdaptationData, "uint", cch, "ptr", pTopicName, SPADAPTATIONSETTINGS, eSettings, SPADAPTATIONRELEVANCE, eRelevance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {PWSTR} pszPrefix 
     * @param {BOOL} fIsPrefixRequired 
     * @returns {HRESULT} 
     */
    SetGrammarPrefix(pvEngineGrammar, pszPrefix, fIsPrefixRequired) {
        pszPrefix := pszPrefix is String ? StrPtr(pszPrefix) : pszPrefix

        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(34, this, pvEngineGrammarMarshal, pvEngineGrammar, "ptr", pszPrefix, BOOL, fIsPrefixRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Void>} pvClientRuleContext 
     * @param {Integer} nRulePriority 
     * @returns {HRESULT} 
     */
    SetRulePriority(hRule, pvClientRuleContext, nRulePriority) {
        pvClientRuleContextMarshal := pvClientRuleContext is VarRef ? "ptr" : "ptr"

        result := ComCall(35, this, SPRULEHANDLE, hRule, pvClientRuleContextMarshal, pvClientRuleContext, "int", nRulePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhrase} pPhrase 
     * @param {Integer} dwCompareFlags 
     * @returns {HRESULT} 
     */
    EmulateRecognition(pPhrase, dwCompareFlags) {
        result := ComCall(36, this, "ptr", pPhrase, "uint", dwCompareFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Float} flWeight 
     * @returns {HRESULT} 
     */
    SetSLMWeight(pvEngineGrammar, flWeight) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, pvEngineGrammarMarshal, pvEngineGrammar, "float", flWeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Void>} pvClientRuleContext 
     * @param {Float} flWeight 
     * @returns {HRESULT} 
     */
    SetRuleWeight(hRule, pvClientRuleContext, flWeight) {
        pvClientRuleContextMarshal := pvClientRuleContext is VarRef ? "ptr" : "ptr"

        result := ComCall(38, this, SPRULEHANDLE, hRule, pvClientRuleContextMarshal, pvClientRuleContext, "float", flWeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDoingTraining 
     * @param {BOOL} fAdaptFromTrainingData 
     * @returns {HRESULT} 
     */
    SetTrainingState(fDoingTraining, fAdaptFromTrainingData) {
        result := ComCall(39, this, BOOL, fDoingTraining, BOOL, fAdaptFromTrainingData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAcousticModelAdaptation() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Pointer<SPBINARYGRAMMAR>} pGrammarData 
     * @param {Integer} ulGrammarID 
     * @returns {HRESULT} 
     */
    OnLoadCFG(pvEngineGrammar, pGrammarData, ulGrammarID) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(41, this, pvEngineGrammarMarshal, pvEngineGrammar, SPBINARYGRAMMAR.Ptr, pGrammarData, "uint", ulGrammarID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} ulGrammarID 
     * @returns {HRESULT} 
     */
    OnUnloadCFG(pvEngineGrammar, ulGrammarID) {
        pvEngineGrammarMarshal := pvEngineGrammar is VarRef ? "ptr" : "ptr"

        result := ComCall(42, this, pvEngineGrammarMarshal, pvEngineGrammar, "uint", ulGrammarID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSREngine2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrivateCallImmediate := CallbackCreate(GetMethod(implObj, "PrivateCallImmediate"), flags, 6)
        this.vtbl.SetAdaptationData2 := CallbackCreate(GetMethod(implObj, "SetAdaptationData2"), flags, 7)
        this.vtbl.SetGrammarPrefix := CallbackCreate(GetMethod(implObj, "SetGrammarPrefix"), flags, 4)
        this.vtbl.SetRulePriority := CallbackCreate(GetMethod(implObj, "SetRulePriority"), flags, 4)
        this.vtbl.EmulateRecognition := CallbackCreate(GetMethod(implObj, "EmulateRecognition"), flags, 3)
        this.vtbl.SetSLMWeight := CallbackCreate(GetMethod(implObj, "SetSLMWeight"), flags, 3)
        this.vtbl.SetRuleWeight := CallbackCreate(GetMethod(implObj, "SetRuleWeight"), flags, 4)
        this.vtbl.SetTrainingState := CallbackCreate(GetMethod(implObj, "SetTrainingState"), flags, 3)
        this.vtbl.ResetAcousticModelAdaptation := CallbackCreate(GetMethod(implObj, "ResetAcousticModelAdaptation"), flags, 1)
        this.vtbl.OnLoadCFG := CallbackCreate(GetMethod(implObj, "OnLoadCFG"), flags, 4)
        this.vtbl.OnUnloadCFG := CallbackCreate(GetMethod(implObj, "OnUnloadCFG"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrivateCallImmediate)
        CallbackFree(this.vtbl.SetAdaptationData2)
        CallbackFree(this.vtbl.SetGrammarPrefix)
        CallbackFree(this.vtbl.SetRulePriority)
        CallbackFree(this.vtbl.EmulateRecognition)
        CallbackFree(this.vtbl.SetSLMWeight)
        CallbackFree(this.vtbl.SetRuleWeight)
        CallbackFree(this.vtbl.SetTrainingState)
        CallbackFree(this.vtbl.ResetAcousticModelAdaptation)
        CallbackFree(this.vtbl.OnLoadCFG)
        CallbackFree(this.vtbl.OnUnloadCFG)
    }
}
