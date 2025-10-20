#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpSREngine.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngine2 extends ISpSREngine{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSREngine2
     * @type {Guid}
     */
    static IID => Guid("{7ba627d8-33f9-4375-90c5-9985aee5ede5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrivateCallImmediate", "SetAdaptationData2", "SetGrammarPrefix", "SetRulePriority", "EmulateRecognition", "SetSLMWeight", "SetRuleWeight", "SetTrainingState", "ResetAcousticModelAdaptation", "OnLoadCFG", "OnUnloadCFG"]

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
        result := ComCall(32, this, "ptr", pvEngineContext, "ptr", pInCallFrame, "uint", ulInCallFrameSize, "ptr*", ppvCoMemResponse, "uint*", pulResponseSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineContext 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @param {PWSTR} pTopicName 
     * @param {Integer} eSettings 
     * @param {Integer} eRelevance 
     * @returns {HRESULT} 
     */
    SetAdaptationData2(pvEngineContext, pAdaptationData, cch, pTopicName, eSettings, eRelevance) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData
        pTopicName := pTopicName is String ? StrPtr(pTopicName) : pTopicName

        result := ComCall(33, this, "ptr", pvEngineContext, "ptr", pAdaptationData, "uint", cch, "ptr", pTopicName, "int", eSettings, "int", eRelevance, "HRESULT")
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

        result := ComCall(34, this, "ptr", pvEngineGrammar, "ptr", pszPrefix, "int", fIsPrefixRequired, "HRESULT")
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
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(35, this, "ptr", hRule, "ptr", pvClientRuleContext, "int", nRulePriority, "HRESULT")
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
        result := ComCall(37, this, "ptr", pvEngineGrammar, "float", flWeight, "HRESULT")
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
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(38, this, "ptr", hRule, "ptr", pvClientRuleContext, "float", flWeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDoingTraining 
     * @param {BOOL} fAdaptFromTrainingData 
     * @returns {HRESULT} 
     */
    SetTrainingState(fDoingTraining, fAdaptFromTrainingData) {
        result := ComCall(39, this, "int", fDoingTraining, "int", fAdaptFromTrainingData, "HRESULT")
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
        result := ComCall(41, this, "ptr", pvEngineGrammar, "ptr", pGrammarData, "uint", ulGrammarID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvEngineGrammar 
     * @param {Integer} ulGrammarID 
     * @returns {HRESULT} 
     */
    OnUnloadCFG(pvEngineGrammar, ulGrammarID) {
        result := ComCall(42, this, "ptr", pvEngineGrammar, "uint", ulGrammarID, "HRESULT")
        return result
    }
}
