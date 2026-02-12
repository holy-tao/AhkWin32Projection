#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to provide configuration information that controls stemming.
 * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nn-infotech-istemmerconfig
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IStemmerConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStemmerConfig
     * @type {Guid}
     */
    static IID => Guid("{8fa0d5a7-dedf-11d0-9a61-00c04fb68bf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLocaleInfo", "GetLocaleInfo", "SetControlInfo", "GetControlInfo", "LoadExternalStemmerData"]

    /**
     * Sets locale information for the stemmer.
     * @param {Integer} dwCodePageID ANSI code page number specified at build time.
     * @param {Integer} lcid Win32 API locale identifier specified at build time.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Locale described by the parameters is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Locale described by the parameters is not supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-istemmerconfig-setlocaleinfo
     */
    SetLocaleInfo(dwCodePageID, lcid) {
        result := ComCall(3, this, "uint", dwCodePageID, "uint", lcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about a locale specified by identifier. (Unicode)
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
     * @param {Pointer<Integer>} pdwCodePageID 
     * @param {Pointer<Integer>} plcid 
     * @returns {HRESULT} Returns the number of characters retrieved in the locale data buffer if successful and <i>cchData</i> is a nonzero value. If the function succeeds, <i>cchData</i> is nonzero, and <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-return-constants">LOCALE_RETURN_NUMBER</a> is specified, the return value is the size of the integer retrieved in the data buffer; that is, 2 for the Unicode version of the function or 4 for the ANSI version. If the function succeeds and the value of <i>cchData</i> is 0, the return value is the required size, in characters including a null character, for the locale data buffer.
     * 
     * The function returns 0 if it does not succeed. To get extended error information, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which can return one of the following error codes:
     * 
     * <ul>
     * <li>ERROR_INSUFFICIENT_BUFFER. A supplied buffer size was not large enough, or  it was incorrectly set to <b>NULL</b>. </li>
     * <li>ERROR_INVALID_FLAGS. The values supplied for flags were not valid.</li>
     * <li>ERROR_INVALID_PARAMETER. Any of the parameter values was invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nf-winnls-getlocaleinfow
     */
    GetLocaleInfo(pdwCodePageID, plcid) {
        pdwCodePageIDMarshal := pdwCodePageID is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCodePageIDMarshal, pdwCodePageID, plcidMarshal, plcid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} grfStemFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfStemFlags, dwReserved) {
        result := ComCall(5, this, "uint", grfStemFlags, "uint", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgrfStemFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfStemFlags, pdwReserved) {
        pgrfStemFlagsMarshal := pgrfStemFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pgrfStemFlagsMarshal, pgrfStemFlags, pdwReservedMarshal, pdwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwExtDataType 
     * @returns {HRESULT} 
     */
    LoadExternalStemmerData(pStream, dwExtDataType) {
        result := ComCall(7, this, "ptr", pStream, "uint", dwExtDataType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
