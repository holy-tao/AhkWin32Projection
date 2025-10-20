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
     * 
     * @param {Pointer<UInt32>} pcCodePage 
     * @returns {HRESULT} 
     */
    GetNumberOfCodePageInfo(pcCodePage) {
        result := ComCall(3, this, "uint*", pcCodePage, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "uint", uiCodePage, "ushort", LangId, "ptr", pCodePageInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Pointer<UInt32>} puiFamilyCodePage 
     * @returns {HRESULT} 
     */
    GetFamilyCodePage(uiCodePage, puiFamilyCodePage) {
        result := ComCall(5, this, "uint", uiCodePage, "uint*", puiFamilyCodePage, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "uint", grfFlags, "ushort", LangId, "ptr", ppEnumCodePage, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "ptr", Charset, "ptr", pCharsetInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @returns {HRESULT} 
     */
    IsConvertible(dwSrcEncoding, dwDstEncoding) {
        result := ComCall(8, this, "uint", dwSrcEncoding, "uint", dwDstEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<UInt32>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<UInt32>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertString(pdwMode, dwSrcEncoding, dwDstEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        result := ComCall(9, this, "uint*", pdwMode, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<UInt32>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<UInt32>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertStringToUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr

        result := ComCall(10, this, "uint*", pdwMode, "uint", dwEncoding, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<UInt32>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<UInt32>} pcDstSize 
     * @returns {HRESULT} 
     */
    ConvertStringFromUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr

        result := ComCall(11, this, "uint*", pdwMode, "uint", dwEncoding, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertStringReset() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Pointer<BSTR>} pbstrRfc1766 
     * @returns {HRESULT} 
     */
    GetRfc1766FromLcid(Locale, pbstrRfc1766) {
        result := ComCall(13, this, "uint", Locale, "ptr", pbstrRfc1766, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLocale 
     * @param {BSTR} bstrRfc1766 
     * @returns {HRESULT} 
     */
    GetLcidFromRfc1766(pLocale, bstrRfc1766) {
        bstrRfc1766 := bstrRfc1766 is String ? BSTR.Alloc(bstrRfc1766).Value : bstrRfc1766

        result := ComCall(14, this, "uint*", pLocale, "ptr", bstrRfc1766, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LangId 
     * @param {Pointer<IEnumRfc1766>} ppEnumRfc1766 
     * @returns {HRESULT} 
     */
    EnumRfc1766(LangId, ppEnumRfc1766) {
        result := ComCall(15, this, "ushort", LangId, "ptr", ppEnumRfc1766, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(16, this, "uint", Locale, "ushort", LangId, "ptr", pRfc1766Info, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(17, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "ptr", ppMLangConvertCharset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @param {Pointer<IStream>} pstmIn 
     * @param {Pointer<IStream>} pstmOut 
     * @returns {HRESULT} 
     */
    ConvertStringInIStream(pdwMode, dwFlag, lpFallBack, dwSrcEncoding, dwDstEncoding, pstmIn, pstmOut) {
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        result := ComCall(18, this, "uint*", pdwMode, "uint", dwFlag, "ptr", lpFallBack, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pstmIn, "ptr", pstmOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<UInt32>} pcSrcSize 
     * @param {PWSTR} pDstStr 
     * @param {Pointer<UInt32>} pcDstSize 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @returns {HRESULT} 
     */
    ConvertStringToUnicodeEx(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize, dwFlag, lpFallBack) {
        pDstStr := pDstStr is String ? StrPtr(pDstStr) : pDstStr
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        result := ComCall(19, this, "uint*", pdwMode, "uint", dwEncoding, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMode 
     * @param {Integer} dwEncoding 
     * @param {PWSTR} pSrcStr 
     * @param {Pointer<UInt32>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<UInt32>} pcDstSize 
     * @param {Integer} dwFlag 
     * @param {PWSTR} lpFallBack 
     * @returns {HRESULT} 
     */
    ConvertStringFromUnicodeEx(pdwMode, dwEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize, dwFlag, lpFallBack) {
        pSrcStr := pSrcStr is String ? StrPtr(pSrcStr) : pSrcStr
        lpFallBack := lpFallBack is String ? StrPtr(lpFallBack) : lpFallBack

        result := ComCall(20, this, "uint*", pdwMode, "uint", dwEncoding, "ptr", pSrcStr, "uint*", pcSrcSize, "ptr", pDstStr, "uint*", pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {Pointer<IStream>} pstmIn 
     * @param {Pointer<DetectEncodingInfo>} lpEncoding 
     * @param {Pointer<Int32>} pnScores 
     * @returns {HRESULT} 
     */
    DetectCodepageInIStream(dwFlag, dwPrefWinCodePage, pstmIn, lpEncoding, pnScores) {
        result := ComCall(21, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pstmIn, "ptr", lpEncoding, "int*", pnScores, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Int32>} pcSrcSize 
     * @param {Pointer<DetectEncodingInfo>} lpEncoding 
     * @param {Pointer<Int32>} pnScores 
     * @returns {HRESULT} 
     */
    DetectInputCodepage(dwFlag, dwPrefWinCodePage, pSrcStr, pcSrcSize, lpEncoding, pnScores) {
        result := ComCall(22, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pSrcStr, "int*", pcSrcSize, "ptr", lpEncoding, "int*", pnScores, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(23, this, "uint", uiCodePage, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(24, this, "uint", uiCodePage, "uint", lcid, "ptr", lpWideCharStr, "int", cchWideChar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     */
    IsCodePageInstallable(uiCodePage) {
        result := ComCall(25, this, "uint", uiCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSource 
     * @returns {HRESULT} 
     */
    SetMimeDBSource(dwSource) {
        result := ComCall(26, this, "int", dwSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnScripts 
     * @returns {HRESULT} 
     */
    GetNumberOfScripts(pnScripts) {
        result := ComCall(27, this, "uint*", pnScripts, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(28, this, "uint", dwFlags, "ushort", LangId, "ptr", ppEnumScript, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(29, this, "uint", uiCodePage, "ptr", hwnd, "uint", dwfIODControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
