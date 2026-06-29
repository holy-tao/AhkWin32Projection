#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PHONETICALPHABET.ahk" { PHONETICALPHABET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPMATCHINGMODE.ahk" { SPMATCHINGMODE }
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpGrammarBuilder2 extends IUnknown {
    /**
     * The interface identifier for ISpGrammarBuilder2
     * @type {Guid}
     */
    static IID := Guid("{8ab10026-20cc-4b20-8c22-a49c9ba78f60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpGrammarBuilder2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTextSubset       : IntPtr
        SetPhoneticAlphabet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpGrammarBuilder2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hFromState 
     * @param {SPSTATEHANDLE} hToState 
     * @param {PWSTR} psz 
     * @param {SPMATCHINGMODE} eMatchMode 
     * @returns {HRESULT} 
     */
    AddTextSubset(hFromState, hToState, psz, eMatchMode) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(3, this, SPSTATEHANDLE, hFromState, SPSTATEHANDLE, hToState, "ptr", psz, SPMATCHINGMODE, eMatchMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PHONETICALPHABET} _phoneticALphabet 
     * @returns {HRESULT} 
     */
    SetPhoneticAlphabet(_phoneticALphabet) {
        result := ComCall(4, this, PHONETICALPHABET, _phoneticALphabet, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpGrammarBuilder2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTextSubset := CallbackCreate(GetMethod(implObj, "AddTextSubset"), flags, 5)
        this.vtbl.SetPhoneticAlphabet := CallbackCreate(GetMethod(implObj, "SetPhoneticAlphabet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTextSubset)
        CallbackFree(this.vtbl.SetPhoneticAlphabet)
    }
}
