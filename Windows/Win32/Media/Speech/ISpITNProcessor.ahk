#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpITNProcessor extends IUnknown {
    /**
     * The interface identifier for ISpITNProcessor
     * @type {Guid}
     */
    static IID := Guid("{12d7360f-a1c9-11d3-bc90-00c04f72df9f}")

    /**
     * The class identifier for SpITNProcessor
     * @type {Guid}
     */
    static CLSID := Guid("{12d73610-a1c9-11d3-bc90-00c04f72df9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpITNProcessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadITNGrammar : IntPtr
        ITNPhrase      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpITNProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszCLSID 
     * @returns {HRESULT} 
     */
    LoadITNGrammar(pszCLSID) {
        pszCLSID := pszCLSID is String ? StrPtr(pszCLSID) : pszCLSID

        result := ComCall(3, this, "ptr", pszCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhraseBuilder} pPhrase 
     * @returns {HRESULT} 
     */
    ITNPhrase(pPhrase) {
        result := ComCall(4, this, "ptr", pPhrase, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpITNProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadITNGrammar := CallbackCreate(GetMethod(implObj, "LoadITNGrammar"), flags, 2)
        this.vtbl.ITNPhrase := CallbackCreate(GetMethod(implObj, "ITNPhrase"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadITNGrammar)
        CallbackFree(this.vtbl.ITNPhrase)
    }
}
