#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Search\IStemmer.ahk" { IStemmer }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct IWordBreakerConfig extends IUnknown {
    /**
     * The interface identifier for IWordBreakerConfig
     * @type {Guid}
     */
    static IID := Guid("{8fa0d5a6-dedf-11d0-9a61-00c04fb68bf7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWordBreakerConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetLocaleInfo           : IntPtr
        GetLocaleInfo           : IntPtr
        SetBreakWordType        : IntPtr
        GetBreakWordType        : IntPtr
        SetControlInfo          : IntPtr
        GetControlInfo          : IntPtr
        LoadExternalBreakerData : IntPtr
        SetWordStemmer          : IntPtr
        GetWordStemmer          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWordBreakerConfig.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @param {Integer} dwCodePageID 
     * @param {Integer} lcid 
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
    SetLocaleInfo(dwCodePageID, lcid) {
        result := ComCall(3, this, "uint", dwCodePageID, "uint", lcid, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getlocaleinfoa
     */
    GetLocaleInfo(pdwCodePageID, plcid) {
        pdwCodePageIDMarshal := pdwCodePageID is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCodePageIDMarshal, pdwCodePageID, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBreakWordType 
     * @returns {HRESULT} 
     */
    SetBreakWordType(dwBreakWordType) {
        result := ComCall(5, this, "uint", dwBreakWordType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBreakWordType 
     * @returns {HRESULT} 
     */
    GetBreakWordType(pdwBreakWordType) {
        pdwBreakWordTypeMarshal := pdwBreakWordType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwBreakWordTypeMarshal, pdwBreakWordType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBreakFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfBreakFlags, dwReserved) {
        result := ComCall(7, this, "uint", grfBreakFlags, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgrfBreakFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfBreakFlags, pdwReserved) {
        pgrfBreakFlagsMarshal := pgrfBreakFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pgrfBreakFlagsMarshal, pgrfBreakFlags, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwExtDataType 
     * @returns {HRESULT} 
     */
    LoadExternalBreakerData(pStream, dwExtDataType) {
        result := ComCall(9, this, "ptr", pStream, "uint", dwExtDataType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IStemmer} pStemmer 
     * @returns {HRESULT} 
     */
    SetWordStemmer(rclsid, pStemmer) {
        result := ComCall(10, this, Guid.Ptr, rclsid, "ptr", pStemmer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IStemmer} 
     */
    GetWordStemmer() {
        result := ComCall(11, this, "ptr*", &ppStemmer := 0, "HRESULT")
        return IStemmer(ppStemmer)
    }

    Query(iid) {
        if (IWordBreakerConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLocaleInfo := CallbackCreate(GetMethod(implObj, "SetLocaleInfo"), flags, 3)
        this.vtbl.GetLocaleInfo := CallbackCreate(GetMethod(implObj, "GetLocaleInfo"), flags, 3)
        this.vtbl.SetBreakWordType := CallbackCreate(GetMethod(implObj, "SetBreakWordType"), flags, 2)
        this.vtbl.GetBreakWordType := CallbackCreate(GetMethod(implObj, "GetBreakWordType"), flags, 2)
        this.vtbl.SetControlInfo := CallbackCreate(GetMethod(implObj, "SetControlInfo"), flags, 3)
        this.vtbl.GetControlInfo := CallbackCreate(GetMethod(implObj, "GetControlInfo"), flags, 3)
        this.vtbl.LoadExternalBreakerData := CallbackCreate(GetMethod(implObj, "LoadExternalBreakerData"), flags, 3)
        this.vtbl.SetWordStemmer := CallbackCreate(GetMethod(implObj, "SetWordStemmer"), flags, 3)
        this.vtbl.GetWordStemmer := CallbackCreate(GetMethod(implObj, "GetWordStemmer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLocaleInfo)
        CallbackFree(this.vtbl.GetLocaleInfo)
        CallbackFree(this.vtbl.SetBreakWordType)
        CallbackFree(this.vtbl.GetBreakWordType)
        CallbackFree(this.vtbl.SetControlInfo)
        CallbackFree(this.vtbl.GetControlInfo)
        CallbackFree(this.vtbl.LoadExternalBreakerData)
        CallbackFree(this.vtbl.SetWordStemmer)
        CallbackFree(this.vtbl.GetWordStemmer)
    }
}
