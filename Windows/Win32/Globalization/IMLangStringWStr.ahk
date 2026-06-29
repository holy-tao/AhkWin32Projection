#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMLangStringBufW.ahk" { IMLangStringBufW }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLangString.ahk" { IMLangString }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangStringWStr extends IMLangString {
    /**
     * The interface identifier for IMLangStringWStr
     * @type {Guid}
     */
    static IID := Guid("{c04d65d0-b70d-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangStringWStr interfaces
    */
    struct Vtbl extends IMLangString.Vtbl {
        SetWStr    : IntPtr
        SetStrBufW : IntPtr
        GetWStr    : IntPtr
        GetStrBufW : IntPtr
        LockWStr   : IntPtr
        UnlockWStr : IntPtr
        SetLocale  : IntPtr
        GetLocale  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangStringWStr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetWStr(lDestPos, lDestLen, pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", lDestPos, "int", lDestLen, "ptr", pszSrc, "int", cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {IMLangStringBufW} pSrcBuf 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetStrBufW(lDestPos, lDestLen, pSrcBuf, pcchActual, plActualLen) {
        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lDestPos, "int", lDestLen, "ptr", pSrcBuf, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {PWSTR} pszDest 
     * @param {Integer} cchDest 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    GetWStr(lSrcPos, lSrcLen, pszDest, cchDest, pcchActual, plActualLen) {
        pszDest := pszDest is String ? StrPtr(pszDest) : pszDest

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lSrcPos, "int", lSrcLen, "ptr", pszDest, "int", cchDest, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<IMLangStringBufW>} ppDestBuf 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    GetStrBufW(lSrcPos, lSrcMaxLen, ppDestBuf, plDestLen) {
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, IMLangStringBufW.Ptr, ppDestBuf, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} lFlags 
     * @param {Integer} cchRequest 
     * @param {Pointer<PWSTR>} ppszDest 
     * @param {Pointer<Integer>} pcchDest 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    LockWStr(lSrcPos, lSrcLen, lFlags, cchRequest, ppszDest, pcchDest, plDestLen) {
        ppszDestMarshal := ppszDest is VarRef ? "ptr*" : "ptr"
        pcchDestMarshal := pcchDest is VarRef ? "int*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "int", cchRequest, ppszDestMarshal, ppszDest, pcchDestMarshal, pcchDest, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    UnlockWStr(pszSrc, cchSrc, pcchActual, plActualLen) {
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
        if (IMLangStringWStr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWStr := CallbackCreate(GetMethod(implObj, "SetWStr"), flags, 7)
        this.vtbl.SetStrBufW := CallbackCreate(GetMethod(implObj, "SetStrBufW"), flags, 6)
        this.vtbl.GetWStr := CallbackCreate(GetMethod(implObj, "GetWStr"), flags, 7)
        this.vtbl.GetStrBufW := CallbackCreate(GetMethod(implObj, "GetStrBufW"), flags, 5)
        this.vtbl.LockWStr := CallbackCreate(GetMethod(implObj, "LockWStr"), flags, 8)
        this.vtbl.UnlockWStr := CallbackCreate(GetMethod(implObj, "UnlockWStr"), flags, 5)
        this.vtbl.SetLocale := CallbackCreate(GetMethod(implObj, "SetLocale"), flags, 4)
        this.vtbl.GetLocale := CallbackCreate(GetMethod(implObj, "GetLocale"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWStr)
        CallbackFree(this.vtbl.SetStrBufW)
        CallbackFree(this.vtbl.GetWStr)
        CallbackFree(this.vtbl.GetStrBufW)
        CallbackFree(this.vtbl.LockWStr)
        CallbackFree(this.vtbl.UnlockWStr)
        CallbackFree(this.vtbl.SetLocale)
        CallbackFree(this.vtbl.GetLocale)
    }
}
