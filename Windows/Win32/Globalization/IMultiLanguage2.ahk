#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMLangConvertCharset.ahk" { IMLangConvertCharset }
#Import ".\RFC1766INFO.ahk" { RFC1766INFO }
#Import ".\IEnumRfc1766.ahk" { IEnumRfc1766 }
#Import "..\Foundation\HWND.ahk" { HWND }
#Import ".\MIMECPINFO.ahk" { MIMECPINFO }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IStream.ahk" { IStream }
#Import ".\MIMECONTF.ahk" { MIMECONTF }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MIMECSETINFO.ahk" { MIMECSETINFO }
#Import ".\IEnumScript.ahk" { IEnumScript }
#Import ".\DetectEncodingInfo.ahk" { DetectEncodingInfo }
#Import ".\IEnumCodePage.ahk" { IEnumCodePage }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMultiLanguage2 extends IUnknown {
    /**
     * The interface identifier for IMultiLanguage2
     * @type {Guid}
     */
    static IID := Guid("{dccfc164-2b38-11d2-b7ec-00c04f8f5d9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultiLanguage2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberOfCodePageInfo    : IntPtr
        GetCodePageInfo            : IntPtr
        GetFamilyCodePage          : IntPtr
        EnumCodePages              : IntPtr
        GetCharsetInfo             : IntPtr
        IsConvertible              : IntPtr
        ConvertString              : IntPtr
        ConvertStringToUnicode     : IntPtr
        ConvertStringFromUnicode   : IntPtr
        ConvertStringReset         : IntPtr
        GetRfc1766FromLcid         : IntPtr
        GetLcidFromRfc1766         : IntPtr
        EnumRfc1766                : IntPtr
        GetRfc1766Info             : IntPtr
        CreateConvertCharset       : IntPtr
        ConvertStringInIStream     : IntPtr
        ConvertStringToUnicodeEx   : IntPtr
        ConvertStringFromUnicodeEx : IntPtr
        DetectCodepageInIStream    : IntPtr
        DetectInputCodepage        : IntPtr
        ValidateCodePage           : IntPtr
        GetCodePageDescription     : IntPtr
        IsCodePageInstallable      : IntPtr
        SetMimeDBSource            : IntPtr
        GetNumberOfScripts         : IntPtr
        EnumScripts                : IntPtr
        ValidateCodePageEx         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultiLanguage2.Vtbl()
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
     * @param {Integer} LangId 
     * @returns {MIMECPINFO} 
     */
    GetCodePageInfo(uiCodePage, LangId) {
        pCodePageInfo := MIMECPINFO()
        result := ComCall(4, this, UInt32, uiCodePage, UInt16, LangId, MIMECPINFO.Ptr, pCodePageInfo, "HRESULT")
        return pCodePageInfo
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    GetFamilyCodePage(uiCodePage) {
        result := ComCall(5, this, UInt32, uiCodePage, "uint*", &puiFamilyCodePage := 0, "HRESULT")
        return puiFamilyCodePage
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Integer} LangId 
     * @returns {IEnumCodePage} 
     */
    EnumCodePages(grfFlags, LangId) {
        result := ComCall(6, this, UInt32, grfFlags, UInt16, LangId, "ptr*", &ppEnumCodePage := 0, "HRESULT")
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
        result := ComCall(8, this, UInt32, dwSrcEncoding, UInt32, dwDstEncoding, "HRESULT")
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

        result := ComCall(9, this, pdwModeMarshal, pdwMode, UInt32, dwSrcEncoding, UInt32, dwDstEncoding, IntPtr, pSrcStr, pcSrcSizeMarshal, pcSrcSize, IntPtr, pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
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

        result := ComCall(10, this, pdwModeMarshal, pdwMode, UInt32, dwEncoding, IntPtr, pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
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

        result := ComCall(11, this, pdwModeMarshal, pdwMode, UInt32, dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, IntPtr, pDstStr, pcDstSizeMarshal, pcDstSize, "HRESULT")
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
        result := ComCall(13, this, UInt32, Locale, BSTR.Ptr, pbstrRfc1766, "HRESULT")
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
     * @param {Integer} LangId 
     * @returns {IEnumRfc1766} 
     */
    EnumRfc1766(LangId) {
        result := ComCall(15, this, UInt16, LangId, "ptr*", &ppEnumRfc1766 := 0, "HRESULT")
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
        result := ComCall(16, this, UInt32, Locale, UInt16, LangId, RFC1766INFO.Ptr, pRfc1766Info, "HRESULT")
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
        result := ComCall(17, this, UInt32, uiSrcCodePage, UInt32, uiDstCodePage, UInt32, dwProperty, "ptr*", &ppMLangConvertCharset := 0, "HRESULT")
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

        result := ComCall(18, this, pdwModeMarshal, pdwMode, UInt32, dwFlag, "ptr", lpFallBack, UInt32, dwSrcEncoding, UInt32, dwDstEncoding, "ptr", pstmIn, "ptr", pstmOut, "HRESULT")
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

        result := ComCall(19, this, pdwModeMarshal, pdwMode, UInt32, dwEncoding, IntPtr, pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, UInt32, dwFlag, "ptr", lpFallBack, "HRESULT")
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

        result := ComCall(20, this, pdwModeMarshal, pdwMode, UInt32, dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, IntPtr, pDstStr, pcDstSizeMarshal, pcDstSize, UInt32, dwFlag, "ptr", lpFallBack, "HRESULT")
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
        result := ComCall(21, this, UInt32, dwFlag, UInt32, dwPrefWinCodePage, "ptr", pstmIn, DetectEncodingInfo.Ptr, lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return lpEncoding
    }

    /**
     * 
     * @param {Integer} dwFlag 
     * @param {Integer} dwPrefWinCodePage 
     * @param {Integer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer<Integer>} pnScores 
     * @returns {DetectEncodingInfo} 
     */
    DetectInputCodepage(dwFlag, dwPrefWinCodePage, pSrcStr, pcSrcSize, pnScores) {
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "int*" : "ptr"
        pnScoresMarshal := pnScores is VarRef ? "int*" : "ptr"

        lpEncoding := DetectEncodingInfo()
        result := ComCall(22, this, UInt32, dwFlag, UInt32, dwPrefWinCodePage, IntPtr, pSrcStr, pcSrcSizeMarshal, pcSrcSize, DetectEncodingInfo.Ptr, lpEncoding, pnScoresMarshal, pnScores, "HRESULT")
        return lpEncoding
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    ValidateCodePage(uiCodePage, _hwnd) {
        result := ComCall(23, this, UInt32, uiCodePage, HWND, _hwnd, "HRESULT")
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

        result := ComCall(24, this, UInt32, uiCodePage, UInt32, lcid, "ptr", lpWideCharStr, Int32, cchWideChar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     */
    IsCodePageInstallable(uiCodePage) {
        result := ComCall(25, this, UInt32, uiCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MIMECONTF} dwSource 
     * @returns {HRESULT} 
     */
    SetMimeDBSource(dwSource) {
        result := ComCall(26, this, MIMECONTF, dwSource, "HRESULT")
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
        result := ComCall(28, this, UInt32, dwFlags, UInt16, LangId, "ptr*", &ppEnumScript := 0, "HRESULT")
        return IEnumScript(ppEnumScript)
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} _hwnd 
     * @param {Integer} dwfIODControl 
     * @returns {HRESULT} 
     */
    ValidateCodePageEx(uiCodePage, _hwnd, dwfIODControl) {
        result := ComCall(29, this, UInt32, uiCodePage, HWND, _hwnd, UInt32, dwfIODControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMultiLanguage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberOfCodePageInfo := CallbackCreate(GetMethod(implObj, "GetNumberOfCodePageInfo"), flags, 2)
        this.vtbl.GetCodePageInfo := CallbackCreate(GetMethod(implObj, "GetCodePageInfo"), flags, 4)
        this.vtbl.GetFamilyCodePage := CallbackCreate(GetMethod(implObj, "GetFamilyCodePage"), flags, 3)
        this.vtbl.EnumCodePages := CallbackCreate(GetMethod(implObj, "EnumCodePages"), flags, 4)
        this.vtbl.GetCharsetInfo := CallbackCreate(GetMethod(implObj, "GetCharsetInfo"), flags, 3)
        this.vtbl.IsConvertible := CallbackCreate(GetMethod(implObj, "IsConvertible"), flags, 3)
        this.vtbl.ConvertString := CallbackCreate(GetMethod(implObj, "ConvertString"), flags, 8)
        this.vtbl.ConvertStringToUnicode := CallbackCreate(GetMethod(implObj, "ConvertStringToUnicode"), flags, 7)
        this.vtbl.ConvertStringFromUnicode := CallbackCreate(GetMethod(implObj, "ConvertStringFromUnicode"), flags, 7)
        this.vtbl.ConvertStringReset := CallbackCreate(GetMethod(implObj, "ConvertStringReset"), flags, 1)
        this.vtbl.GetRfc1766FromLcid := CallbackCreate(GetMethod(implObj, "GetRfc1766FromLcid"), flags, 3)
        this.vtbl.GetLcidFromRfc1766 := CallbackCreate(GetMethod(implObj, "GetLcidFromRfc1766"), flags, 3)
        this.vtbl.EnumRfc1766 := CallbackCreate(GetMethod(implObj, "EnumRfc1766"), flags, 3)
        this.vtbl.GetRfc1766Info := CallbackCreate(GetMethod(implObj, "GetRfc1766Info"), flags, 4)
        this.vtbl.CreateConvertCharset := CallbackCreate(GetMethod(implObj, "CreateConvertCharset"), flags, 5)
        this.vtbl.ConvertStringInIStream := CallbackCreate(GetMethod(implObj, "ConvertStringInIStream"), flags, 8)
        this.vtbl.ConvertStringToUnicodeEx := CallbackCreate(GetMethod(implObj, "ConvertStringToUnicodeEx"), flags, 9)
        this.vtbl.ConvertStringFromUnicodeEx := CallbackCreate(GetMethod(implObj, "ConvertStringFromUnicodeEx"), flags, 9)
        this.vtbl.DetectCodepageInIStream := CallbackCreate(GetMethod(implObj, "DetectCodepageInIStream"), flags, 6)
        this.vtbl.DetectInputCodepage := CallbackCreate(GetMethod(implObj, "DetectInputCodepage"), flags, 7)
        this.vtbl.ValidateCodePage := CallbackCreate(GetMethod(implObj, "ValidateCodePage"), flags, 3)
        this.vtbl.GetCodePageDescription := CallbackCreate(GetMethod(implObj, "GetCodePageDescription"), flags, 5)
        this.vtbl.IsCodePageInstallable := CallbackCreate(GetMethod(implObj, "IsCodePageInstallable"), flags, 2)
        this.vtbl.SetMimeDBSource := CallbackCreate(GetMethod(implObj, "SetMimeDBSource"), flags, 2)
        this.vtbl.GetNumberOfScripts := CallbackCreate(GetMethod(implObj, "GetNumberOfScripts"), flags, 2)
        this.vtbl.EnumScripts := CallbackCreate(GetMethod(implObj, "EnumScripts"), flags, 4)
        this.vtbl.ValidateCodePageEx := CallbackCreate(GetMethod(implObj, "ValidateCodePageEx"), flags, 4)
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
        CallbackFree(this.vtbl.ConvertStringInIStream)
        CallbackFree(this.vtbl.ConvertStringToUnicodeEx)
        CallbackFree(this.vtbl.ConvertStringFromUnicodeEx)
        CallbackFree(this.vtbl.DetectCodepageInIStream)
        CallbackFree(this.vtbl.DetectInputCodepage)
        CallbackFree(this.vtbl.ValidateCodePage)
        CallbackFree(this.vtbl.GetCodePageDescription)
        CallbackFree(this.vtbl.IsCodePageInstallable)
        CallbackFree(this.vtbl.SetMimeDBSource)
        CallbackFree(this.vtbl.GetNumberOfScripts)
        CallbackFree(this.vtbl.EnumScripts)
        CallbackFree(this.vtbl.ValidateCodePageEx)
    }
}
