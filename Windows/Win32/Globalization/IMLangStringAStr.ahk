#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\IMLangStringBufA.ahk" { IMLangStringBufA }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLangString.ahk" { IMLangString }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangStringAStr extends IMLangString {
    /**
     * The interface identifier for IMLangStringAStr
     * @type {Guid}
     */
    static IID := Guid("{c04d65d2-b70d-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangStringAStr interfaces
    */
    struct Vtbl extends IMLangString.Vtbl {
        SetAStr    : IntPtr
        SetStrBufA : IntPtr
        GetAStr    : IntPtr
        GetStrBufA : IntPtr
        LockAStr   : IntPtr
        UnlockAStr : IntPtr
        SetLocale  : IntPtr
        GetLocale  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangStringAStr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} uCodePage 
     * @param {PSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetAStr(lDestPos, lDestLen, uCodePage, pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", lDestPos, "int", lDestLen, "uint", uCodePage, "ptr", pszSrc, "int", cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} uCodePage 
     * @param {IMLangStringBufA} pSrcBuf 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetStrBufA(lDestPos, lDestLen, uCodePage, pSrcBuf, pcchActual, plActualLen) {
        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lDestPos, "int", lDestLen, "uint", uCodePage, "ptr", pSrcBuf, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} uCodePageIn 
     * @param {PSTR} pszDest 
     * @param {Integer} cchDest 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    GetAStr(lSrcPos, lSrcLen, uCodePageIn, pszDest, cchDest, pcchActual, plActualLen) {
        static puCodePageOut := 0 ;Reserved parameters must always be NULL

        pszDest := pszDest is String ? StrPtr(pszDest) : pszDest

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lSrcPos, "int", lSrcLen, "uint", uCodePageIn, "uint*", puCodePageOut, "ptr", pszDest, "int", cchDest, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<Integer>} puDestCodePage 
     * @param {Pointer<IMLangStringBufA>} ppDestBuf 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    GetStrBufA(lSrcPos, lSrcMaxLen, puDestCodePage, ppDestBuf, plDestLen) {
        puDestCodePageMarshal := puDestCodePage is VarRef ? "uint*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, puDestCodePageMarshal, puDestCodePage, IMLangStringBufA.Ptr, ppDestBuf, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} lFlags 
     * @param {Integer} uCodePageIn 
     * @param {Integer} cchRequest 
     * @param {Pointer<Integer>} puCodePageOut 
     * @param {Pointer<PSTR>} ppszDest 
     * @param {Pointer<Integer>} pcchDest 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    LockAStr(lSrcPos, lSrcLen, lFlags, uCodePageIn, cchRequest, puCodePageOut, ppszDest, pcchDest, plDestLen) {
        puCodePageOutMarshal := puCodePageOut is VarRef ? "uint*" : "ptr"
        ppszDestMarshal := ppszDest is VarRef ? "ptr*" : "ptr"
        pcchDestMarshal := pcchDest is VarRef ? "int*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "uint", uCodePageIn, "int", cchRequest, puCodePageOutMarshal, puCodePageOut, ppszDestMarshal, ppszDest, pcchDestMarshal, pcchDest, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    UnlockAStr(pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pszSrc, "int", cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} locale 
     * @returns {HRESULT} 
     */
    SetLocale(lDestPos, lDestLen, locale) {
        result := ComCall(13, this, "int", lDestPos, "int", lDestLen, "uint", locale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<Integer>} plocale 
     * @param {Pointer<Integer>} plLocalePos 
     * @param {Pointer<Integer>} plLocaleLen 
     * @returns {HRESULT} 
     */
    GetLocale(lSrcPos, lSrcMaxLen, plocale, plLocalePos, plLocaleLen) {
        plocaleMarshal := plocale is VarRef ? "uint*" : "ptr"
        plLocalePosMarshal := plLocalePos is VarRef ? "int*" : "ptr"
        plLocaleLenMarshal := plLocaleLen is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "int", lSrcPos, "int", lSrcMaxLen, plocaleMarshal, plocale, plLocalePosMarshal, plLocalePos, plLocaleLenMarshal, plLocaleLen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangStringAStr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAStr := CallbackCreate(GetMethod(implObj, "SetAStr"), flags, 8)
        this.vtbl.SetStrBufA := CallbackCreate(GetMethod(implObj, "SetStrBufA"), flags, 7)
        this.vtbl.GetAStr := CallbackCreate(GetMethod(implObj, "GetAStr"), flags, 9)
        this.vtbl.GetStrBufA := CallbackCreate(GetMethod(implObj, "GetStrBufA"), flags, 6)
        this.vtbl.LockAStr := CallbackCreate(GetMethod(implObj, "LockAStr"), flags, 10)
        this.vtbl.UnlockAStr := CallbackCreate(GetMethod(implObj, "UnlockAStr"), flags, 5)
        this.vtbl.SetLocale := CallbackCreate(GetMethod(implObj, "SetLocale"), flags, 4)
        this.vtbl.GetLocale := CallbackCreate(GetMethod(implObj, "GetLocale"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAStr)
        CallbackFree(this.vtbl.SetStrBufA)
        CallbackFree(this.vtbl.GetAStr)
        CallbackFree(this.vtbl.GetStrBufA)
        CallbackFree(this.vtbl.LockAStr)
        CallbackFree(this.vtbl.UnlockAStr)
        CallbackFree(this.vtbl.SetLocale)
        CallbackFree(this.vtbl.GetLocale)
    }
}
