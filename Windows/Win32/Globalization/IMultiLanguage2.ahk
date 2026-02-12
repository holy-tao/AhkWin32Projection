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
        result := ComCall(3, this, "uint*", &pcCodePage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(4, this, "uint", uiCodePage, "ushort", LangId, "ptr", pCodePageInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCodePageInfo
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    GetFamilyCodePage(uiCodePage) {
        result := ComCall(5, this, "uint", uiCodePage, "uint*", &puiFamilyCodePage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiFamilyCodePage
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Integer} LangId 
     * @returns {IEnumCodePage} 
     */
    EnumCodePages(grfFlags, LangId) {
        result := ComCall(6, this, "uint", grfFlags, "ushort", LangId, "ptr*", &ppEnumCodePage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumCodePage(ppEnumCodePage)
    }

    /**
     * 
     * @param {BSTR} Charset 
     * @returns {MIMECSETINFO} 
     */
    GetCharsetInfo(Charset) {
        if(Charset is String) {
            pin := BSTR.Alloc(Charset)
            Charset := pin.Value
        }

        pCharsetInfo := MIMECSETINFO()
        result := ComCall(7, this, "ptr", Charset, "ptr", pCharsetInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCharsetInfo
    }

    /**
     * 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @returns {HRESULT} 
     */
    IsConvertible(dwSrcEncoding, dwDstEncoding) {
        result := ComCall(8, this, "uint", dwSrcEncoding, "uint", dwDstEncoding, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a string-format security descriptor into a valid, functional security descriptor. (Unicode)
     * @remarks
     * If <b>ace_type</b> is ACCESS_ALLOWED_OBJECT_ACE_TYPE
     * and neither <b>object_guid</b> nor <b>inherit_object_guid</b> has a  <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> specified, then <b>ConvertStringSecurityDescriptorToSecurityDescriptor</b> converts <b>ace_type</b> to ACCESS_ALLOWED_ACE_TYPE. For information about the  <b>ace_type</b>,  <b>object_guid</b>, and <b>inherit_object_guid</b> fields, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace-strings">Ace Strings</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sddl.h header defines ConvertStringSecurityDescriptorToSecurityDescriptor as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} pdwMode 
     * @param {Integer} dwSrcEncoding 
     * @param {Integer} dwDstEncoding 
     * @param {Pointer} pSrcStr 
     * @param {Pointer<Integer>} pcSrcSize 
     * @param {Pointer} pDstStr 
     * @param {Pointer<Integer>} pcDstSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> may return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNKNOWN_REVISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SDDL revision level is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NONE_MAPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) in the input security descriptor string could not be found in an account lookup operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptorw
     */
    ConvertString(pdwMode, dwSrcEncoding, dwDstEncoding, pSrcStr, pcSrcSize, pDstStr, pcDstSize) {
        pdwModeMarshal := pdwMode is VarRef ? "uint*" : "ptr"
        pcSrcSizeMarshal := pcSrcSize is VarRef ? "uint*" : "ptr"
        pcDstSizeMarshal := pcDstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwModeMarshal, pdwMode, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(10, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(11, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertStringReset() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @returns {BSTR} 
     */
    GetRfc1766FromLcid(Locale) {
        pbstrRfc1766 := BSTR()
        result := ComCall(13, this, "uint", Locale, "ptr", pbstrRfc1766, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrRfc1766
    }

    /**
     * 
     * @param {BSTR} bstrRfc1766 
     * @returns {Integer} 
     */
    GetLcidFromRfc1766(bstrRfc1766) {
        if(bstrRfc1766 is String) {
            pin := BSTR.Alloc(bstrRfc1766)
            bstrRfc1766 := pin.Value
        }

        result := ComCall(14, this, "uint*", &pLocale := 0, "ptr", bstrRfc1766, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLocale
    }

    /**
     * 
     * @param {Integer} LangId 
     * @returns {IEnumRfc1766} 
     */
    EnumRfc1766(LangId) {
        result := ComCall(15, this, "ushort", LangId, "ptr*", &ppEnumRfc1766 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(16, this, "uint", Locale, "ushort", LangId, "ptr", pRfc1766Info, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(17, this, "uint", uiSrcCodePage, "uint", uiDstCodePage, "uint", dwProperty, "ptr*", &ppMLangConvertCharset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(18, this, pdwModeMarshal, pdwMode, "uint", dwFlag, "ptr", lpFallBack, "uint", dwSrcEncoding, "uint", dwDstEncoding, "ptr", pstmIn, "ptr", pstmOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(19, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(20, this, pdwModeMarshal, pdwMode, "uint", dwEncoding, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", pDstStr, pcDstSizeMarshal, pcDstSize, "uint", dwFlag, "ptr", lpFallBack, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(21, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pstmIn, "ptr", lpEncoding, pnScoresMarshal, pnScores, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(22, this, "uint", dwFlag, "uint", dwPrefWinCodePage, "ptr", pSrcStr, pcSrcSizeMarshal, pcSrcSize, "ptr", lpEncoding, pnScoresMarshal, pnScores, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpEncoding
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} hwnd_ 
     * @returns {HRESULT} 
     */
    ValidateCodePage(uiCodePage, hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(23, this, "uint", uiCodePage, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     */
    IsCodePageInstallable(uiCodePage) {
        result := ComCall(25, this, "uint", uiCodePage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwSource 
     * @returns {HRESULT} 
     */
    SetMimeDBSource(dwSource) {
        result := ComCall(26, this, "int", dwSource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOfScripts() {
        result := ComCall(27, this, "uint*", &pnScripts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnScripts
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} LangId 
     * @returns {IEnumScript} 
     */
    EnumScripts(dwFlags, LangId) {
        result := ComCall(28, this, "uint", dwFlags, "ushort", LangId, "ptr*", &ppEnumScript := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumScript(ppEnumScript)
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {HWND} hwnd_ 
     * @param {Integer} dwfIODControl 
     * @returns {HRESULT} 
     */
    ValidateCodePageEx(uiCodePage, hwnd_, dwfIODControl) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(29, this, "uint", uiCodePage, "ptr", hwnd_, "uint", dwfIODControl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
