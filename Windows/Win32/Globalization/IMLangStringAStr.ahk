#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IMLangString.ahk" { IMLangString }
#Import ".\IMLangStringBufA.ahk" { IMLangStringBufA }

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

        pcchActualMarshal := pcchActual is VarRef ? "int*" : IntPtr
        pcchActualMarshal := pcchActual == 0 ? IntPtr : "int*"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : IntPtr
        plActualLenMarshal := plActualLen == 0 ? IntPtr : "int*"

        result := ComCall(7, this, Int32, lDestPos, Int32, lDestLen, UInt32, uCodePage, "ptr", pszSrc, Int32, cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} uCodePage 
     * @param {IMLangStringBufA} pSrcBuf 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetStrBufA(lDestPos, lDestLen, uCodePage, pSrcBuf, pcchActual, plActualLen) {
        pSrcBufMarshal := pSrcBuf == 0 ? IntPtr : "ptr"
        pcchActualMarshal := pcchActual is VarRef ? "int*" : IntPtr
        pcchActualMarshal := pcchActual == 0 ? IntPtr : "int*"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : IntPtr
        plActualLenMarshal := plActualLen == 0 ? IntPtr : "int*"

        result := ComCall(8, this, Int32, lDestPos, Int32, lDestLen, UInt32, uCodePage, pSrcBufMarshal, pSrcBuf, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
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

        pszDestMarshal := pszDest == 0 ? IntPtr : PSTR
        pcchActualMarshal := pcchActual is VarRef ? "int*" : IntPtr
        pcchActualMarshal := pcchActual == 0 ? IntPtr : "int*"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : IntPtr
        plActualLenMarshal := plActualLen == 0 ? IntPtr : "int*"

        result := ComCall(9, this, Int32, lSrcPos, Int32, lSrcLen, UInt32, uCodePageIn, "uint*", puCodePageOut, pszDestMarshal, pszDest, Int32, cchDest, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<Integer>} puDestCodePage 
     * @param {Pointer<IMLangStringBufA>} ppDestBuf 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    GetStrBufA(lSrcPos, lSrcMaxLen, puDestCodePage, ppDestBuf, plDestLen) {
        puDestCodePageMarshal := puDestCodePage is VarRef ? "uint*" : IntPtr
        puDestCodePageMarshal := puDestCodePage == 0 ? IntPtr : "uint*"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : IntPtr
        plDestLenMarshal := plDestLen == 0 ? IntPtr : "int*"

        result := ComCall(10, this, Int32, lSrcPos, Int32, lSrcMaxLen, puDestCodePageMarshal, puDestCodePage, IMLangStringBufA.Ptr, ppDestBuf, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
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
        puCodePageOutMarshal := puCodePageOut is VarRef ? "uint*" : IntPtr
        puCodePageOutMarshal := puCodePageOut == 0 ? IntPtr : "uint*"
        ppszDestMarshal := ppszDest is VarRef ? "ptr*" : IntPtr
        ppszDestMarshal := ppszDest == 0 ? IntPtr : PSTR.Ptr
        pcchDestMarshal := pcchDest is VarRef ? "int*" : IntPtr
        pcchDestMarshal := pcchDest == 0 ? IntPtr : "int*"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : IntPtr
        plDestLenMarshal := plDestLen == 0 ? IntPtr : "int*"

        result := ComCall(11, this, Int32, lSrcPos, Int32, lSrcLen, Int32, lFlags, UInt32, uCodePageIn, Int32, cchRequest, puCodePageOutMarshal, puCodePageOut, ppszDestMarshal, ppszDest, pcchDestMarshal, pcchDest, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * @param {PSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    UnlockAStr(pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : IntPtr
        pcchActualMarshal := pcchActual == 0 ? IntPtr : "int*"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : IntPtr
        plActualLenMarshal := plActualLen == 0 ? IntPtr : "int*"

        result := ComCall(12, this, "ptr", pszSrc, Int32, cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} locale 
     * @returns {HRESULT} 
     */
    SetLocale(lDestPos, lDestLen, locale) {
        result := ComCall(13, this, Int32, lDestPos, Int32, lDestLen, UInt32, locale, "HRESULT")
        return result
    }

    /**
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<Integer>} plocale 
     * @param {Pointer<Integer>} plLocalePos 
     * @param {Pointer<Integer>} plLocaleLen 
     * @returns {HRESULT} 
     */
    GetLocale(lSrcPos, lSrcMaxLen, plocale, plLocalePos, plLocaleLen) {
        plocaleMarshal := plocale is VarRef ? "uint*" : IntPtr
        plocaleMarshal := plocale == 0 ? IntPtr : "uint*"
        plLocalePosMarshal := plLocalePos is VarRef ? "int*" : IntPtr
        plLocalePosMarshal := plLocalePos == 0 ? IntPtr : "int*"
        plLocaleLenMarshal := plLocaleLen is VarRef ? "int*" : IntPtr
        plLocaleLenMarshal := plLocaleLen == 0 ? IntPtr : "int*"

        result := ComCall(14, this, Int32, lSrcPos, Int32, lSrcMaxLen, plocaleMarshal, plocale, plLocalePosMarshal, plLocalePos, plLocaleLenMarshal, plLocaleLen, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IMLangStringAStr.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAStr := CallbackCreate(ObjBindMethod(implObj, "SetAStr"), flags, 8)
        this.vtbl.SetStrBufA := CallbackCreate(ObjBindMethod(implObj, "SetStrBufA"), flags, 7)
        this.vtbl.GetAStr := CallbackCreate(ObjBindMethod(implObj, "GetAStr"), flags, 9)
        this.vtbl.GetStrBufA := CallbackCreate(ObjBindMethod(implObj, "GetStrBufA"), flags, 6)
        this.vtbl.LockAStr := CallbackCreate(ObjBindMethod(implObj, "LockAStr"), flags, 10)
        this.vtbl.UnlockAStr := CallbackCreate(ObjBindMethod(implObj, "UnlockAStr"), flags, 5)
        this.vtbl.SetLocale := CallbackCreate(ObjBindMethod(implObj, "SetLocale"), flags, 4)
        this.vtbl.GetLocale := CallbackCreate(ObjBindMethod(implObj, "GetLocale"), flags, 6)
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
