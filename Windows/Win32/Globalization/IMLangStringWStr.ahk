#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMLangString.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangStringWStr extends IMLangString{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangStringWStr
     * @type {Guid}
     */
    static IID => Guid("{c04d65d0-b70d-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWStr", "SetStrBufW", "GetWStr", "GetStrBufW", "LockWStr", "UnlockWStr", "SetLocale", "GetLocale"]

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetWStr(lDestPos, lDestLen, pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", lDestPos, "int", lDestLen, "ptr", pszSrc, "int", cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {IMLangStringBufW} pSrcBuf 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    SetStrBufW(lDestPos, lDestLen, pSrcBuf, pcchActual, plActualLen) {
        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lDestPos, "int", lDestLen, "ptr", pSrcBuf, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {PWSTR} pszDest 
     * @param {Integer} cchDest 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    GetWStr(lSrcPos, lSrcLen, pszDest, cchDest, pcchActual, plActualLen) {
        pszDest := pszDest is String ? StrPtr(pszDest) : pszDest

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lSrcPos, "int", lSrcLen, "ptr", pszDest, "int", cchDest, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<IMLangStringBufW>} ppDestBuf 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    GetStrBufW(lSrcPos, lSrcMaxLen, ppDestBuf, plDestLen) {
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", lSrcPos, "int", lSrcMaxLen, "ptr*", ppDestBuf, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {Integer} lFlags 
     * @param {Integer} cchRequest 
     * @param {Pointer<PWSTR>} ppszDest 
     * @param {Pointer<Integer>} pcchDest 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    LockWStr(lSrcPos, lSrcLen, lFlags, cchRequest, ppszDest, pcchDest, plDestLen) {
        ppszDestMarshal := ppszDest is VarRef ? "ptr*" : "ptr"
        pcchDestMarshal := pcchDest is VarRef ? "int*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lSrcPos, "int", lSrcLen, "int", lFlags, "int", cchRequest, ppszDestMarshal, ppszDest, pcchDestMarshal, pcchDest, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSrc 
     * @param {Integer} cchSrc 
     * @param {Pointer<Integer>} pcchActual 
     * @param {Pointer<Integer>} plActualLen 
     * @returns {HRESULT} 
     */
    UnlockWStr(pszSrc, cchSrc, pcchActual, plActualLen) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"
        plActualLenMarshal := plActualLen is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pszSrc, "int", cchSrc, pcchActualMarshal, pcchActual, plActualLenMarshal, plActualLen, "HRESULT")
        return result
    }

    /**
     * Sets an item of information in the user override portion of the current locale. This function does not set the system defaults. (ANSI)
     * @remarks
     * This function writes to the registry, where it sets values that are associated with a particular user instead of a particular application. These registry values affect the behavior of other applications run by the user. As a rule, an application should call this function only when the user has explicitly requested the changes. The registry settings should not be changed for the convenience of a single application.
     * 
     * For the <i>LCType</i> parameter, the application should set <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-use-cp-acp">LOCALE_USE_CP_ACP</a> to use the operating system ANSI code page instead of the locale code page for string translation.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     * 
     * As of Windows Vista, the <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sdate">LOCALE_SDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIME</a> constants are obsolete. Do not use these constants. Use <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-sshortdate">LOCALE_SSHORTDATE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-stime-constants">LOCALE_STIMEFORMAT</a> instead. A custom locale might not have a single, uniform separator character within the date or time format: for example, a format such as "12/31, 2006" or "03:56'23" might be valid.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines SetLocaleInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {Integer} locale 
     * @returns {HRESULT} Returns a nonzero value if successful, or 0 otherwise. To get extended error information, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which can return one of the following error codes:
     * 
     * <ul>
     * <li>ERROR_ACCESS_DISABLED_BY_POLICY. The group policy of the computer or the user has forbidden this operation.</li>
     * <li>ERROR_INVALID_ACCESS. The access code was invalid.</li>
     * <li>ERROR_INVALID_FLAGS. The values supplied for flags were not valid.</li>
     * <li>ERROR_INVALID_PARAMETER. Any of the parameter values was invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setlocaleinfoa
     */
    SetLocale(lDestPos, lDestLen, locale) {
        result := ComCall(13, this, "int", lDestPos, "int", lDestLen, "uint", locale, "HRESULT")
        return result
    }

    /**
     * Retrieves information about a locale specified by identifier. (ANSI)
     * @remarks
     * For the operation of this function, see Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getlocaleinfoex">GetLocaleInfoEx</a>.
     * 
     * <div class="alert"><b>Note</b>   Even when the <i>LCType</i> parameter is specified as LOCALE_FONTSIGNATURE, <i>cchData</i> and the function return are still TCHAR counts. The count is different for the ANSI and Unicode versions of the function. When an application calls the generic version of <b>GetLocaleInfo</b> with LOCALE_FONTSIGNATURE, <i>cchData</i> can be safely specified as sizeof(LOCALESIGNATURE) / sizeof(TCHAR).</div>
     * <div> </div>
     * The following examples deal correctly with the buffer size for non-text values:
     * 
     * 
     * ```cpp
     * int   ret;
     * CALID calid;
     * DWORD value;
     * 
     * ret = GetLocaleInfo(LOCALE_USER_DEFAULT,
     *                     LOCALE_ICALENDARTYPE | LOCALE_RETURN_NUMBER,
     *                     (LPTSTR)&value,
     *                     sizeof(value) / sizeof(TCHAR) );
     * calid = value;
     * 
     * LOCALESIGNATURE LocSig;
     * 
     * ret = GetLocaleInfo(LOCALE_USER_DEFAULT,
     *                     LOCALE_FONTSIGNATURE,
     *                     (LPWSTR)&LocSig,
     *                     sizeof(LocSig) / sizeof(TCHAR) );
     * 
     * ```
     * 
     * 
     * The ANSI string retrieved by the ANSI version of this function is translated from Unicode to ANSI based on the default ANSI code page for the locale identifier. However, if <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-use-cp-acp">LOCALE_USE_CP_ACP</a> is specified, the translation is based on the system default ANSI code page.
     * 
     * When the ANSI version of this function is used with a Unicode-only locale identifier, the function can succeed because the operating system uses the system code page. However, characters that are undefined in the system code page appear in the string as a question mark (?). 
     *       
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winnls.h header defines GetLocaleInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcMaxLen 
     * @param {Pointer<Integer>} plocale 
     * @param {Pointer<Integer>} plLocalePos 
     * @param {Pointer<Integer>} plLocaleLen 
     * @returns {HRESULT} Returns the number of characters retrieved in the locale data buffer if successful and <i>cchData</i> is a nonzero value. If the function succeeds, <i>cchData</i> is nonzero, and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-return-constants">LOCALE_RETURN_NUMBER</a> is specified, the return value is the size of the integer retrieved in the data buffer; that is, 2 for the Unicode version of the function or 4 for the ANSI version. If the function succeeds and the value of <i>cchData</i> is 0, the return value is the required size, in characters including a null character, for the locale data buffer.
     * 
     * The function returns 0 if it does not succeed. To get extended error information, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which can return one of the following error codes:
     * 
     * <ul>
     * <li>ERROR_INSUFFICIENT_BUFFER. A supplied buffer size was not large enough, or  it was incorrectly set to <b>NULL</b>. </li>
     * <li>ERROR_INVALID_FLAGS. The values supplied for flags were not valid.</li>
     * <li>ERROR_INVALID_PARAMETER. Any of the parameter values was invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getlocaleinfoa
     */
    GetLocale(lSrcPos, lSrcMaxLen, plocale, plLocalePos, plLocaleLen) {
        plocaleMarshal := plocale is VarRef ? "uint*" : "ptr"
        plLocalePosMarshal := plLocalePos is VarRef ? "int*" : "ptr"
        plLocaleLenMarshal := plLocaleLen is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "int", lSrcPos, "int", lSrcMaxLen, plocaleMarshal, plocale, plLocalePosMarshal, plLocalePos, plLocaleLenMarshal, plLocaleLen, "HRESULT")
        return result
    }
}
