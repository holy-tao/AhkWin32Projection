#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Foundation\BSTR.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMultiLanguage extends IUnknown{
    /**
     * The interface identifier for IMultiLanguage
     * @type {Guid}
     */
    static IID => Guid("{275c23e1-3747-11d0-9fea-00aa003f8646}")

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
     * @param {Pointer<MIMECPINFO>} pCodePageInfo 
     * @returns {HRESULT} 
     */
    GetCodePageInfo(uiCodePage, pCodePageInfo) {
        result := ComCall(4, this, "uint", uiCodePage, "ptr", pCodePageInfo, "int")
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
     * @param {Pointer<IEnumCodePage>} ppEnumCodePage 
     * @returns {HRESULT} 
     */
    EnumCodePages(grfFlags, ppEnumCodePage) {
        result := ComCall(6, this, "uint", grfFlags, "ptr", ppEnumCodePage, "int")
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
     * @param {Pointer<IEnumRfc1766>} ppEnumRfc1766 
     * @returns {HRESULT} 
     */
    EnumRfc1766(ppEnumRfc1766) {
        result := ComCall(15, this, "ptr", ppEnumRfc1766, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Pointer<RFC1766INFO>} pRfc1766Info 
     * @returns {HRESULT} 
     */
    GetRfc1766Info(Locale, pRfc1766Info) {
        result := ComCall(16, this, "uint", Locale, "ptr", pRfc1766Info, "int")
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
}
