#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMLangString.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangStringAStr extends IMLangString{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangStringAStr
     * @type {Guid}
     */
    static IID => Guid("{c04d65d2-b70d-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAStr", "SetStrBufA", "GetAStr", "GetStrBufA", "LockAStr", "UnlockAStr", "SetLocale", "GetLocale"]

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

        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, puDestCodePageMarshal, puDestCodePage, "ptr*", ppDestBuf, plDestLenMarshal, plDestLen, "HRESULT")
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
        pcchDestMarshal := pcchDest is VarRef ? "int*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "uint", uCodePageIn, "int", cchRequest, puCodePageOutMarshal, puCodePageOut, "ptr", ppszDest, pcchDestMarshal, pcchDest, plDestLenMarshal, plDestLen, "HRESULT")
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
}
