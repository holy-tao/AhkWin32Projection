#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Foundation\BSTR.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMultiLanguage2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiLanguage2
     * @type {Guid}
     */
    static IID => Guid("{dccfc164-2b38-11d2-b7ec-00c04f8f5d9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfCodePageInfo", "GetCodePageInfo", "GetFamilyCodePage", "EnumCodePages", "GetCharsetInfo", "IsConvertible", "ConvertString", "ConvertStringToUnicode", "ConvertStringFromUnicode", "ConvertStringReset", "GetRfc1766FromLcid", "GetLcidFromRfc1766", "EnumRfc1766", "GetRfc1766Info", "CreateConvertCharset", "ConvertStringInIStream", "ConvertStringToUnicodeEx", "ConvertStringFromUnicodeEx", "DetectCodepageInIStream", "DetectInputCodepage", "ValidateCodePage", "GetCodePageDescription", "IsCodePageInstallable", "SetMimeDBSource", "GetNumberOfScripts", "EnumScripts", "ValidateCodePageEx"]

    /**
     * 
     * @param {Pointer<Integer>} pcCodePage 
     * @returns {HRESULT} 
     */
    GetNumberOfCodePageInfo(pcCodePage) {
        pcCodePageMarshal := pcCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcCodePageMarshal, pcCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Integer} LangId 
     * @param {Pointer<MIMECPINFO>} pCodePageInfo 
     * @returns {HRESULT} 
     */
    GetCodePageInfo(uiCodePage, LangId, pCodePageInfo) {
        result := ComCall(4, this, "uint", uiCodePage, "ushort", LangId, "ptr", pCodePageInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Pointer<Integer>} puiFamilyCodePage 
     * @returns {HRESULT} 
     */
    GetFamilyCodePage(uiCodePage, puiFamilyCodePage) {
        puiFamilyCodePageMarshal := puiFamilyCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", uiCodePage, puiFamilyCodePageMarshal, puiFamilyCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Integer} LangId 
     * @param {Pointer<IEnumCodePage>} ppEnumCodePage 
     * @returns {HRESULT} 
     */
    EnumCodePages(grfFlags, LangId, ppEnumCodePage) {
        result := ComCall(6, this, "uint", grfFlags, "ushort", LangId, "ptr*", ppEnumCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Charset 
     * @param {Pointer<MIMECSETINFO>} pCharsetInfo 
     * @returns {HRESULT} 
     */
    GetCharsetInfo(Charset, pCharsetInfo) {
        Charset := Charset is String ? BSTR.Alloc(Charset).Value : Charset

        result := ComCall(7, this, "ptr", Charset, "ptr", pCharsetInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @returns {HRESULT} 
     */
    IsConvertible(dwSrcEncoding, dwDstEncoding) {
        result := ComCall(8, this, "uint", dwSrcEncoding, "uint", dwDstEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertString(pdwMode, dwSrcEncoding, dwDstEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwModeMarshal, pdwMode, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertStringToUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr

        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertStringFromUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr

        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertStringReset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Pointer<BSTR>} pbstrRfc1766 
     * @returns {HRESULT} 
     */
    GetRfc1766FromLcid(Locale, pbstrRfc1766) {
        result := ComCall(13, this, "uint", Locale, "ptr", pbstrRfc1766, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLocale 
     * @param {BSTR} bstrRfc1766 
     * @returns {HRESULT} 
     */
    GetLcidFromRfc1766(pLocale, bstrRfc1766) {
        bstrRfc1766 := bstrRfc1766 is String ? BSTR.Alloc(bstrRfc1766).Value : bstrRfc1766

        pLocaleMarshal := pLocale is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pLocaleMarshal, pLocale, "ptr", bstrRfc1766, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LangId 
     * @param {Pointer<IEnumRfc1766>} ppEnumRfc1766 
     * @returns {HRESULT} 
     */
    EnumRfc1766(LangId, ppEnumRfc1766) {
        result := ComCall(15, this, "ushort", LangId, "ptr*", ppEnumRfc1766, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Integer} LangId 
     * @param {Pointer<RFC1766INFO>} pRfc1766Info 
     * @returns {HRESULT} 
     */
    GetRfc1766Info(Locale, LangId, pRfc1766Info) {
        result := ComCall(16, this, "uint", Locale, "ushort", LangId, "ptr", pRfc1766Info, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiSrcCodePage 
     * @param {Integer} uiDstCodePage 
     * @param {Integer} dwProperty 
     * @param {Pointer<IMLangConvertCharset>} ppMLangConvertCharset 
     * @returns {HRESULT} 
     */
    CreateConvertCharset(uiSrcCodePage, uiDstCodePage, dwProperty, ppMLangConvertCharset) {
        result := ComCall(17, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "ptr*", ppMLangConvertCharset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @param {IStream} pstmIn 
     * @param {IStream} pstmOut 
     * @returns {HRESULT} 
     */
    ConvertStringInIStream(pdwMode, dwFlag, lpFallBack, dwSrcEncoding, dwDstEncoding, pstmIn, pstmOut) {
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pdwModeMarshal, pdwMode, "uint", dwFlag, "ptr", lpFallBack, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pstmIn, "ptr", pstmOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @returns {HRESULT} 
     */
    ConvertStringToUnicodeEx(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize, dwFlag, lpFallBack) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @returns {HRESULT} 
     */
    ConvertStringFromUnicodeEx(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize, dwFlag, lpFallBack) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {IStream} pstmIn 
     * @param {Pointer<DetectEncodingInfo>} lpEncoding 
     * @param {Pointer<Integer>} pnScores 
     * @returns {HRESULT} 
     */
    DetectCodepageInIStream(dwFlag, dwPrefWinCodePage, pstmIn, lpEncoding, pnScores) {
        pnScoresMarshal := pnScores is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pstmIn, "ptr", lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer<DetectEncodingInfo>} lpEncoding 
     * @param {Pointer<Integer>} pnScores 
     * @returns {HRESULT} 
     */
    DetectInputCodepage(dwFlag, dwPrefWinCodePage, pSrcStr, pcSrcSize, lpEncoding, pnScores) {
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "int*" : "ptr"
        pnScoresMarshal := pnScores is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    ValidateCodePage(uiCodePage, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(23, this, "uint", uiCodePage, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Integer} lcid 
     * @param {PWSTR} lpWideCharStr 
     * @param {Integer} cchWideChar 
     * @returns {HRESULT} 
     */
    GetCodePageDescription(uiCodePage, lcid, lpWideCharStr, cchWideChar) {
        lpWideCharStr := lpWideCharStr is String ? StrPtr(lpWideCharStr) : lpWideCharStr

        result := ComCall(24, this, "uint", uiCodePage, "uint", lcid, "ptr", lpWideCharStr, "int", cchWideChar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     */
    IsCodePageInstallable(uiCodePage) {
        result := ComCall(25, this, "uint", uiCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSource 
     * @returns {HRESULT} 
     */
    SetMimeDBSource(dwSource) {
        result := ComCall(26, this, "int", dwSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnScripts 
     * @returns {HRESULT} 
     */
    GetNumberOfScripts(pnScripts) {
        pnScriptsMarshal := pnScripts is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, pnScriptsMarshal, pnScripts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} LangId 
     * @param {Pointer<IEnumScript>} ppEnumScript 
     * @returns {HRESULT} 
     */
    EnumScripts(dwFlags, LangId, ppEnumScript) {
        result := ComCall(28, this, "uint", dwFlags, "ushort", LangId, "ptr*", ppEnumScript, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} hwnd 
     * @param {Integer} dwfIODControl 
     * @returns {HRESULT} 
     */
    ValidateCodePageEx(uiCodePage, hwnd, dwfIODControl) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(29, this, "uint", uiCodePage, "ptr", hwnd, "uint", dwfIODControl, "HRESULT")
        return result
    }
}
