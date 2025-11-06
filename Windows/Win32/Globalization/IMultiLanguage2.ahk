#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Foundation\BSTR.ahk
#Include .\MIMECPINFO.ahk
#Include .\IEnumCodePage.ahk
#Include .\MIMECSETINFO.ahk
#Include .\IEnumRfc1766.ahk
#Include .\RFC1766INFO.ahk
#Include .\IMLangConvertCharset.ahk
#Include .\DetectEncodingInfo.ahk
#Include .\IEnumScript.ahk
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
     * @returns {Integer} 
     */
    GetNumberOfCodePageInfo() {
        result := ComCall(3, this, "uint*", &pcCodePage := 0, "HRESULT")
        return pcCodePage
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Integer} LangId 
     * @returns {MIMECPINFO} 
     */
    GetCodePageInfo(uiCodePage, LangId) {
        pCodePageInfo := MIMECPINFO()
        result := ComCall(4, this, "uint", uiCodePage, "ushort", LangId, "ptr", pCodePageInfo, "HRESULT")
        return pCodePageInfo
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    GetFamilyCodePage(uiCodePage) {
        result := ComCall(5, this, "uint", uiCodePage, "uint*", &puiFamilyCodePage := 0, "HRESULT")
        return puiFamilyCodePage
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Integer} LangId 
     * @returns {IEnumCodePage} 
     */
    EnumCodePages(grfFlags, LangId) {
        result := ComCall(6, this, "uint", grfFlags, "ushort", LangId, "ptr*", &ppEnumCodePage := 0, "HRESULT")
        return IEnumCodePage(ppEnumCodePage)
    }

    /**
     * 
     * @param {BSTR} Charset 
     * @returns {MIMECSETINFO} 
     */
    GetCharsetInfo(Charset) {
        Charset := Charset is String ? BSTR.Alloc(Charset).Value : Charset

        pCharsetInfo := MIMECSETINFO()
        result := ComCall(7, this, "ptr", Charset, "ptr", pCharsetInfo, "HRESULT")
        return pCharsetInfo
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
     * @returns {BSTR} 
     */
    GetRfc1766FromLcid(Locale) {
        pbstrRfc1766 := BSTR()
        result := ComCall(13, this, "uint", Locale, "ptr", pbstrRfc1766, "HRESULT")
        return pbstrRfc1766
    }

    /**
     * 
     * @param {BSTR} bstrRfc1766 
     * @returns {Integer} 
     */
    GetLcidFromRfc1766(bstrRfc1766) {
        bstrRfc1766 := bstrRfc1766 is String ? BSTR.Alloc(bstrRfc1766).Value : bstrRfc1766

        result := ComCall(14, this, "uint*", &pLocale := 0, "ptr", bstrRfc1766, "HRESULT")
        return pLocale
    }

    /**
     * 
     * @param {Integer} LangId 
     * @returns {IEnumRfc1766} 
     */
    EnumRfc1766(LangId) {
        result := ComCall(15, this, "ushort", LangId, "ptr*", &ppEnumRfc1766 := 0, "HRESULT")
        return IEnumRfc1766(ppEnumRfc1766)
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Integer} LangId 
     * @returns {RFC1766INFO} 
     */
    GetRfc1766Info(Locale, LangId) {
        pRfc1766Info := RFC1766INFO()
        result := ComCall(16, this, "uint", Locale, "ushort", LangId, "ptr", pRfc1766Info, "HRESULT")
        return pRfc1766Info
    }

    /**
     * 
     * @param {Integer} uiSrcCodePage 
     * @param {Integer} uiDstCodePage 
     * @param {Integer} dwProperty 
     * @returns {IMLangConvertCharset} 
     */
    CreateConvertCharset(uiSrcCodePage, uiDstCodePage, dwProperty) {
        result := ComCall(17, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "ptr*", &ppMLangConvertCharset := 0, "HRESULT")
        return IMLangConvertCharset(ppMLangConvertCharset)
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
     * @param {Pointer<Integer>} pnScores 
     * @returns {DetectEncodingInfo} 
     */
    DetectCodepageInIStream(dwFlag, dwPrefWinCodePage, pstmIn, pnScores) {
        pnScoresMarshal := pnScores is VarRef ? "int*" : "ptr"

        lpEncoding := DetectEncodingInfo()
        result := ComCall(21, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pstmIn, "ptr", lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return lpEncoding
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer<Integer>} pnScores 
     * @returns {DetectEncodingInfo} 
     */
    DetectInputCodepage(dwFlag, dwPrefWinCodePage, pSrcStr, pcSrcSize, pnScores) {
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "int*" : "ptr"
        pnScoresMarshal := pnScores is VarRef ? "int*" : "ptr"

        lpEncoding := DetectEncodingInfo()
        result := ComCall(22, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return lpEncoding
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
     * @returns {Integer} 
     */
    GetNumberOfScripts() {
        result := ComCall(27, this, "uint*", &pnScripts := 0, "HRESULT")
        return pnScripts
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} LangId 
     * @returns {IEnumScript} 
     */
    EnumScripts(dwFlags, LangId) {
        result := ComCall(28, this, "uint", dwFlags, "ushort", LangId, "ptr*", &ppEnumScript := 0, "HRESULT")
        return IEnumScript(ppEnumScript)
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
