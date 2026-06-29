#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPDISPLAYPHRASE.ahk" { SPDISPLAYPHRASE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpDisplayAlternates extends IUnknown {
    /**
     * The interface identifier for ISpDisplayAlternates
     * @type {Guid}
     */
    static IID := Guid("{c8d7c7e2-0dde-44b7-afe3-b0c991fbeb5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpDisplayAlternates interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDisplayAlternates  : IntPtr
        SetFullStopTrailSpace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpDisplayAlternates.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPDISPLAYPHRASE>} pPhrase 
     * @param {Integer} cRequestCount 
     * @param {Pointer<Pointer<SPDISPLAYPHRASE>>} ppCoMemPhrases 
     * @param {Pointer<Integer>} pcPhrasesReturned 
     * @returns {HRESULT} 
     */
    GetDisplayAlternates(pPhrase, cRequestCount, ppCoMemPhrases, pcPhrasesReturned) {
        ppCoMemPhrasesMarshal := ppCoMemPhrases is VarRef ? "ptr*" : "ptr"
        pcPhrasesReturnedMarshal := pcPhrasesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, SPDISPLAYPHRASE.Ptr, pPhrase, "uint", cRequestCount, ppCoMemPhrasesMarshal, ppCoMemPhrases, pcPhrasesReturnedMarshal, pcPhrasesReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTrailSpace 
     * @returns {HRESULT} 
     */
    SetFullStopTrailSpace(ulTrailSpace) {
        result := ComCall(4, this, "uint", ulTrailSpace, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpDisplayAlternates.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDisplayAlternates := CallbackCreate(GetMethod(implObj, "GetDisplayAlternates"), flags, 5)
        this.vtbl.SetFullStopTrailSpace := CallbackCreate(GetMethod(implObj, "SetFullStopTrailSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDisplayAlternates)
        CallbackFree(this.vtbl.SetFullStopTrailSpace)
    }
}
