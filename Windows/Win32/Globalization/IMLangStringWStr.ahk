#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMLangString.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangStringWStr extends IMLangString{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangStringWStr
     * @type {Guid}
     */
    static IID => Guid("{c04d65d0-b70d-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWStr", "SetStrBufW", "GetWStr", "GetStrBufW", "LockWStr", "UnlockWStr", "SetLocale", "GetLocale"]

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

        result := ComCall(7, this, "int", lDestPos, "int", lDestLen, "ptr", pszSrc, "int", cchSrc, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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
        result := ComCall(8, this, "int", lDestPos, "int", lDestLen, "ptr", pSrcBuf, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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

        result := ComCall(9, this, "int", lSrcPos, "int", lSrcLen, "ptr", pszDest, "int", cchDest, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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
        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, "ptr*", ppDestBuf, "int*", plDestLen, "HRESULT")
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
        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "int", cchRequest, "ptr", ppszDest, "int*", pcchDest, "int*", plDestLen, "HRESULT")
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

        result := ComCall(12, this, "ptr", pszSrc, "int", cchSrc, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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
        result := ComCall(14, this, "int", lSrcPos, "int", lSrcMaxLen, "uint*", plocale, "int*", plLocalePos, "int*", plLocaleLen, "HRESULT")
        return result
    }
}
