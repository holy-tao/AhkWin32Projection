#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangLineBreakConsole extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BreakLineML", "BreakLineW", "BreakLineA"]

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
}
