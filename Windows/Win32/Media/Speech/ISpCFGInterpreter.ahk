#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpCFGInterpreterSite.ahk" { ISpCFGInterpreterSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpCFGInterpreter extends IUnknown {
    /**
     * The interface identifier for ISpCFGInterpreter
     * @type {Guid}
     */
    static IID := Guid("{f3d3f926-11fc-11d3-bb97-00c04f8ee6c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpCFGInterpreter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitGrammar : IntPtr
        Interpret   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpCFGInterpreter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszGrammarName 
     * @param {Pointer<Pointer<Void>>} pvGrammarData 
     * @returns {HRESULT} 
     */
    InitGrammar(pszGrammarName, pvGrammarData) {
        pszGrammarName := pszGrammarName is String ? StrPtr(pszGrammarName) : pszGrammarName

        pvGrammarDataMarshal := pvGrammarData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszGrammarName, pvGrammarDataMarshal, pvGrammarData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpPhraseBuilder} pPhrase 
     * @param {Integer} ulFirstElement 
     * @param {Integer} ulCountOfElements 
     * @param {ISpCFGInterpreterSite} pSite 
     * @returns {HRESULT} 
     */
    Interpret(pPhrase, ulFirstElement, ulCountOfElements, pSite) {
        result := ComCall(4, this, "ptr", pPhrase, "uint", ulFirstElement, "uint", ulCountOfElements, "ptr", pSite, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpCFGInterpreter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitGrammar := CallbackCreate(GetMethod(implObj, "InitGrammar"), flags, 3)
        this.vtbl.Interpret := CallbackCreate(GetMethod(implObj, "Interpret"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitGrammar)
        CallbackFree(this.vtbl.Interpret)
    }
}
