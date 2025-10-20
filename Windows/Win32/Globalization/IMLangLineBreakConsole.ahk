#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangLineBreakConsole extends IUnknown{
    /**
     * The interface identifier for IMLangLineBreakConsole
     * @type {Guid}
     */
    static IID => Guid("{f5be2ee1-bfd7-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLangString>} pSrcMLStr 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} cMinColumns 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Int32>} plLineLen 
     * @param {Pointer<Int32>} plSkipLen 
     * @returns {HRESULT} 
     */
    BreakLineML(pSrcMLStr, lSrcPos, lSrcLen, cMinColumns, cMaxColumns, plLineLen, plSkipLen) {
        result := ComCall(3, this, "ptr", pSrcMLStr, "int", lSrcPos, "int", lSrcLen, "int", cMinColumns, "int", cMaxColumns, "int*", plLineLen, "int*", plSkipLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} locale 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Int32>} pcchLine 
     * @param {Pointer<Int32>} pcchSkip 
     * @returns {HRESULT} 
     */
    BreakLineW(locale, pszSrc, cchSrc, cMaxColumns, pcchLine, pcchSkip) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        result := ComCall(4, this, "uint", locale, "ptr", pszSrc, "int", cchSrc, "int", cMaxColumns, "int*", pcchLine, "int*", pcchSkip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} locale 
     * @param {Integer} uCodePage 
     * @param {PSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Integer} cMaxColumns 
     * @param {Pointer<Int32>} pcchLine 
     * @param {Pointer<Int32>} pcchSkip 
     * @returns {HRESULT} 
     */
    BreakLineA(locale, uCodePage, pszSrc, cchSrc, cMaxColumns, pcchLine, pcchSkip) {
        result := ComCall(5, this, "uint", locale, "uint", uCodePage, "ptr", pszSrc, "int", cchSrc, "int", cMaxColumns, "int*", pcchLine, "int*", pcchSkip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
