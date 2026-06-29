#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPTRANSITIONPROPERTY.ahk" { SPTRANSITIONPROPERTY }
#Import ".\SPRECOCONTEXTHANDLE.ahk" { SPRECOCONTEXTHANDLE }
#Import ".\SPTRANSITIONID.ahk" { SPTRANSITIONID }
#Import ".\SPEVENT.ahk" { SPEVENT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPSTATEINFO.ahk" { SPSTATEINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPRULEINFOOPT.ahk" { SPRULEINFOOPT }
#Import ".\SPRECORESULTINFO.ahk" { SPRECORESULTINFO }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import ".\SPWORDENTRY.ahk" { SPWORDENTRY }
#Import ".\SPWORDINFOOPT.ahk" { SPWORDINFOOPT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPPARSEINFO.ahk" { SPPARSEINFO }
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }
#Import ".\SPRULEENTRY.ahk" { SPRULEENTRY }
#Import ".\SPWORDHANDLE.ahk" { SPWORDHANDLE }
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSREngineSite extends IUnknown {
    /**
     * The interface identifier for ISpSREngineSite
     * @type {Guid}
     */
    static IID := Guid("{3b414aec-720c-4883-b9ef-178cd394fb3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSREngineSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Read                    : IntPtr
        DataAvailable           : IntPtr
        SetBufferNotifySize     : IntPtr
        ParseFromTransitions    : IntPtr
        Recognition             : IntPtr
        AddEvent                : IntPtr
        Synchronize             : IntPtr
        GetWordInfo             : IntPtr
        SetWordClientContext    : IntPtr
        GetRuleInfo             : IntPtr
        SetRuleClientContext    : IntPtr
        GetStateInfo            : IntPtr
        GetResource             : IntPtr
        GetTransitionProperty   : IntPtr
        IsAlternate             : IntPtr
        GetMaxAlternates        : IntPtr
        GetContextMaxAlternates : IntPtr
        UpdateRecoPos           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSREngineSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

    /**
     * 
     * @returns {Integer} 
     */
    DataAvailable() {
        result := ComCall(4, this, "uint*", &pcb := 0, "HRESULT")
        return pcb
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
     * @returns {ISpPhraseBuilder} 
     */
    ParseFromTransitions(pParseInfo) {
        result := ComCall(6, this, SPPARSEINFO.Ptr, pParseInfo, "ptr*", &ppNewPhrase := 0, "HRESULT")
        return ISpPhraseBuilder(ppNewPhrase)
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTINFO>} pResultInfo 
     * @returns {HRESULT} 
     */
    Recognition(pResultInfo) {
        result := ComCall(7, this, SPRECORESULTINFO.Ptr, pResultInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPEVENT>} pEvent 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {HRESULT} 
     */
    AddEvent(pEvent, hSAPIRecoContext) {
        result := ComCall(8, this, SPEVENT.Ptr, pEvent, SPRECOCONTEXTHANDLE, hSAPIRecoContext, "HRESULT")
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
     * @param {SPWORDINFOOPT} Options 
     * @returns {HRESULT} 
     */
    GetWordInfo(pWordEntry, Options) {
        result := ComCall(10, this, SPWORDENTRY.Ptr, pWordEntry, SPWORDINFOOPT, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPWORDHANDLE} hWord 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetWordClientContext(hWord, pvClientContext) {
        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, SPWORDHANDLE, hWord, pvClientContextMarshal, pvClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPRULEENTRY>} pRuleEntry 
     * @param {SPRULEINFOOPT} Options 
     * @returns {HRESULT} 
     */
    GetRuleInfo(pRuleEntry, Options) {
        result := ComCall(12, this, SPRULEENTRY.Ptr, pRuleEntry, SPRULEINFOOPT, Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetRuleClientContext(hRule, pvClientContext) {
        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, SPRULEHANDLE, hRule, pvClientContextMarshal, pvClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @returns {SPSTATEINFO} 
     */
    GetStateInfo(hState) {
        pStateInfo := SPSTATEINFO()
        result := ComCall(14, this, SPSTATEHANDLE, hState, SPSTATEINFO.Ptr, pStateInfo, "HRESULT")
        return pStateInfo
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {PWSTR} pszResourceName 
     * @returns {PWSTR} 
     */
    GetResource(hRule, pszResourceName) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(15, this, SPRULEHANDLE, hRule, "ptr", pszResourceName, PWSTR.Ptr, &ppCoMemResource := 0, "HRESULT")
        return ppCoMemResource
    }

    /**
     * 
     * @param {SPTRANSITIONID} ID 
     * @returns {Pointer<SPTRANSITIONPROPERTY>} 
     */
    GetTransitionProperty(ID) {
        result := ComCall(16, this, SPTRANSITIONID, ID, "ptr*", &ppCoMemProperty := 0, "HRESULT")
        return ppCoMemProperty
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {SPRULEHANDLE} hAltRule 
     * @returns {HRESULT} 
     */
    IsAlternate(hRule, hAltRule) {
        result := ComCall(17, this, SPRULEHANDLE, hRule, SPRULEHANDLE, hAltRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @returns {Integer} 
     */
    GetMaxAlternates(hRule) {
        result := ComCall(18, this, SPRULEHANDLE, hRule, "uint*", &pulNumAlts := 0, "HRESULT")
        return pulNumAlts
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hContext 
     * @returns {Integer} 
     */
    GetContextMaxAlternates(hContext) {
        result := ComCall(19, this, SPRECOCONTEXTHANDLE, hContext, "uint*", &pulNumAlts := 0, "HRESULT")
        return pulNumAlts
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

    Query(iid) {
        if (ISpSREngineSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 4)
        this.vtbl.DataAvailable := CallbackCreate(GetMethod(implObj, "DataAvailable"), flags, 2)
        this.vtbl.SetBufferNotifySize := CallbackCreate(GetMethod(implObj, "SetBufferNotifySize"), flags, 2)
        this.vtbl.ParseFromTransitions := CallbackCreate(GetMethod(implObj, "ParseFromTransitions"), flags, 3)
        this.vtbl.Recognition := CallbackCreate(GetMethod(implObj, "Recognition"), flags, 2)
        this.vtbl.AddEvent := CallbackCreate(GetMethod(implObj, "AddEvent"), flags, 3)
        this.vtbl.Synchronize := CallbackCreate(GetMethod(implObj, "Synchronize"), flags, 2)
        this.vtbl.GetWordInfo := CallbackCreate(GetMethod(implObj, "GetWordInfo"), flags, 3)
        this.vtbl.SetWordClientContext := CallbackCreate(GetMethod(implObj, "SetWordClientContext"), flags, 3)
        this.vtbl.GetRuleInfo := CallbackCreate(GetMethod(implObj, "GetRuleInfo"), flags, 3)
        this.vtbl.SetRuleClientContext := CallbackCreate(GetMethod(implObj, "SetRuleClientContext"), flags, 3)
        this.vtbl.GetStateInfo := CallbackCreate(GetMethod(implObj, "GetStateInfo"), flags, 3)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 4)
        this.vtbl.GetTransitionProperty := CallbackCreate(GetMethod(implObj, "GetTransitionProperty"), flags, 3)
        this.vtbl.IsAlternate := CallbackCreate(GetMethod(implObj, "IsAlternate"), flags, 3)
        this.vtbl.GetMaxAlternates := CallbackCreate(GetMethod(implObj, "GetMaxAlternates"), flags, 3)
        this.vtbl.GetContextMaxAlternates := CallbackCreate(GetMethod(implObj, "GetContextMaxAlternates"), flags, 3)
        this.vtbl.UpdateRecoPos := CallbackCreate(GetMethod(implObj, "UpdateRecoPos"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.DataAvailable)
        CallbackFree(this.vtbl.SetBufferNotifySize)
        CallbackFree(this.vtbl.ParseFromTransitions)
        CallbackFree(this.vtbl.Recognition)
        CallbackFree(this.vtbl.AddEvent)
        CallbackFree(this.vtbl.Synchronize)
        CallbackFree(this.vtbl.GetWordInfo)
        CallbackFree(this.vtbl.SetWordClientContext)
        CallbackFree(this.vtbl.GetRuleInfo)
        CallbackFree(this.vtbl.SetRuleClientContext)
        CallbackFree(this.vtbl.GetStateInfo)
        CallbackFree(this.vtbl.GetResource)
        CallbackFree(this.vtbl.GetTransitionProperty)
        CallbackFree(this.vtbl.IsAlternate)
        CallbackFree(this.vtbl.GetMaxAlternates)
        CallbackFree(this.vtbl.GetContextMaxAlternates)
        CallbackFree(this.vtbl.UpdateRecoPos)
    }
}
