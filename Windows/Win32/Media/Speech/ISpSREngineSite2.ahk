#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPRECOCONTEXTHANDLE.ahk" { SPRECOCONTEXTHANDLE }
#Import ".\ISpSREngineSite.ahk" { ISpSREngineSite }
#Import ".\SPRECORESULTINFOEX.ahk" { SPRECORESULTINFOEX }
#Import ".\SPEVENTEX.ahk" { SPEVENTEX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPTRANSITIONENTRY.ahk" { SPTRANSITIONENTRY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSREngineSite2 extends ISpSREngineSite {
    /**
     * The interface identifier for ISpSREngineSite2
     * @type {Guid}
     */
    static IID := Guid("{7bc6e012-684a-493e-bdd4-2bf5fbf48cfe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSREngineSite2 interfaces
    */
    struct Vtbl extends ISpSREngineSite.Vtbl {
        AddEventEx        : IntPtr
        UpdateRecoPosEx   : IntPtr
        GetRuleTransition : IntPtr
        RecognitionEx     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSREngineSite2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPEVENTEX>} pEvent 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {HRESULT} 
     */
    AddEventEx(pEvent, hSAPIRecoContext) {
        result := ComCall(21, this, SPEVENTEX.Ptr, pEvent, SPRECOCONTEXTHANDLE, hSAPIRecoContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCurrentRecoPos 
     * @param {Integer} ullCurrentRecoTime 
     * @returns {HRESULT} 
     */
    UpdateRecoPosEx(ullCurrentRecoPos, ullCurrentRecoTime) {
        result := ComCall(22, this, "uint", ullCurrentRecoPos, "uint", ullCurrentRecoTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulGrammarID 
     * @param {Integer} RuleIndex 
     * @returns {SPTRANSITIONENTRY} 
     */
    GetRuleTransition(ulGrammarID, RuleIndex) {
        pTrans := SPTRANSITIONENTRY()
        result := ComCall(23, this, "uint", ulGrammarID, "uint", RuleIndex, SPTRANSITIONENTRY.Ptr, pTrans, "HRESULT")
        return pTrans
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTINFOEX>} pResultInfo 
     * @returns {HRESULT} 
     */
    RecognitionEx(pResultInfo) {
        result := ComCall(24, this, SPRECORESULTINFOEX.Ptr, pResultInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSREngineSite2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddEventEx := CallbackCreate(GetMethod(implObj, "AddEventEx"), flags, 3)
        this.vtbl.UpdateRecoPosEx := CallbackCreate(GetMethod(implObj, "UpdateRecoPosEx"), flags, 3)
        this.vtbl.GetRuleTransition := CallbackCreate(GetMethod(implObj, "GetRuleTransition"), flags, 4)
        this.vtbl.RecognitionEx := CallbackCreate(GetMethod(implObj, "RecognitionEx"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddEventEx)
        CallbackFree(this.vtbl.UpdateRecoPosEx)
        CallbackFree(this.vtbl.GetRuleTransition)
        CallbackFree(this.vtbl.RecognitionEx)
    }
}
