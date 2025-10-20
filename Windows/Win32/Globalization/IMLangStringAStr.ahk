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
        result := ComCall(7, this, "int", lDestPos, "int", lDestLen, "uint", uCodePage, "ptr", pszSrc, "int", cchSrc, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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
        result := ComCall(8, this, "int", lDestPos, "int", lDestLen, "uint", uCodePage, "ptr", pSrcBuf, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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

        result := ComCall(9, this, "int", lSrcPos, "int", lSrcLen, "uint", uCodePageIn, "uint*", puCodePageOut, "ptr", pszDest, "int", cchDest, "int*", pcchActual, "int*", plActualLen, "HRESULT")
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
        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, "uint*", puDestCodePage, "ptr*", ppDestBuf, "int*", plDestLen, "HRESULT")
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
        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "uint", uCodePageIn, "int", cchRequest, "uint*", puCodePageOut, "ptr", ppszDest, "int*", pcchDest, "int*", plDestLen, "HRESULT")
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
