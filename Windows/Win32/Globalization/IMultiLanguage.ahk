#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumRfc1766.ahk" { IEnumRfc1766 }
#Import "..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RFC1766INFO.ahk" { RFC1766INFO }
#Import ".\IMLangConvertCharset.ahk" { IMLangConvertCharset }
#Import ".\IEnumCodePage.ahk" { IEnumCodePage }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MIMECPINFO.ahk" { MIMECPINFO }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MIMECSETINFO.ahk" { MIMECSETINFO }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMultiLanguage extends IUnknown {
    /**
     * The interface identifier for IMultiLanguage
     * @type {Guid}
     */
    static IID := Guid("{275c23e1-3747-11d0-9fea-00aa003f8646}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultiLanguage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberOfCodePageInfo  : IntPtr
        GetCodePageInfo          : IntPtr
        GetFamilyCodePage        : IntPtr
        EnumCodePages            : IntPtr
        GetCharsetInfo           : IntPtr
        IsConvertible            : IntPtr
        ConvertString            : IntPtr
        ConvertStringToUnicode   : IntPtr
        ConvertStringFromUnicode : IntPtr
        ConvertStringReset       : IntPtr
        GetRfc1766FromLcid       : IntPtr
        GetLcidFromRfc1766       : IntPtr
        EnumRfc1766              : IntPtr
        GetRfc1766Info           : IntPtr
        CreateConvertCharset     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultiLanguage.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(4, this, "uint", uiCodePage, MIMECPINFO.Ptr, pCodePageInfo, "HRESULT")
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
        result := ComCall(7, this, BSTR, Charset, MIMECSETINFO.Ptr, pCharsetInfo, "HRESULT")
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
     * @param {Integer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Integer} pDstStr 
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
     * @param {Integer} pSrcStr 
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
     * @param {Integer} pDstStr 
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
        pbstrRfc1766 := BSTR.Owned()
        result := ComCall(13, this, "uint", Locale, BSTR.Ptr, pbstrRfc1766, "HRESULT")
        return pbstrRfc1766
    }

    /**
     * 
     * @param {BSTR} bstrRfc1766 
     * @returns {Integer} 
     */
    GetLcidFromRfc1766(bstrRfc1766) {
        bstrRfc1766 := bstrRfc1766 is String ? BSTR.Alloc(bstrRfc1766).Value : bstrRfc1766

        result := ComCall(14, this, "uint*", &pLocale := 0, BSTR, bstrRfc1766, "HRESULT")
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
        result := ComCall(16, this, "uint", Locale, RFC1766INFO.Ptr, pRfc1766Info, "HRESULT")
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

    Query(iid) {
        if (IMultiLanguage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberOfCodePageInfo := CallbackCreate(GetMethod(implObj, "GetNumberOfCodePageInfo"), flags, 2)
        this.vtbl.GetCodePageInfo := CallbackCreate(GetMethod(implObj, "GetCodePageInfo"), flags, 3)
        this.vtbl.GetFamilyCodePage := CallbackCreate(GetMethod(implObj, "GetFamilyCodePage"), flags, 3)
        this.vtbl.EnumCodePages := CallbackCreate(GetMethod(implObj, "EnumCodePages"), flags, 3)
        this.vtbl.GetCharsetInfo := CallbackCreate(GetMethod(implObj, "GetCharsetInfo"), flags, 3)
        this.vtbl.IsConvertible := CallbackCreate(GetMethod(implObj, "IsConvertible"), flags, 3)
        this.vtbl.ConvertString := CallbackCreate(GetMethod(implObj, "ConvertString"), flags, 8)
        this.vtbl.ConvertStringToUnicode := CallbackCreate(GetMethod(implObj, "ConvertStringToUnicode"), flags, 7)
        this.vtbl.ConvertStringFromUnicode := CallbackCreate(GetMethod(implObj, "ConvertStringFromUnicode"), flags, 7)
        this.vtbl.ConvertStringReset := CallbackCreate(GetMethod(implObj, "ConvertStringReset"), flags, 1)
        this.vtbl.GetRfc1766FromLcid := CallbackCreate(GetMethod(implObj, "GetRfc1766FromLcid"), flags, 3)
        this.vtbl.GetLcidFromRfc1766 := CallbackCreate(GetMethod(implObj, "GetLcidFromRfc1766"), flags, 3)
        this.vtbl.EnumRfc1766 := CallbackCreate(GetMethod(implObj, "EnumRfc1766"), flags, 2)
        this.vtbl.GetRfc1766Info := CallbackCreate(GetMethod(implObj, "GetRfc1766Info"), flags, 3)
        this.vtbl.CreateConvertCharset := CallbackCreate(GetMethod(implObj, "CreateConvertCharset"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberOfCodePageInfo)
        CallbackFree(this.vtbl.GetCodePageInfo)
        CallbackFree(this.vtbl.GetFamilyCodePage)
        CallbackFree(this.vtbl.EnumCodePages)
        CallbackFree(this.vtbl.GetCharsetInfo)
        CallbackFree(this.vtbl.IsConvertible)
        CallbackFree(this.vtbl.ConvertString)
        CallbackFree(this.vtbl.ConvertStringToUnicode)
        CallbackFree(this.vtbl.ConvertStringFromUnicode)
        CallbackFree(this.vtbl.ConvertStringReset)
        CallbackFree(this.vtbl.GetRfc1766FromLcid)
        CallbackFree(this.vtbl.GetLcidFromRfc1766)
        CallbackFree(this.vtbl.EnumRfc1766)
        CallbackFree(this.vtbl.GetRfc1766Info)
        CallbackFree(this.vtbl.CreateConvertCharset)
    }
}
