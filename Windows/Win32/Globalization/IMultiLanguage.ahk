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
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMultiLanguage extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfCodePageInfo", "GetCodePageInfo", "GetFamilyCodePage", "EnumCodePages", "GetCharsetInfo", "IsConvertible", "ConvertString", "ConvertStringToUnicode", "ConvertStringFromUnicode", "ConvertStringReset", "GetRfc1766FromLcid", "GetLcidFromRfc1766", "EnumRfc1766", "GetRfc1766Info", "CreateConvertCharset"]

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
     * @returns {MIMECPINFO} 
     */
    GetCodePageInfo(uiCodePage) {
        pCodePageInfo := MIMECPINFO()
        result := ComCall(4, this, "uint", uiCodePage, "ptr", pCodePageInfo, "HRESULT")
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
     * @returns {IEnumCodePage} 
     */
    EnumCodePages(grfFlags) {
        result := ComCall(6, this, "uint", grfFlags, "ptr*", &ppEnumCodePage := 0, "HRESULT")
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
     * @returns {IEnumRfc1766} 
     */
    EnumRfc1766() {
        result := ComCall(15, this, "ptr*", &ppEnumRfc1766 := 0, "HRESULT")
        return IEnumRfc1766(ppEnumRfc1766)
    }

    /**
     * 
     * @param {Integer} Locale 
     * @returns {RFC1766INFO} 
     */
    GetRfc1766Info(Locale) {
        pRfc1766Info := RFC1766INFO()
        result := ComCall(16, this, "uint", Locale, "ptr", pRfc1766Info, "HRESULT")
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
}
