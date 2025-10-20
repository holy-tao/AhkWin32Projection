#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngineSite extends IUnknown{
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
     * 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    Read(pv, cb, pcbRead) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    DataAvailable(pcb) {
        result := ComCall(4, this, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(5, this, "uint", cbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPPARSEINFO>} pParseInfo 
     * @param {Pointer<ISpPhraseBuilder>} ppNewPhrase 
     * @returns {HRESULT} 
     */
    ParseFromTransitions(pParseInfo, ppNewPhrase) {
        result := ComCall(6, this, "ptr", pParseInfo, "ptr", ppNewPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTINFO>} pResultInfo 
     * @returns {HRESULT} 
     */
    Recognition(pResultInfo) {
        result := ComCall(7, this, "ptr", pResultInfo, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(8, this, "ptr", pEvent, "ptr", hSAPIRecoContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullProcessedThruPos 
     * @returns {HRESULT} 
     */
    Synchronize(ullProcessedThruPos) {
        result := ComCall(9, this, "uint", ullProcessedThruPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPWORDENTRY>} pWordEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetWordInfo(pWordEntry, Options) {
        result := ComCall(10, this, "ptr", pWordEntry, "int", Options, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(11, this, "ptr", hWord, "ptr", pvClientContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPRULEENTRY>} pRuleEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetRuleInfo(pRuleEntry, Options) {
        result := ComCall(12, this, "ptr", pRuleEntry, "int", Options, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(13, this, "ptr", hRule, "ptr", pvClientContext, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(14, this, "ptr", hState, "ptr", pStateInfo, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(15, this, "ptr", hRule, "ptr", pszResourceName, "ptr", ppCoMemResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SPTRANSITIONID} ID 
     * @param {Pointer<SPTRANSITIONPROPERTY>} ppCoMemProperty 
     * @returns {HRESULT} 
     */
    GetTransitionProperty(ID, ppCoMemProperty) {
        ID := ID is Win32Handle ? NumGet(ID, "ptr") : ID

        result := ComCall(16, this, "ptr", ID, "ptr", ppCoMemProperty, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(17, this, "ptr", hRule, "ptr", hAltRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<UInt32>} pulNumAlts 
     * @returns {HRESULT} 
     */
    GetMaxAlternates(hRule, pulNumAlts) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(18, this, "ptr", hRule, "uint*", pulNumAlts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hContext 
     * @param {Pointer<UInt32>} pulNumAlts 
     * @returns {HRESULT} 
     */
    GetContextMaxAlternates(hContext, pulNumAlts) {
        hContext := hContext is Win32Handle ? NumGet(hContext, "ptr") : hContext

        result := ComCall(19, this, "ptr", hContext, "uint*", pulNumAlts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullCurrentRecoPos 
     * @returns {HRESULT} 
     */
    UpdateRecoPos(ullCurrentRecoPos) {
        result := ComCall(20, this, "uint", ullCurrentRecoPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
