#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMLangString.ahk" { IMLangString }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangLineBreakConsole extends IUnknown {
    /**
     * The interface identifier for IMLangLineBreakConsole
     * @type {Guid}
     */
    static IID := Guid("{f5be2ee1-bfd7-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangLineBreakConsole interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BreakLineML : IntPtr
        BreakLineW  : IntPtr
        BreakLineA  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangLineBreakConsole.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMLangString} pSrcMLStr 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} cMinColumns 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Integer>} plLineLen 
     * @param {Pointer<Integer>} plSkipLen 
     * @returns {HRESULT} 
     */
    BreakLineML(pSrcMLStr, lSrcPos, lSrcLen, cMinColumns, cMaxColumns, plLineLen, plSkipLen) {
        plLineLenMarshal := plLineLen is VarRef ? "int*" : "ptr"
        plSkipLenMarshal := plSkipLen is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pSrcMLStr, "int", lSrcPos, "int", lSrcLen, "int", cMinColumns, "int", cMaxColumns, plLineLenMarshal, plLineLen, plSkipLenMarshal, plSkipLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} locale 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Integer>} pcchLine 
     * @param {Pointer<Integer>} pcchSkip 
     * @returns {HRESULT} 
     */
    BreakLineW(locale, pszSrc, cchSrc, cMaxColumns, pcchLine, pcchSkip) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchLineMarshal := pcchLine is VarRef ? "int*" : "ptr"
        pcchSkipMarshal := pcchSkip is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", locale, "ptr", pszSrc, "int", cchSrc, "int", cMaxColumns, pcchLineMarshal, pcchLine, pcchSkipMarshal, pcchSkip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} locale 
     * @param {Integer} uCodePage 
     * @param {PSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Integer>} pcchLine 
     * @param {Pointer<Integer>} pcchSkip 
     * @returns {HRESULT} 
     */
    BreakLineA(locale, uCodePage, pszSrc, cchSrc, cMaxColumns, pcchLine, pcchSkip) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchLineMarshal := pcchLine is VarRef ? "int*" : "ptr"
        pcchSkipMarshal := pcchSkip is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", locale, "uint", uCodePage, "ptr", pszSrc, "int", cchSrc, "int", cMaxColumns, pcchLineMarshal, pcchLine, pcchSkipMarshal, pcchSkip, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangLineBreakConsole.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BreakLineML := CallbackCreate(GetMethod(implObj, "BreakLineML"), flags, 8)
        this.vtbl.BreakLineW := CallbackCreate(GetMethod(implObj, "BreakLineW"), flags, 7)
        this.vtbl.BreakLineA := CallbackCreate(GetMethod(implObj, "BreakLineA"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BreakLineML)
        CallbackFree(this.vtbl.BreakLineW)
        CallbackFree(this.vtbl.BreakLineA)
    }
}
