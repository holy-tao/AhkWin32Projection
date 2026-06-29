#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPADAPTATIONRELEVANCE.ahk" { SPADAPTATIONRELEVANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoContext2 extends IUnknown {
    /**
     * The interface identifier for ISpRecoContext2
     * @type {Guid}
     */
    static IID := Guid("{bead311c-52ff-437f-9464-6b21054ca73d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoContext2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGrammarOptions  : IntPtr
        GetGrammarOptions  : IntPtr
        SetAdaptationData2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} eGrammarOptions 
     * @returns {HRESULT} 
     */
    SetGrammarOptions(eGrammarOptions) {
        result := ComCall(3, this, "uint", eGrammarOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peGrammarOptions 
     * @returns {HRESULT} 
     */
    GetGrammarOptions(peGrammarOptions) {
        peGrammarOptionsMarshal := peGrammarOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, peGrammarOptionsMarshal, peGrammarOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @param {PWSTR} pTopicName 
     * @param {Integer} eAdaptationSettings 
     * @param {SPADAPTATIONRELEVANCE} eRelevance 
     * @returns {HRESULT} 
     */
    SetAdaptationData2(pAdaptationData, cch, pTopicName, eAdaptationSettings, eRelevance) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData
        pTopicName := pTopicName is String ? StrPtr(pTopicName) : pTopicName

        result := ComCall(5, this, "ptr", pAdaptationData, "uint", cch, "ptr", pTopicName, "uint", eAdaptationSettings, SPADAPTATIONRELEVANCE, eRelevance, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecoContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGrammarOptions := CallbackCreate(GetMethod(implObj, "SetGrammarOptions"), flags, 2)
        this.vtbl.GetGrammarOptions := CallbackCreate(GetMethod(implObj, "GetGrammarOptions"), flags, 2)
        this.vtbl.SetAdaptationData2 := CallbackCreate(GetMethod(implObj, "SetAdaptationData2"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGrammarOptions)
        CallbackFree(this.vtbl.GetGrammarOptions)
        CallbackFree(this.vtbl.SetAdaptationData2)
    }
}
