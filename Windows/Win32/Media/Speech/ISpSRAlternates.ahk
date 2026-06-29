#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPPHRASEALTREQUEST.ahk" { SPPHRASEALTREQUEST }
#Import ".\SPPHRASEALT.ahk" { SPPHRASEALT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSRAlternates extends IUnknown {
    /**
     * The interface identifier for ISpSRAlternates
     * @type {Guid}
     */
    static IID := Guid("{fece8294-2be1-408f-8e68-2de377092f0e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSRAlternates interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAlternates : IntPtr
        Commit        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSRAlternates.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {Pointer<Pointer<SPPHRASEALT>>} ppAlts 
     * @param {Pointer<Integer>} pcAlts 
     * @returns {HRESULT} 
     */
    GetAlternates(pAltRequest, ppAlts, pcAlts) {
        ppAltsMarshal := ppAlts is VarRef ? "ptr*" : "ptr"
        pcAltsMarshal := pcAlts is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, SPPHRASEALTREQUEST.Ptr, pAltRequest, ppAltsMarshal, ppAlts, pcAltsMarshal, pcAlts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {Pointer<SPPHRASEALT>} pAlt 
     * @param {Pointer<Pointer<Void>>} ppvResultExtra 
     * @param {Pointer<Integer>} pcbResultExtra 
     * @returns {HRESULT} 
     */
    Commit(pAltRequest, pAlt, ppvResultExtra, pcbResultExtra) {
        ppvResultExtraMarshal := ppvResultExtra is VarRef ? "ptr*" : "ptr"
        pcbResultExtraMarshal := pcbResultExtra is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, SPPHRASEALTREQUEST.Ptr, pAltRequest, SPPHRASEALT.Ptr, pAlt, ppvResultExtraMarshal, ppvResultExtra, pcbResultExtraMarshal, pcbResultExtra, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSRAlternates.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAlternates := CallbackCreate(GetMethod(implObj, "GetAlternates"), flags, 4)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAlternates)
        CallbackFree(this.vtbl.Commit)
    }
}
