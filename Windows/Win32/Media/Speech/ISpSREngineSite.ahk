#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngineSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSREngineSite
     * @type {Guid}
     */
    static IID => Guid("{3b414aec-720c-4883-b9ef-178cd394fb3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "DataAvailable", "SetBufferNotifySize", "ParseFromTransitions", "Recognition", "AddEvent", "Synchronize", "GetWordInfo", "SetWordClientContext", "GetRuleInfo", "SetRuleClientContext", "GetStateInfo", "GetResource", "GetTransitionProperty", "IsAlternate", "GetMaxAlternates", "GetContextMaxAlternates", "UpdateRecoPos"]

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     */
    Read(pv, cb, pcbRead) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    DataAvailable(pcb) {
        result := ComCall(4, this, "uint*", pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(5, this, "uint", cbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPPARSEINFO>} pParseInfo 
     * @param {Pointer<ISpPhraseBuilder>} ppNewPhrase 
     * @returns {HRESULT} 
     */
    ParseFromTransitions(pParseInfo, ppNewPhrase) {
        result := ComCall(6, this, "ptr", pParseInfo, "ptr*", ppNewPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTINFO>} pResultInfo 
     * @returns {HRESULT} 
     */
    Recognition(pResultInfo) {
        result := ComCall(7, this, "ptr", pResultInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPEVENT>} pEvent 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {HRESULT} 
     */
    AddEvent(pEvent, hSAPIRecoContext) {
        hSAPIRecoContext := hSAPIRecoContext is Win32Handle ? NumGet(hSAPIRecoContext, "ptr") : hSAPIRecoContext

        result := ComCall(8, this, "ptr", pEvent, "ptr", hSAPIRecoContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullProcessedThruPos 
     * @returns {HRESULT} 
     */
    Synchronize(ullProcessedThruPos) {
        result := ComCall(9, this, "uint", ullProcessedThruPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPWORDENTRY>} pWordEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetWordInfo(pWordEntry, Options) {
        result := ComCall(10, this, "ptr", pWordEntry, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPWORDHANDLE} hWord 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetWordClientContext(hWord, pvClientContext) {
        hWord := hWord is Win32Handle ? NumGet(hWord, "ptr") : hWord

        result := ComCall(11, this, "ptr", hWord, "ptr", pvClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPRULEENTRY>} pRuleEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetRuleInfo(pRuleEntry, Options) {
        result := ComCall(12, this, "ptr", pRuleEntry, "int", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetRuleClientContext(hRule, pvClientContext) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(13, this, "ptr", hRule, "ptr", pvClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @param {Pointer<SPSTATEINFO>} pStateInfo 
     * @returns {HRESULT} 
     */
    GetStateInfo(hState, pStateInfo) {
        hState := hState is Win32Handle ? NumGet(hState, "ptr") : hState

        result := ComCall(14, this, "ptr", hState, "ptr", pStateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {PWSTR} pszResourceName 
     * @param {Pointer<PWSTR>} ppCoMemResource 
     * @returns {HRESULT} 
     */
    GetResource(hRule, pszResourceName, ppCoMemResource) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(15, this, "ptr", hRule, "ptr", pszResourceName, "ptr", ppCoMemResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPTRANSITIONID} ID 
     * @param {Pointer<Pointer<SPTRANSITIONPROPERTY>>} ppCoMemProperty 
     * @returns {HRESULT} 
     */
    GetTransitionProperty(ID, ppCoMemProperty) {
        ID := ID is Win32Handle ? NumGet(ID, "ptr") : ID

        result := ComCall(16, this, "ptr", ID, "ptr*", ppCoMemProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {SPRULEHANDLE} hAltRule 
     * @returns {HRESULT} 
     */
    IsAlternate(hRule, hAltRule) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule
        hAltRule := hAltRule is Win32Handle ? NumGet(hAltRule, "ptr") : hAltRule

        result := ComCall(17, this, "ptr", hRule, "ptr", hAltRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Integer>} pulNumAlts 
     * @returns {HRESULT} 
     */
    GetMaxAlternates(hRule, pulNumAlts) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(18, this, "ptr", hRule, "uint*", pulNumAlts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hContext 
     * @param {Pointer<Integer>} pulNumAlts 
     * @returns {HRESULT} 
     */
    GetContextMaxAlternates(hContext, pulNumAlts) {
        hContext := hContext is Win32Handle ? NumGet(hContext, "ptr") : hContext

        result := ComCall(19, this, "ptr", hContext, "uint*", pulNumAlts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCurrentRecoPos 
     * @returns {HRESULT} 
     */
    UpdateRecoPos(ullCurrentRecoPos) {
        result := ComCall(20, this, "uint", ullCurrentRecoPos, "HRESULT")
        return result
    }
}
