#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\GOPHER_FIND_DATAA.ahk" { GOPHER_FIND_DATAA }
#Import ".\URLCACHE_ENTRY_INFO.ahk" { URLCACHE_ENTRY_INFO }
#Import "..\WinHttp\WIN_HTTP_CREATE_URL_FLAGS.ahk" { WIN_HTTP_CREATE_URL_FLAGS }
#Import ".\INTERNET_BUFFERSW.ahk" { INTERNET_BUFFERSW }
#Import "..\..\Security\Cryptography\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import ".\INTERNET_CACHE_GROUP_INFOA.ahk" { INTERNET_CACHE_GROUP_INFOA }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\INTERNET_SCHEME.ahk" { INTERNET_SCHEME }
#Import "..\..\Storage\FileSystem\WIN32_FIND_DATAW.ahk" { WIN32_FIND_DATAW }
#Import ".\HTTP_PUSH_NOTIFICATION_STATUS.ahk" { HTTP_PUSH_NOTIFICATION_STATUS }
#Import ".\HTTP_PUSH_WAIT_HANDLE.ahk" { HTTP_PUSH_WAIT_HANDLE }
#Import ".\PROXY_AUTO_DETECT_TYPE.ahk" { PROXY_AUTO_DETECT_TYPE }
#Import ".\INTERNET_COOKIE_FLAGS.ahk" { INTERNET_COOKIE_FLAGS }
#Import ".\INTERNET_CONNECTION.ahk" { INTERNET_CONNECTION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\INTERNET_SECURITY_INFO.ahk" { INTERNET_SECURITY_INFO }
#Import ".\WPAD_CACHE_DELETE.ahk" { WPAD_CACHE_DELETE }
#Import ".\APP_CACHE_GROUP_LIST.ahk" { APP_CACHE_GROUP_LIST }
#Import ".\INTERNET_CACHE_GROUP_INFOW.ahk" { INTERNET_CACHE_GROUP_INFOW }
#Import "..\..\Security\Cryptography\ALG_ID.ahk" { ALG_ID }
#Import ".\APP_CACHE_FINALIZE_STATE.ahk" { APP_CACHE_FINALIZE_STATE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\URL_COMPONENTSW.ahk" { URL_COMPONENTSW }
#Import ".\HTTP_PUSH_WAIT_TYPE.ahk" { HTTP_PUSH_WAIT_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CACHE_CONFIG.ahk" { CACHE_CONFIG }
#Import "..\..\Storage\FileSystem\WIN32_FIND_DATAA.ahk" { WIN32_FIND_DATAA }
#Import ".\INTERNET_CACHE_CONFIG_INFOW.ahk" { INTERNET_CACHE_CONFIG_INFOW }
#Import ".\APP_CACHE_GROUP_INFO.ahk" { APP_CACHE_GROUP_INFO }
#Import ".\INTERNET_BUFFERSA.ahk" { INTERNET_BUFFERSA }
#Import ".\INTERNET_CACHE_ENTRY_INFOW.ahk" { INTERNET_CACHE_ENTRY_INFOW }
#Import ".\INTERNET_AUTODIAL.ahk" { INTERNET_AUTODIAL }
#Import ".\GOPHER_FIND_DATAW.ahk" { GOPHER_FIND_DATAW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INTERNET_CACHE_CONFIG_INFOA.ahk" { INTERNET_CACHE_CONFIG_INFOA }
#Import ".\HTTP_ADDREQ_FLAG.ahk" { HTTP_ADDREQ_FLAG }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\INTERNET_CACHE_ENTRY_INFOA.ahk" { INTERNET_CACHE_ENTRY_INFOA }
#Import ".\APP_CACHE_STATE.ahk" { APP_CACHE_STATE }
#Import ".\HTTP_WEB_SOCKET_BUFFER_TYPE.ahk" { HTTP_WEB_SOCKET_BUFFER_TYPE }
#Import ".\HTTP_PUSH_TRANSPORT_SETTING.ahk" { HTTP_PUSH_TRANSPORT_SETTING }
#Import ".\WININET_PROXY_INFO_LIST.ahk" { WININET_PROXY_INFO_LIST }
#Import ".\URL_COMPONENTSA.ahk" { URL_COMPONENTSA }
#Import ".\FTP_FLAGS.ahk" { FTP_FLAGS }
#Import ".\APP_CACHE_DOWNLOAD_LIST.ahk" { APP_CACHE_DOWNLOAD_LIST }
#Import ".\INTERNET_COOKIE2.ahk" { INTERNET_COOKIE2 }
#Import ".\URL_CACHE_LIMIT_TYPE.ahk" { URL_CACHE_LIMIT_TYPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */

;@region Functions
/**
 * Formats a date and time according to the HTTP version 1.0 specification. (InternetTimeFromSystemTimeA)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetTimeFromSystemTime as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
 * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
 * @param {Integer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
 * @param {Integer} cbTime Size of the 
 * <i>lpszTime</i> buffer, in bytes.
 * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimefromsystemtimea
 * @since windows5.0
 */
export InternetTimeFromSystemTimeA(pst, dwRFC, lpszTime, cbTime) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeFromSystemTimeA", SYSTEMTIME.Ptr, pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetTimeFromSystemTimeW (Unicode) function (wininet.h) formats a date and time according to the HTTP version 1.0 specification.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetTimeFromSystemTime as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
 * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
 * @param {Integer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
 * @param {Integer} cbTime Size of the 
 * <i>lpszTime</i> buffer, in bytes.
 * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimefromsystemtimew
 * @since windows5.0
 */
export InternetTimeFromSystemTimeW(pst, dwRFC, lpszTime, cbTime) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeFromSystemTimeW", SYSTEMTIME.Ptr, pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetTimeFromSystemTime function (wininet.h) formats a date and time according to the HTTP version 1.0 specification.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
 * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
 * @param {Integer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
 * @param {Integer} cbTime Size of the 
 * <i>lpszTime</i> buffer, in bytes.
 * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimefromsystemtime
 * @since windows5.0
 */
export InternetTimeFromSystemTime(pst, dwRFC, lpszTime, cbTime) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeFromSystemTime", SYSTEMTIME.Ptr, pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Converts an HTTP time/date string to a SYSTEMTIME structure. (InternetTimeToSystemTimeA)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetTimeToSystemTime as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
 * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimetosystemtimea
 * @since windows5.0
 */
export InternetTimeToSystemTimeA(lpszTime, pst) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeToSystemTimeA", "ptr", lpszTime, SYSTEMTIME.Ptr, pst, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetTimeToSystemTimeW (Unicode) function (wininet.h) converts an HTTP time/date string to a SYSTEMTIME structure.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetTimeToSystemTime as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
 * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimetosystemtimew
 * @since windows5.0
 */
export InternetTimeToSystemTimeW(lpszTime, pst) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeToSystemTimeW", "ptr", lpszTime, SYSTEMTIME.Ptr, pst, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetTimeToSystemTime function (wininet.h) converts an HTTP time/date string to a SYSTEMTIME structure.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
 * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
 * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internettimetosystemtime
 * @since windows5.0
 */
export InternetTimeToSystemTime(lpszTime, pst) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

    A_LastError := 0

    result := DllCall("WININET.dll\InternetTimeToSystemTime", "ptr", lpszTime, SYSTEMTIME.Ptr, pst, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Cracks a URL into its component parts. (ANSI)
 * @remarks
 * The required components are indicated by members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure. Each component has a pointer to the value and has a member that stores the length of the stored value. If both the value and the length for a component are equal to zero, that component is not returned. <b>Windows Vista and later.:  </b>If the pointer to the value of the component is <b>NULL</b> and the value of its corresponding length member is nonzero, the address of the first character of the corresponding component in the 
 * <i>lpszUrl</i> string is stored in the pointer, and the length of the component is stored in the length member.
 * 
 * 
 * 
 * If the pointer contains the address of the user-supplied buffer, the length member must contain the size of the buffer. 
 * <b>InternetCrackUrl</b> copies the component into the buffer, and the length member is set to the length of the copied component, minus 1 for the trailing string terminator.
 * 
 * For 
 * <b>InternetCrackUrl</b> to work properly, the size of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure, in bytes, must be stored in the 
 * <b>dwStructSize</b> member.
 * 
 * <b>Note</b>  Do not use <b>InternetCrackUrl</b> on "file://" URLs that contain spaces, because  the value returned in the <b>dwUrlPathLength</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure pointed to by <i>lpUrlComponents</i> is too large. This is only the case, however, with "file://" URLs that contain space characters.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCrackUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl Pointer to a string that contains the canonical URL to be cracked.
 * @param {Integer} dwUrlLength Size of the 
 * <i>lpszUrl</i> string, in <b>TCHARs</b>, or zero if 
 * <i>lpszUrl</i> is an ASCIIZ string.
 * @param {WIN_HTTP_CREATE_URL_FLAGS} dwFlags 
 * @param {Pointer<URL_COMPONENTSA>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that receives the URL components.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcrackurla
 * @since windows5.0
 */
export InternetCrackUrlA(lpszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCrackUrlA", "ptr", lpszUrl, "uint", dwUrlLength, WIN_HTTP_CREATE_URL_FLAGS, dwFlags, URL_COMPONENTSA.Ptr, lpUrlComponents, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Cracks a URL into its component parts. (Unicode)
 * @remarks
 * The required components are indicated by members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure. Each component has a pointer to the value and has a member that stores the length of the stored value. If both the value and the length for a component are equal to zero, that component is not returned. <b>Windows Vista and later.:  </b>If the pointer to the value of the component is <b>NULL</b> and the value of its corresponding length member is nonzero, the address of the first character of the corresponding component in the 
 * <i>lpszUrl</i> string is stored in the pointer, and the length of the component is stored in the length member.
 * 
 * 
 * 
 * If the pointer contains the address of the user-supplied buffer, the length member must contain the size of the buffer. 
 * <b>InternetCrackUrl</b> copies the component into the buffer, and the length member is set to the length of the copied component, minus 1 for the trailing string terminator.
 * 
 * For 
 * <b>InternetCrackUrl</b> to work properly, the size of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure, in bytes, must be stored in the 
 * <b>dwStructSize</b> member.
 * 
 * <b>Note</b>  Do not use <b>InternetCrackUrl</b> on "file://" URLs that contain spaces, because  the value returned in the <b>dwUrlPathLength</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure pointed to by <i>lpUrlComponents</i> is too large. This is only the case, however, with "file://" URLs that contain space characters.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCrackUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl Pointer to a string that contains the canonical URL to be cracked.
 * @param {Integer} dwUrlLength Size of the 
 * <i>lpszUrl</i> string, in <b>TCHARs</b>, or zero if 
 * <i>lpszUrl</i> is an ASCIIZ string.
 * @param {WIN_HTTP_CREATE_URL_FLAGS} dwFlags 
 * @param {Pointer<URL_COMPONENTSW>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that receives the URL components.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcrackurlw
 * @since windows5.0
 */
export InternetCrackUrlW(lpszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCrackUrlW", "ptr", lpszUrl, "uint", dwUrlLength, WIN_HTTP_CREATE_URL_FLAGS, dwFlags, URL_COMPONENTSW.Ptr, lpUrlComponents, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a URL from its component parts. (ANSI)
 * @remarks
 * When specifying scheme in the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure passed to <i>lpUrlComponents</i>, if <i>lpszScheme</i> is not NULL it will be used for the scheme.  If <i>lpszScheme</i> is NULL, the scheme can be specified using the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ne-wininet-internet_scheme">INTERNET_SCHEME</a> enumeration by setting <b>nScheme</b> to the required <b>INTERNET_SCHEME</b> or <b>INTERNET_SCHEME_DEFAULT</b>.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCreateUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<URL_COMPONENTSA>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
 * @param {Integer} dwFlags 
 * @param {PSTR} lpszUrl Pointer to a buffer that receives the URL.
 * @param {Pointer<Integer>} lpdwUrlLength Pointer to a variable that specifies the size of the 
 * URL <i>lpszUrl</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter receives the size of the URL string, excluding the NULL terminator. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the created URL.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcreateurla
 * @since windows5.0
 */
export InternetCreateUrlA(lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    lpdwUrlLengthMarshal := lpdwUrlLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCreateUrlA", URL_COMPONENTSA.Ptr, lpUrlComponents, "uint", dwFlags, "ptr", lpszUrl, lpdwUrlLengthMarshal, lpdwUrlLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a URL from its component parts. (Unicode)
 * @remarks
 * When specifying scheme in the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure passed to <i>lpUrlComponents</i>, if <i>lpszScheme</i> is not NULL it will be used for the scheme.  If <i>lpszScheme</i> is NULL, the scheme can be specified using the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ne-wininet-internet_scheme">INTERNET_SCHEME</a> enumeration by setting <b>nScheme</b> to the required <b>INTERNET_SCHEME</b> or <b>INTERNET_SCHEME_DEFAULT</b>.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCreateUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<URL_COMPONENTSW>} lpUrlComponents Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
 * @param {Integer} dwFlags 
 * @param {PWSTR} lpszUrl Pointer to a buffer that receives the URL.
 * @param {Pointer<Integer>} lpdwUrlLength Pointer to a variable that specifies the size of the 
 * URL <i>lpszUrl</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter receives the size of the URL string, excluding the NULL terminator. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the created URL.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcreateurlw
 * @since windows5.0
 */
export InternetCreateUrlW(lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    lpdwUrlLengthMarshal := lpdwUrlLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCreateUrlW", URL_COMPONENTSW.Ptr, lpUrlComponents, "uint", dwFlags, "ptr", lpszUrl, lpdwUrlLengthMarshal, lpdwUrlLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Canonicalizes a URL, which includes converting unsafe characters and spaces into escape sequences. (ANSI)
 * @remarks
 * In Internet Explorer 4.0 and later, 
 * <b>InternetCanonicalizeUrl</b> always functions as if the <b>ICU_BROWSER_MODE</b> flag is set. Client applications that must canonicalize the entire URL should use either 
 * <a href="https://msdn.microsoft.com/25f9b097-ee42-48df-8573-d6bf9a52f53b">CoInternetParseUrl</a> (with the action <b>PARSE_CANONICALIZE</b> and the flag <b>URL_ESCAPE_UNSAFE</b>) or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-urlcanonicalizea">UrlCanonicalize</a>.
 * 
 * <b>InternetCanonicalizeUrl</b> always encodes by default, even if the <b>ICU_DECODE</b> flag has been specified. To decode without reencoding, use <b>ICU_DECODE</b> | <b>ICU_NO_ENCODE</b>. If the <b>ICU_DECODE</b> flag is used without <b>ICU_NO_ENCODE</b>, the URL is decoded before being parsed; unsafe characters are then  re-encoded after parsing. This function  handles arbitrary protocol schemes, but to do so it must make inferences from the unsafe character set.
 * 
 * Applications that call 
 * <b>InternetCanonicalizeUrl</b> when using  Internet Explorer 3.0 (or when setting the <b>ICU_ENCODE_PERCENT</b> flag for Internet Explorer 5 and later) should track the usage of this function on a particular URL. If unsafe characters in a URL have been converted to escape sequences, using 
 * <b>InternetCanonicalizeUrl</b> again on the URL (with no flags)  causes the escape sequences to be converted to another escape sequence. For example, a blank space in a URL would be converted to the escape sequence %20. Calling 
 * <b>InternetCanonicalizeUrl</b> again on the URL would cause the escape sequence %20 to be converted to the escape sequence %2520, because the % sign is an unsafe character that is reserved for escape sequences and is replaced by the function with the escape sequence %25.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCanonicalizeUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl A pointer to the string that contains the URL to canonicalize.
 * @param {PSTR} lpszBuffer A pointer to the buffer that receives the resulting canonicalized URL.
 * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains the size, in characters,  of the 
 * <i>lpszBuffer</i> buffer. If the function succeeds, this parameter receives the number of characters actually copied to the 
 * <i>lpszBuffer</i> buffer, which does not include the terminating null character. If the function fails, this parameter receives the required size of the 
 * buffer, in characters, which includes the terminating null character.
 * @param {Integer} dwFlags Controls canonicalization. If no flags are specified, the function converts all unsafe characters and meta sequences (such as \.,\ .., and \...) to escape sequences.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_PATHNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL could not be canonicalized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The canonicalized URL is too large to fit in the buffer provided. The 
 * <i>lpdwBufferLength</i> parameter is set to the size, in bytes, of the buffer required to hold the canonicalized URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is an invalid string, buffer, buffer size, or flags parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcanonicalizeurla
 * @since windows5.0
 */
export InternetCanonicalizeUrlA(lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCanonicalizeUrlA", "ptr", lpszUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Canonicalizes a URL, which includes converting unsafe characters and spaces into escape sequences. (Unicode)
 * @remarks
 * In Internet Explorer 4.0 and later, 
 * <b>InternetCanonicalizeUrl</b> always functions as if the <b>ICU_BROWSER_MODE</b> flag is set. Client applications that must canonicalize the entire URL should use either 
 * <a href="https://msdn.microsoft.com/25f9b097-ee42-48df-8573-d6bf9a52f53b">CoInternetParseUrl</a> (with the action <b>PARSE_CANONICALIZE</b> and the flag <b>URL_ESCAPE_UNSAFE</b>) or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-urlcanonicalizea">UrlCanonicalize</a>.
 * 
 * <b>InternetCanonicalizeUrl</b> always encodes by default, even if the <b>ICU_DECODE</b> flag has been specified. To decode without reencoding, use <b>ICU_DECODE</b> | <b>ICU_NO_ENCODE</b>. If the <b>ICU_DECODE</b> flag is used without <b>ICU_NO_ENCODE</b>, the URL is decoded before being parsed; unsafe characters are then  re-encoded after parsing. This function  handles arbitrary protocol schemes, but to do so it must make inferences from the unsafe character set.
 * 
 * Applications that call 
 * <b>InternetCanonicalizeUrl</b> when using  Internet Explorer 3.0 (or when setting the <b>ICU_ENCODE_PERCENT</b> flag for Internet Explorer 5 and later) should track the usage of this function on a particular URL. If unsafe characters in a URL have been converted to escape sequences, using 
 * <b>InternetCanonicalizeUrl</b> again on the URL (with no flags)  causes the escape sequences to be converted to another escape sequence. For example, a blank space in a URL would be converted to the escape sequence %20. Calling 
 * <b>InternetCanonicalizeUrl</b> again on the URL would cause the escape sequence %20 to be converted to the escape sequence %2520, because the % sign is an unsafe character that is reserved for escape sequences and is replaced by the function with the escape sequence %25.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCanonicalizeUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl A pointer to the string that contains the URL to canonicalize.
 * @param {PWSTR} lpszBuffer A pointer to the buffer that receives the resulting canonicalized URL.
 * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains the size, in characters,  of the 
 * <i>lpszBuffer</i> buffer. If the function succeeds, this parameter receives the number of characters actually copied to the 
 * <i>lpszBuffer</i> buffer, which does not include the terminating null character. If the function fails, this parameter receives the required size of the 
 * buffer, in characters, which includes the terminating null character.
 * @param {Integer} dwFlags Controls canonicalization. If no flags are specified, the function converts all unsafe characters and meta sequences (such as \.,\ .., and \...) to escape sequences.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_PATHNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL could not be canonicalized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The canonicalized URL is too large to fit in the buffer provided. The 
 * <i>lpdwBufferLength</i> parameter is set to the size, in bytes, of the buffer required to hold the canonicalized URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is an invalid string, buffer, buffer size, or flags parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcanonicalizeurlw
 * @since windows5.0
 */
export InternetCanonicalizeUrlW(lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCanonicalizeUrlW", "ptr", lpszUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Combines a base and relative URL into a single URL. The resultant URL is canonicalized (see InternetCanonicalizeUrl). (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCombineUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszBaseUrl Pointer to a null-terminated string  that contains the base URL.
 * @param {PSTR} lpszRelativeUrl Pointer to a null-terminated string  that contains the relative URL.
 * @param {PSTR} lpszBuffer Pointer to a buffer that receives the combined URL.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
 * <i>lpszBuffer</i> buffer, in characters. If the function succeeds, this parameter receives the size of the combined URL, in characters, not including the null-terminating character. If the function fails, this parameter receives the size of the required buffer, in characters (including the null-terminating character).
 * @param {Integer} dwFlags 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_PATHNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URLs could not be combined.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer supplied to the function was insufficient or <b>NULL</b>. The value indicated by the 
 * <i>lpdwBufferLength</i> parameter will contain the number of bytes required to hold the combined URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is an invalid string, buffer, buffer size, or flags parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcombineurla
 * @since windows5.0
 */
export InternetCombineUrlA(lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
    lpszBaseUrl := lpszBaseUrl is String ? StrPtr(lpszBaseUrl) : lpszBaseUrl
    lpszRelativeUrl := lpszRelativeUrl is String ? StrPtr(lpszRelativeUrl) : lpszRelativeUrl
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCombineUrlA", "ptr", lpszBaseUrl, "ptr", lpszRelativeUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Combines a base and relative URL into a single URL. The resultant URL is canonicalized (see InternetCanonicalizeUrl). (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCombineUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszBaseUrl Pointer to a null-terminated string  that contains the base URL.
 * @param {PWSTR} lpszRelativeUrl Pointer to a null-terminated string  that contains the relative URL.
 * @param {PWSTR} lpszBuffer Pointer to a buffer that receives the combined URL.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
 * <i>lpszBuffer</i> buffer, in characters. If the function succeeds, this parameter receives the size of the combined URL, in characters, not including the null-terminating character. If the function fails, this parameter receives the size of the required buffer, in characters (including the null-terminating character).
 * @param {Integer} dwFlags 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_PATHNAME</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URLs could not be combined.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer supplied to the function was insufficient or <b>NULL</b>. The value indicated by the 
 * <i>lpdwBufferLength</i> parameter will contain the number of bytes required to hold the combined URL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The format of the URL is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is an invalid string, buffer, buffer size, or flags parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcombineurlw
 * @since windows5.0
 */
export InternetCombineUrlW(lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
    lpszBaseUrl := lpszBaseUrl is String ? StrPtr(lpszBaseUrl) : lpszBaseUrl
    lpszRelativeUrl := lpszRelativeUrl is String ? StrPtr(lpszRelativeUrl) : lpszRelativeUrl
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCombineUrlW", "ptr", lpszBaseUrl, "ptr", lpszRelativeUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initializes an application's use of the WinINet functions. (ANSI)
 * @remarks
 * <b>InternetOpen</b> is the first WinINet function called by an application. It tells the Internet DLL to initialize internal data structures and prepare for future calls from the application. When the application finishes using the Internet functions, it should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> to free the handle and any associated resources.
 * 
 * The application can make any number of calls to 
 * <b>InternetOpen</b>, though a single call is normally sufficient. The application might need to define separate behaviors for each 
 * <b>InternetOpen</b> instance, such as different proxy servers configured for each.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetOpen</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszAgent Pointer to a <b>null</b>-terminated string  that specifies the name of the application or entity calling the WinINet functions. This name is used as the user agent in the HTTP protocol.
 * @param {Integer} dwAccessType 
 * @param {PSTR} lpszProxy Pointer to a <b>null</b>-terminated string  that specifies the name of the proxy server(s) to use when proxy access is specified by setting 
 * <i>dwAccessType</i> to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>. Do not use an empty string, because 
 * <b>InternetOpen</b> will use it as the proxy name. The WinINet functions recognize only CERN type proxies (HTTP only) and the TIS FTP gateway (FTP only). If Microsoft Internet Explorer is installed, these functions also support SOCKS proxies. FTP requests can be made through a CERN type proxy either by changing them to an HTTP request or by using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>. If 
 * <i>dwAccessType</i> is not set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>. For more information about listing proxy servers, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Listing Proxy Servers</a> section of 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>.
 * @param {PSTR} lpszProxyBypass Pointer to a <b>null</b>-terminated string  that specifies an optional list of host names or IP addresses, or both, that should not be routed through the proxy when 
 * <i>dwAccessType</i> is set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>. The list can contain wildcards. Do not use an empty string, because 
 * <b>InternetOpen</b> will use it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro, the function bypasses the proxy for any host name that does not contain a period. 
 * 
 * By default, WinINet will bypass the proxy for requests that use the host names "localhost", "loopback", "127.0.0.1", or "[::1]". This behavior exists because a remote proxy server typically will not resolve these addresses properly.<b>Internet Explorer 9:  </b>You can remove the local computer from the proxy bypass list using the "&lt;-loopback&gt;" macro.
 * 
 * 
 * 
 * If 
 * <i>dwAccessType</i> is not set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>.
 * @param {Integer} dwFlags 
 * @returns {Pointer<Void>} Returns a valid handle that the application passes to subsequent WinINet functions. If 
 * <b>InternetOpen</b> fails, it returns <b>NULL</b>. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetopena
 * @since windows5.0
 */
export InternetOpenA(lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags) {
    lpszAgent := lpszAgent is String ? StrPtr(lpszAgent) : lpszAgent
    lpszProxy := lpszProxy is String ? StrPtr(lpszProxy) : lpszProxy
    lpszProxyBypass := lpszProxyBypass is String ? StrPtr(lpszProxyBypass) : lpszProxyBypass

    A_LastError := 0

    result := DllCall("WININET.dll\InternetOpenA", "ptr", lpszAgent, "uint", dwAccessType, "ptr", lpszProxy, "ptr", lpszProxyBypass, "uint", dwFlags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initializes an application's use of the WinINet functions. (Unicode)
 * @remarks
 * <b>InternetOpen</b> is the first WinINet function called by an application. It tells the Internet DLL to initialize internal data structures and prepare for future calls from the application. When the application finishes using the Internet functions, it should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> to free the handle and any associated resources.
 * 
 * The application can make any number of calls to 
 * <b>InternetOpen</b>, though a single call is normally sufficient. The application might need to define separate behaviors for each 
 * <b>InternetOpen</b> instance, such as different proxy servers configured for each.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetOpen</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetOpen as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszAgent Pointer to a <b>null</b>-terminated string  that specifies the name of the application or entity calling the WinINet functions. This name is used as the user agent in the HTTP protocol.
 * @param {Integer} dwAccessType 
 * @param {PWSTR} lpszProxy Pointer to a <b>null</b>-terminated string  that specifies the name of the proxy server(s) to use when proxy access is specified by setting 
 * <i>dwAccessType</i> to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>. Do not use an empty string, because 
 * <b>InternetOpen</b> will use it as the proxy name. The WinINet functions recognize only CERN type proxies (HTTP only) and the TIS FTP gateway (FTP only). If Microsoft Internet Explorer is installed, these functions also support SOCKS proxies. FTP requests can be made through a CERN type proxy either by changing them to an HTTP request or by using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>. If 
 * <i>dwAccessType</i> is not set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>. For more information about listing proxy servers, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Listing Proxy Servers</a> section of 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>.
 * @param {PWSTR} lpszProxyBypass Pointer to a <b>null</b>-terminated string  that specifies an optional list of host names or IP addresses, or both, that should not be routed through the proxy when 
 * <i>dwAccessType</i> is set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>. The list can contain wildcards. Do not use an empty string, because 
 * <b>InternetOpen</b> will use it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro, the function bypasses the proxy for any host name that does not contain a period. 
 * 
 * By default, WinINet will bypass the proxy for requests that use the host names "localhost", "loopback", "127.0.0.1", or "[::1]". This behavior exists because a remote proxy server typically will not resolve these addresses properly.<b>Internet Explorer 9:  </b>You can remove the local computer from the proxy bypass list using the "&lt;-loopback&gt;" macro.
 * 
 * 
 * 
 * If 
 * <i>dwAccessType</i> is not set to 
 * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>.
 * @param {Integer} dwFlags 
 * @returns {Pointer<Void>} Returns a valid handle that the application passes to subsequent WinINet functions. If 
 * <b>InternetOpen</b> fails, it returns <b>NULL</b>. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetopenw
 * @since windows5.0
 */
export InternetOpenW(lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags) {
    lpszAgent := lpszAgent is String ? StrPtr(lpszAgent) : lpszAgent
    lpszProxy := lpszProxy is String ? StrPtr(lpszProxy) : lpszProxy
    lpszProxyBypass := lpszProxyBypass is String ? StrPtr(lpszProxyBypass) : lpszProxyBypass

    A_LastError := 0

    result := DllCall("WININET.dll\InternetOpenW", "ptr", lpszAgent, "uint", dwAccessType, "ptr", lpszProxy, "ptr", lpszProxyBypass, "uint", dwFlags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Closes a single Internet handle.
 * @remarks
 * The function terminates any pending operations on the handle and discards any outstanding data. 
 * 
 * 
 * It is safe to call <b>InternetCloseHandle</b> as long as no API calls are being made or will be made using the handle.  Once an API has returned <b>ERROR_IO_PENDING</b>, it is safe to call <b>InternetCloseHandle</b> to cancel that I/O, as long as no subsequent API calls will be issued with the handle. 
 * 
 * It is safe to call <b>InternetCloseHandle</b> in a callback for the handle being closed. If there is a status callback registered for the handle being closed, and the handle was created with a non-NULL context value, an <b>INTERNET_STATUS_HANDLE_CLOSING</b> callback will be made. This indication will be the last callback made from a handle and indicates that the handle is being destroyed.
 * 
 * If asynchronous requests are pending for the handle or any of its child handles, the handle cannot be closed immediately, but it will be invalidated. Any new requests attempted using the handle will return with an 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_INVALID_HANDLE</a> notification. The asynchronous requests will complete with <b>INTERNET_STATUS_REQUEST_COMPLETE</b>. Applications must be prepared to receive any <b>INTERNET_STATUS_REQUEST_COMPLETE</b> indications on the handle before the final <b>INTERNET_STATUS_HANDLE_CLOSING</b> indication is made, which indicates that the handle is completely closed.
 * 
 * An application can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine if requests are pending. If 
 * <b>GetLastError</b> returns <b>ERROR_IO_PENDING</b>, there were outstanding requests when the handle was closed.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet Handle to be closed.
 * @returns {BOOL} Returns <b>TRUE</b> if the handle is successfully closed, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetclosehandle
 * @since windows5.0
 */
export InternetCloseHandle(hInternet) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCloseHandle", hInternetMarshal, hInternet, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Opens an File Transfer Protocol (FTP) or HTTP session for a given site. (ANSI)
 * @remarks
 * The following table describes the behavior for the four possible settings of 
 * <i>lpszUsername</i> and 
 * <i>lpszPassword</i>. 
 * 				
 * <table class="clsStd">
 * <tr>
 * <th><i>lpszUsername</i></th>
 * <th><i>lpszPassword</i></th>
 * <th>User name sent to FTP server</th>
 * <th>Password sent to FTP server</th>
 * </tr>
 * <tr>
 * <td><b>NULL</b></td>
 * <td><b>NULL</b></td>
 * <td>"anonymous"</td>
 * <td>User's email name</td>
 * </tr>
 * <tr>
 * <td>Non-<b>NULL</b> string</td>
 * <td><b>NULL</b></td>
 * <td><i>lpszUsername</i></td>
 * <td>""</td>
 * </tr>
 * <tr>
 * <td><b>NULL</b></td>
 * <td>Non-<b>NULL</b> string</td>
 * <td>ERROR</td>
 * <td>ERROR</td>
 * </tr>
 * <tr>
 * <td>Non-<b>NULL</b> string</td>
 * <td>Non-<b>NULL</b> string</td>
 * <td><i>lpszUsername</i></td>
 * <td><i>lpszPassword</i></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * For FTP sites, 
 * <b>InternetConnect</b> actually establishes a connection with the server; for others, the actual connection is not established until the application requests a specific transaction.
 * 
 * For maximum efficiency, applications using the HTTP protocols should try to minimize calls to 
 * <b>InternetConnect</b> and avoid calling this function for every transaction requested by the user. One way to accomplish this is to keep a small cache of handles returned from 
 * <b>InternetConnect</b>; when the user makes a request to a previously accessed server, that session handle is still available.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetConnect</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * 
 * <b>Note</b>  When a request is sent asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the connection handle will not be called, however, the call will still be performed in asynchronous mode.  
 * 
 * 
 * 
 * 
 * Examples of <b>InternetConnect</b> usage can be found in the following topics.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/handling-authentication">Handling Authentication</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/asynchronous-example-application">Asynchronous Example Application</a>
 * </li>
 * </ul>
 * 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetConnect as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
 * @param {PSTR} lpszServerName Pointer to a <b>null</b>-terminated string that specifies the host name of an Internet server. Alternately, the string can contain the IP number of the site, in ASCII dotted-decimal format (for example, 11.0.1.45).
 * @param {Integer} nServerPort Transmission Control Protocol/Internet Protocol (TCP/IP) port on the server. These flags set only the port that is used. The service is set by the value of
 * @param {PSTR} lpszUserName Pointer to a <b>null</b>-terminated string that specifies the name of the user to log on. If this parameter is <b>NULL</b>, the function uses an appropriate default. For the FTP protocol, the default is "anonymous".
 * @param {PSTR} lpszPassword Pointer to a <b>null</b>-terminated string that contains the password to use to log on. If both 
 * <i>lpszPassword</i> and 
 * <i>lpszUsername</i> are <b>NULL</b>, the function uses the default "anonymous" password. In the case of FTP, the default password is the user's email name. If 
 * <i>lpszPassword</i> is <b>NULL</b>, but 
 * <i>lpszUsername</i> is not <b>NULL</b>, the function uses a blank password.
 * @param {Integer} dwService 
 * @param {Integer} dwFlags Options specific to the service used. If  
 * <i>dwService</i> is INTERNET_SERVICE_FTP, 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_PASSIVE</a> causes the application to use passive FTP semantics.
 * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
 * @returns {Pointer<Void>} Returns a valid handle to the session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why access to the service was denied.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetconnecta
 * @since windows5.0
 */
export InternetConnectA(hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext) {
    lpszServerName := lpszServerName is String ? StrPtr(lpszServerName) : lpszServerName
    lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
    lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetConnectA", hInternetMarshal, hInternet, "ptr", lpszServerName, "ushort", nServerPort, "ptr", lpszUserName, "ptr", lpszPassword, "uint", dwService, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Opens an File Transfer Protocol (FTP) or HTTP session for a given site. (Unicode)
 * @remarks
 * The following table describes the behavior for the four possible settings of 
 * <i>lpszUsername</i> and 
 * <i>lpszPassword</i>. 
 * 				
 * <table class="clsStd">
 * <tr>
 * <th><i>lpszUsername</i></th>
 * <th><i>lpszPassword</i></th>
 * <th>User name sent to FTP server</th>
 * <th>Password sent to FTP server</th>
 * </tr>
 * <tr>
 * <td><b>NULL</b></td>
 * <td><b>NULL</b></td>
 * <td>"anonymous"</td>
 * <td>User's email name</td>
 * </tr>
 * <tr>
 * <td>Non-<b>NULL</b> string</td>
 * <td><b>NULL</b></td>
 * <td><i>lpszUsername</i></td>
 * <td>""</td>
 * </tr>
 * <tr>
 * <td><b>NULL</b></td>
 * <td>Non-<b>NULL</b> string</td>
 * <td>ERROR</td>
 * <td>ERROR</td>
 * </tr>
 * <tr>
 * <td>Non-<b>NULL</b> string</td>
 * <td>Non-<b>NULL</b> string</td>
 * <td><i>lpszUsername</i></td>
 * <td><i>lpszPassword</i></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * For FTP sites, 
 * <b>InternetConnect</b> actually establishes a connection with the server; for others, the actual connection is not established until the application requests a specific transaction.
 * 
 * For maximum efficiency, applications using the HTTP protocols should try to minimize calls to 
 * <b>InternetConnect</b> and avoid calling this function for every transaction requested by the user. One way to accomplish this is to keep a small cache of handles returned from 
 * <b>InternetConnect</b>; when the user makes a request to a previously accessed server, that session handle is still available.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetConnect</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * 
 * <b>Note</b>  When a request is sent asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the connection handle will not be called, however, the call will still be performed in asynchronous mode.  
 * 
 * 
 * 
 * 
 * Examples of <b>InternetConnect</b> usage can be found in the following topics.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/handling-authentication">Handling Authentication</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/asynchronous-example-application">Asynchronous Example Application</a>
 * </li>
 * </ul>
 * 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetConnect as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
 * @param {PWSTR} lpszServerName Pointer to a <b>null</b>-terminated string that specifies the host name of an Internet server. Alternately, the string can contain the IP number of the site, in ASCII dotted-decimal format (for example, 11.0.1.45).
 * @param {Integer} nServerPort Transmission Control Protocol/Internet Protocol (TCP/IP) port on the server. These flags set only the port that is used. The service is set by the value of
 * @param {PWSTR} lpszUserName Pointer to a <b>null</b>-terminated string that specifies the name of the user to log on. If this parameter is <b>NULL</b>, the function uses an appropriate default. For the FTP protocol, the default is "anonymous".
 * @param {PWSTR} lpszPassword Pointer to a <b>null</b>-terminated string that contains the password to use to log on. If both 
 * <i>lpszPassword</i> and 
 * <i>lpszUsername</i> are <b>NULL</b>, the function uses the default "anonymous" password. In the case of FTP, the default password is the user's email name. If 
 * <i>lpszPassword</i> is <b>NULL</b>, but 
 * <i>lpszUsername</i> is not <b>NULL</b>, the function uses a blank password.
 * @param {Integer} dwService 
 * @param {Integer} dwFlags Options specific to the service used. If  
 * <i>dwService</i> is INTERNET_SERVICE_FTP, 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_PASSIVE</a> causes the application to use passive FTP semantics.
 * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
 * @returns {Pointer<Void>} Returns a valid handle to the session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why access to the service was denied.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetconnectw
 * @since windows5.0
 */
export InternetConnectW(hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext) {
    lpszServerName := lpszServerName is String ? StrPtr(lpszServerName) : lpszServerName
    lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
    lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetConnectW", hInternetMarshal, hInternet, "ptr", lpszServerName, "ushort", nServerPort, "ptr", lpszUserName, "ptr", lpszPassword, "uint", dwService, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Opens a resource specified by a complete FTP or HTTP URL. (ANSI)
 * @remarks
 * Call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcanonicalizeurla">InternetCanonicalizeUrl</a> first if the URL being used contains a relative URL and a base URL separated by blank spaces.
 * 
 * This is a general function that an application can use to retrieve data over any of the protocols that WinINet supports. This function is especially useful when the application does not need to access the particulars of a protocol, but only requires the data corresponding to a URL. The 
 * <b>InternetOpenUrl</b> function parses the URL string, establishes a connection to the server, and prepares to download the data identified by the URL. The application can then use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> (for files) or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> (for directories) to retrieve the URL data. It is not necessary to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> before 
 * <b>InternetOpenUrl</b>.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b><b>InternetOpenUrl</b> disables Gopher on ports less than 1024, except for port 70—the standard Gopher port—and port 105—typically used for Central Services Organization (CSO) name searches.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetOpenUrl</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * <b>Note</b>  When working in asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the session handle will not be invoked, however, the call will still be performed in asynchronous mode
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetOpenUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet The handle to the current Internet session. The handle must have been returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
 * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string variable that specifies the URL to begin reading. Only URLs beginning with ftp:, http:, or https: are supported.
 * @param {PSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that specifies the headers to be sent to the HTTP server. For more information, see the description of the 
 * <i>lpszHeaders</i> parameter in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> function.
 * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, 
 * <i>lpszHeaders</i> is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A pointer to a variable that specifies the application-defined value that is passed, along with the returned handle, to any callback functions.
 * @returns {Pointer<Void>} Returns a valid handle to the URL if the connection is successfully established, or <b>NULL</b> if the connection fails. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. To determine why access to the service was denied, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetopenurla
 * @since windows5.0
 */
export InternetOpenUrlA(hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetOpenUrlA", hInternetMarshal, hInternet, "ptr", lpszUrl, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Opens a resource specified by a complete FTP or HTTP URL. (Unicode)
 * @remarks
 * Call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcanonicalizeurla">InternetCanonicalizeUrl</a> first if the URL being used contains a relative URL and a base URL separated by blank spaces.
 * 
 * This is a general function that an application can use to retrieve data over any of the protocols that WinINet supports. This function is especially useful when the application does not need to access the particulars of a protocol, but only requires the data corresponding to a URL. The 
 * <b>InternetOpenUrl</b> function parses the URL string, establishes a connection to the server, and prepares to download the data identified by the URL. The application can then use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> (for files) or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> (for directories) to retrieve the URL data. It is not necessary to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> before 
 * <b>InternetOpenUrl</b>.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b><b>InternetOpenUrl</b> disables Gopher on ports less than 1024, except for port 70—the standard Gopher port—and port 105—typically used for Central Services Organization (CSO) name searches.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>InternetOpenUrl</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * <b>Note</b>  When working in asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the session handle will not be invoked, however, the call will still be performed in asynchronous mode
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetOpenUrl as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet The handle to the current Internet session. The handle must have been returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
 * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string variable that specifies the URL to begin reading. Only URLs beginning with ftp:, http:, or https: are supported.
 * @param {PWSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that specifies the headers to be sent to the HTTP server. For more information, see the description of the 
 * <i>lpszHeaders</i> parameter in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> function.
 * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, 
 * <i>lpszHeaders</i> is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A pointer to a variable that specifies the application-defined value that is passed, along with the returned handle, to any callback functions.
 * @returns {Pointer<Void>} Returns a valid handle to the URL if the connection is successfully established, or <b>NULL</b> if the connection fails. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. To determine why access to the service was denied, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetopenurlw
 * @since windows5.0
 */
export InternetOpenUrlW(hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetOpenUrlW", hInternetMarshal, hInternet, "ptr", lpszUrl, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Reads data from a handle opened by the InternetOpenUrl, FtpOpenFile, or HttpOpenRequest function.
 * @remarks
 * <b>InternetReadFile</b> operates much like the base 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> function, with a few exceptions. Typically, 
 * <b>InternetReadFile</b> retrieves data from an 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle as a sequential stream of bytes. The amount of data to be read for each call to 
 * <b>InternetReadFile</b> is specified by the 
 * <i>dwNumberOfBytesToRead</i> parameter and the data is returned in the 
 * <i>lpBuffer</i> parameter. A normal read retrieves the specified 
 * <i>dwNumberOfBytesToRead</i> for each call to 
 * <b>InternetReadFile</b> until the end of the file is reached. To ensure all data is retrieved, an application must continue to call the 
 * <b>InternetReadFile</b> function until the function returns <b>TRUE</b> and the 
 * <i>lpdwNumberOfBytesRead</i> parameter equals zero. This is especially important if the requested data is written to the cache, because otherwise the cache will not be properly updated and the file downloaded will not be committed to the cache. Note that caching happens automatically unless the original request to open the data stream set the <b>INTERNET_FLAG_NO_CACHE_WRITE</b> flag.
 * 
 * When an application retrieves a handle using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>, WinINet attempts to make all data look like a file download, in an effort to make reading from the Internet easier for the application. For some types of information, such as FTP file directory listings, it converts the data to be returned by  
 * <b>InternetReadFile</b> to an HTML stream. It does this on a line-by-line basis. For example, it can convert an FTP directory listing to a line of HTML and return this HTML to the application.
 * 
 * WinINet attempts to write the HTML to the 
 * <i>lpBuffer</i> buffer a line at a time. If the application's buffer is too small to fit at least one line of generated HTML, the error code 
 * <b>ERROR_INSUFFICIENT_BUFFER</b> is returned as an indication to the application that it needs a larger buffer. Also, converted lines might not completely fill the buffer, so 
 * <b>InternetReadFile</b> can return with less data in 
 * <i>lpBuffer</i> than requested. Subsequent reads will retrieve all the converted HTML. The application must again check that all data is retrieved as described previously.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * When running asynchronously, if a call to <b>InternetReadFile</b> does not result in a completed transaction, it will return <i>FALSE</i> and a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <i>ERROR_IO_PENDING</i>. When the transaction is completed the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a> specified in a previous call to   <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> will be called with <i>INTERNET_STATUS_REQUEST_COMPLETE</i>.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hFile Handle returned from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
 * or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a>.
 * @param {Integer} lpBuffer Pointer to a buffer that receives the data.
 * @param {Integer} dwNumberOfBytesToRead Number of bytes to be read.
 * @param {Pointer<Integer>} lpdwNumberOfBytesRead Pointer to a variable that receives the number of bytes read. 
 * <b>InternetReadFile</b> sets this value to zero before doing any work or error checking.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetreadfile
 * @since windows5.0
 */
export InternetReadFile(hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesReadMarshal := lpdwNumberOfBytesRead is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetReadFile", hFileMarshal, hFile, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, lpdwNumberOfBytesReadMarshal, lpdwNumberOfBytesRead, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Reads data from a handle opened by the InternetOpenUrl or HttpOpenRequest function. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetReadFileEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hFile Handle returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure that receives the data downloaded.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A caller supplied context value used for asynchronous operations.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetreadfileexa
 * @since windows5.0
 */
export InternetReadFileExA(hFile, lpBuffersOut, dwFlags, dwContext) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetReadFileExA", hFileMarshal, hFile, INTERNET_BUFFERSA.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Reads data from a handle opened by the InternetOpenUrl or HttpOpenRequest function. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetReadFileEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hFile Handle returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure that receives the data downloaded.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A caller supplied context value used for asynchronous operations.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetreadfileexw
 * @since windows5.0
 */
export InternetReadFileExW(hFile, lpBuffersOut, dwFlags, dwContext) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetReadFileExW", hFileMarshal, hFile, INTERNET_BUFFERSW.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a file position for InternetReadFile. This is a synchronous call; however, subsequent calls to InternetReadFile might block or return pending if the data is not available from the cache and the server does not support random access.
 * @remarks
 * This function cannot be used once the end of the file has been reached by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a>.
 * 
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handles created by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>, a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpendrequesta">HttpEndRequest</a> must be made on the handle before 
 * <b>InternetSetFilePointer</b> is used.
 * 
 * <b>InternetSetFilePointer</b> cannot be used reliably if the content length is unknown.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <b>InternetSetFilePointer</b> has changed over time. In Internet Explorer 7 and earlier, it  used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, <i>lDistanceToMove</i> contains the entire value. A positive value moves the pointer forward in the file; a negative value moves it backward.  <i>lpDistanceToMoveHigh</i> is reserved and is set to <b>0</b>.  In current versions, <i>lpDistanceToMoveHigh</i> is a significant value and where any negative value would be indicated.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hFile Handle returned from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (on an HTTP or HTTPS
 * 						URL) or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> (using the GET or HEAD HTTP verb and passed to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>). This handle must not have been created with the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_DONT_CACHE</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_NO_CACHE_WRITE</a> value set.
 * @param {Integer} lDistanceToMove The low order 32-bits of a signed 64-bit number of bytes to move the file pointer. <b>Internet Explorer 7 and earlier:  </b><b>InternetSetFilePointer</b> used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, <i>lpDistanceToMoveHigh</i> is reserved and should be set to <b>0</b>. A positive value moves the pointer forward in the file; a negative value moves it backward.
 * @param {Pointer<Integer>} lpDistanceToMoveHigh A pointer to the high order 32-bits of the signed 64-bit distance to move. If you do not need the high order 32-bits, this pointer must  be set to <b>NULL</b>.  When not <b>NULL</b>, this parameter also receives the high order DWORD of the new value of the file pointer. A positive value moves the pointer forward in the file; a negative value moves it backward.<b>Internet Explorer 7 and earlier:  </b><b>InternetSetFilePointer</b> used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, <i>lpDistanceToMoveHigh</i> is reserved and should be set to <b>0</b>.
 * @param {Integer} dwMoveMethod 
 * @returns {Integer} I the function succeeds, it returns the current file position.     A return value of <b>INVALID_SET_FILE_POINTER</b> indicates a potential failure and needs to be followed by be a call to <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.  
 * 
 * Since <b>INVALID_SET_FILE_POINTER</b> is a valid value for the  low-order DWORD of the new file pointer, the caller must check both the
 * return value of the function and the error code returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine whether or not an error has occurred.   If an error has occurred, the return value of InternetSetFilePointer        is <b>INVALID_SET_FILE_POINTER</b> and <b>GetLastError</b> returns a value other than <b>NO_ERROR</b>.
 * 
 * If the function succeeds and <i>lpDistanceToMoveHigh</i> is <b>NULL</b>, the return value is the low-order <b>DWORD</b> of the new file pointer.
 * 
 * Note that if the function returns a value other than <b>INVALID_SET_FILE_POINTER</b>, the call to <b>InternetSetFilePointer</b> has succeeded and there is no need to call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If the function succeeds and <i>lpDistanceToMoveHigh</i> is not <b>NULL</b>, the return value is the lower-order <b>DWORD</b> of the new file pointer and <i>lpDistanceToMoveHigh</i> contains the high order <b>DWORD</b> of the new file pointer.
 * 
 * If a new file pointer is a negative value, the function fails, the file pointer is not moved, and the code returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> is <b>ERROR_NEGATIVE_SEEK</b>.
 * 
 * If <i>lpDistanceToMoveHigh</i> is <b>NULL</b> and the new file position does not fit in a 32-bit value the function fails and returns <b>INVALID_SET_FILE_POINTER</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetfilepointer
 * @since windows5.0
 */
export InternetSetFilePointer(hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod) {
    static dwContext := 0 ;Reserved parameters must always be NULL

    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
    lpDistanceToMoveHighMarshal := lpDistanceToMoveHigh is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetFilePointer", hFileMarshal, hFile, "int", lDistanceToMove, lpDistanceToMoveHighMarshal, lpDistanceToMoveHigh, "uint", dwMoveMethod, "ptr", dwContext, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Writes data to an open Internet file.
 * @remarks
 * When the application is sending data, it must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> to end the data transfer.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hFile Handle returned from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> or an 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
 * @param {Integer} lpBuffer Pointer to a buffer that contains the data to be written to the file.
 * @param {Integer} dwNumberOfBytesToWrite Number of bytes to be written to the file.
 * @param {Pointer<Integer>} lpdwNumberOfBytesWritten Pointer to a variable that receives the number of bytes written to the file. 
 * <b>InternetWriteFile</b> sets this value to zero before doing any work or error checking.
 * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetwritefile
 * @since windows5.0
 */
export InternetWriteFile(hFile, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesWrittenMarshal := lpdwNumberOfBytesWritten is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetWriteFile", hFileMarshal, hFile, "ptr", lpBuffer, "uint", dwNumberOfBytesToWrite, lpdwNumberOfBytesWrittenMarshal, lpdwNumberOfBytesWritten, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Queries the server to determine the amount of data available.
 * @remarks
 * This function returns the number of bytes of data that are available to be read immediately by a subsequent call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a>. If there is currently no data available and the end of the file has not been reached, the request waits until data becomes available. The amount of data remaining will not be recalculated until all available data indicated by the call to 
 * <b>InternetQueryDataAvailable</b> is read.
 * 
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handles created by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>, a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpendrequesta">HttpEndRequest</a> must be made on the handle before 
 * <b>InternetQueryDataAvailable</b> can be used.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hFile Handle returned by 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {Pointer<Integer>} lpdwNumberOfBytesAvailable Pointer to a variable that receives the number of available bytes. May be <b>NULL</b>.
 * @param {Integer} dwFlags This parameter is reserved and must be 0.
 * @param {Pointer} dwContext This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetquerydataavailable
 * @since windows5.0
 */
export InternetQueryDataAvailable(hFile, lpdwNumberOfBytesAvailable, dwFlags, dwContext) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
    lpdwNumberOfBytesAvailableMarshal := lpdwNumberOfBytesAvailable is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetQueryDataAvailable", hFileMarshal, hFile, lpdwNumberOfBytesAvailableMarshal, lpdwNumberOfBytesAvailable, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Continues a file search started as a result of a previous call to FtpFindFirstFile.Windows XP and Windows Server 2003 R2 and earlier:  Or continues a file search as a result of a previous call to GopherFindFirstFile. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetFindNextFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hFind Handle returned from either 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpfindfirstfilea">FtpFindFirstFile</a> or  
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (directories only).
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Also a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
 * @param {Pointer<Void>} lpvFindData Pointer to the buffer that receives information about the  file or directory. The format of the information placed in the buffer depends on the protocol in use. The FTP protocol returns a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>The Gopher protocol returns a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns <b>ERROR_NO_MORE_FILES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetfindnextfilea
 * @since windows5.0
 */
export InternetFindNextFileA(hFind, lpvFindData) {
    hFindMarshal := hFind is VarRef ? "ptr" : "ptr"
    lpvFindDataMarshal := lpvFindData is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetFindNextFileA", hFindMarshal, hFind, lpvFindDataMarshal, lpvFindData, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Continues a file search started as a result of a previous call to FtpFindFirstFile.Windows XP and Windows Server 2003 R2 and earlier:  Or continues a file search as a result of a previous call to GopherFindFirstFile. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetFindNextFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hFind Handle returned from either 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpfindfirstfilea">FtpFindFirstFile</a> or  
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (directories only).
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Also a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
 * @param {Pointer<Void>} lpvFindData Pointer to the buffer that receives information about the  file or directory. The format of the information placed in the buffer depends on the protocol in use. The FTP protocol returns a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>The Gopher protocol returns a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure.
 * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns <b>ERROR_NO_MORE_FILES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetfindnextfilew
 * @since windows5.0
 */
export InternetFindNextFileW(hFind, lpvFindData) {
    hFindMarshal := hFind is VarRef ? "ptr" : "ptr"
    lpvFindDataMarshal := lpvFindData is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetFindNextFileW", hFindMarshal, hFind, lpvFindDataMarshal, lpvFindData, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Queries an Internet option on the specified handle. (ANSI)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return the <b>ERROR_INVALID_PARAMETER</b> if an option flag that is invalid for the specified handle type is passed to the 
 * <i>dwOption</i> parameter.
 * 
 * For more  information, see  
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/setting-and-retrieving-internet-options">Setting and Retrieving Internet Options</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetQueryOption as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle on which to query information.
 * @param {Integer} dwOption Internet option to be queried. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
 * @param {Integer} lpBuffer Pointer to a buffer that receives the option setting. Strings returned by 
 * <b>InternetQueryOption</b> are globally allocated, so the calling application must  free them when it  is finished using them.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of 
 * <i>lpBuffer</i>, in bytes.  When 
 * <b>InternetQueryOption</b> returns, 
 * <i>lpdwBufferLength</i> specifies the size of the data placed into 
 * <i>lpBuffer</i>. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter points to the number of bytes required to hold the requested information.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetqueryoptiona
 * @since windows5.0
 */
export InternetQueryOptionA(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetQueryOptionA", hInternetMarshal, hInternet, "uint", dwOption, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Queries an Internet option on the specified handle. (Unicode)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return the <b>ERROR_INVALID_PARAMETER</b> if an option flag that is invalid for the specified handle type is passed to the 
 * <i>dwOption</i> parameter.
 * 
 * For more  information, see  
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/setting-and-retrieving-internet-options">Setting and Retrieving Internet Options</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetQueryOption as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle on which to query information.
 * @param {Integer} dwOption Internet option to be queried. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
 * @param {Integer} lpBuffer Pointer to a buffer that receives the option setting. Strings returned by 
 * <b>InternetQueryOption</b> are globally allocated, so the calling application must  free them when it  is finished using them.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of 
 * <i>lpBuffer</i>, in bytes.  When 
 * <b>InternetQueryOption</b> returns, 
 * <i>lpdwBufferLength</i> specifies the size of the data placed into 
 * <i>lpBuffer</i>. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter points to the number of bytes required to hold the requested information.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetqueryoptionw
 * @since windows5.0
 */
export InternetQueryOptionW(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetQueryOptionW", hInternetMarshal, hInternet, "uint", dwOption, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets an Internet option. (ANSI)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return the error <b>ERROR_INVALID_PARAMETER</b> if an option flag that cannot be set is specified.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/setting-and-retrieving-internet-options">Setting and Retrieving Internet Options</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetOption as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle on which to set information.
 * @param {Integer} dwOption Internet option to be set. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
 * @param {Pointer<Void>} lpBuffer Pointer to a buffer that contains the option setting.
 * @param {Integer} dwBufferLength Size of the 
 * <i>lpBuffer</i> buffer.  If 
 * <i>lpBuffer</i> contains a string, 
 * the size is in <b>TCHARs</b>.  If 
 * <i>lpBuffer</i> contains anything other than a string, 
 * the size is in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetoptiona
 * @since windows5.0
 */
export InternetSetOptionA(hInternet, dwOption, lpBuffer, dwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetOptionA", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets an Internet option. (Unicode)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return the error <b>ERROR_INVALID_PARAMETER</b> if an option flag that cannot be set is specified.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/setting-and-retrieving-internet-options">Setting and Retrieving Internet Options</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetOption as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Handle on which to set information.
 * @param {Integer} dwOption Internet option to be set. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
 * @param {Pointer<Void>} lpBuffer Pointer to a buffer that contains the option setting.
 * @param {Integer} dwBufferLength Size of the 
 * <i>lpBuffer</i> buffer.  If 
 * <i>lpBuffer</i> contains a string, 
 * the size is in <b>TCHARs</b>.  If 
 * <i>lpBuffer</i> contains anything other than a string, 
 * the size is in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetoptionw
 * @since windows5.0
 */
export InternetSetOptionW(hInternet, dwOption, lpBuffer, dwBufferLength) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetOptionW", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Not supported.Implemented only as a stub that calls the InternetSetOption function; InternetSetOptionEx has no functionality of its own. Do not use this function at this time. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetOptionEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Unused.
 * @param {Integer} dwOption Unused.
 * @param {Pointer<Void>} lpBuffer Unused.
 * @param {Integer} dwBufferLength Unused.
 * @param {Integer} dwFlags Unused.
 * @returns {BOOL} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetoptionexa
 * @since windows5.0
 */
export InternetSetOptionExA(hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetSetOptionExA", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "uint", dwFlags, BOOL)
    return result
}

/**
 * Not supported.Implemented only as a stub that calls the InternetSetOption function; InternetSetOptionEx has no functionality of its own. Do not use this function at this time. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetOptionEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet Unused.
 * @param {Integer} dwOption Unused.
 * @param {Pointer<Void>} lpBuffer Unused.
 * @param {Integer} dwBufferLength Unused.
 * @param {Integer} dwFlags Unused.
 * @returns {BOOL} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetoptionexw
 * @since windows5.0
 */
export InternetSetOptionExW(hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetSetOptionExW", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "uint", dwFlags, BOOL)
    return result
}

/**
 * Places a lock on the file that is being used.
 * @remarks
 * If the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle passed to 
 * <i>hInternet</i> was created using 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_NO_CACHE_WRITE</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_DONT_CACHE</a>, the function creates a temporary file with the extension .tmp, unless it is an HTTPS resource. If the handle was created using <b>INTERNET_FLAG_NO_CACHE_WRITE</b> or <b>INTERNET_FLAG_DONT_CACHE</b> and it is accessing an HTTPS resource, 
 * <b>InternetLockRequestFile</b> fails.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet Handle returned by 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
 * @param {Pointer<HANDLE>} lphLockRequestInfo Pointer to a handle that receives the lock request handle.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetlockrequestfile
 * @since windows5.0
 */
export InternetLockRequestFile(hInternet, lphLockRequestInfo) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetLockRequestFile", hInternetMarshal, hInternet, HANDLE.Ptr, lphLockRequestInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Unlocks a file that was locked using InternetLockRequestFile.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HANDLE} hLockRequestInfo Handle to a lock request that was returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetlockrequestfile">InternetLockRequestFile</a>.
 * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetunlockrequestfile
 * @since windows5.0
 */
export InternetUnlockRequestFile(hLockRequestInfo) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetUnlockRequestFile", HANDLE, hLockRequestInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the last error description or server response on the thread calling this function. (ANSI)
 * @remarks
 * The FTP protocols can return additional text information along with most errors. This extended error information can be retrieved by using the 
 * <b>InternetGetLastResponseInfo</b> function whenever 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_INTERNET_EXTENDED_ERROR</a> (occurring after an unsuccessful function call).
 * 
 * The buffer pointed to by 
 * <i>lpszBuffer</i> must be large enough to hold both the error string and a zero terminator at the end of the string. However, note that the value returned in 
 * <i>lpdwBufferLength</i> does not include the terminating zero.
 * 
 * <b>InternetGetLastResponseInfo</b> can be called multiple times until another function is called on this thread. When another function is called, the internal buffer that is storing the last response information is cleared.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetLastResponseInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} lpdwError Pointer to a variable that receives an error message pertaining to the operation that failed.
 * @param {PSTR} lpszBuffer Pointer to a buffer that receives the error text.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
 * <i>lpszBuffer</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the string written to the buffer, not including the terminating zero.
 * @returns {BOOL} Returns <b>TRUE</b> if error text was successfully written to the buffer, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the buffer is too small to hold all the error text, 
 * <b>GetLastError</b> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the 
 * <i>lpdwBufferLength</i> parameter contains the minimum buffer size required to return all the error text.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetlastresponseinfoa
 * @since windows5.0
 */
export InternetGetLastResponseInfoA(lpdwError, lpszBuffer, lpdwBufferLength) {
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwErrorMarshal := lpdwError is VarRef ? "uint*" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetLastResponseInfoA", lpdwErrorMarshal, lpdwError, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the last error description or server response on the thread calling this function. (Unicode)
 * @remarks
 * The FTP protocols can return additional text information along with most errors. This extended error information can be retrieved by using the 
 * <b>InternetGetLastResponseInfo</b> function whenever 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_INTERNET_EXTENDED_ERROR</a> (occurring after an unsuccessful function call).
 * 
 * The buffer pointed to by 
 * <i>lpszBuffer</i> must be large enough to hold both the error string and a zero terminator at the end of the string. However, note that the value returned in 
 * <i>lpdwBufferLength</i> does not include the terminating zero.
 * 
 * <b>InternetGetLastResponseInfo</b> can be called multiple times until another function is called on this thread. When another function is called, the internal buffer that is storing the last response information is cleared.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetLastResponseInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Integer>} lpdwError Pointer to a variable that receives an error message pertaining to the operation that failed.
 * @param {PWSTR} lpszBuffer Pointer to a buffer that receives the error text.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
 * <i>lpszBuffer</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the string written to the buffer, not including the terminating zero.
 * @returns {BOOL} Returns <b>TRUE</b> if error text was successfully written to the buffer, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the buffer is too small to hold all the error text, 
 * <b>GetLastError</b> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the 
 * <i>lpdwBufferLength</i> parameter contains the minimum buffer size required to return all the error text.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetlastresponseinfow
 * @since windows5.0
 */
export InternetGetLastResponseInfoW(lpdwError, lpszBuffer, lpdwBufferLength) {
    lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

    lpdwErrorMarshal := lpdwError is VarRef ? "uint*" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetLastResponseInfoW", lpdwErrorMarshal, lpdwError, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetSetStatusCallbackA (ANSI) function sets up a callback function that WinINet functions can call as progress is made during an operation.
 * @remarks
 * Both synchronous and asynchronous functions use the callback function to indicate the progress of the request, such as resolving a name, connecting to a server, and so on. The callback function is required for an asynchronous operation. The asynchronous request will call back to the application with INTERNET_STATUS_REQUEST_COMPLETE to indicate the request has been completed.
 * 
 * A callback function can be set on any handle, and is inherited by derived handles. A callback function can be changed using 
 * <b>InternetSetStatusCallback</b>, providing there are no pending requests that need to use the previous callback value. Note, however, that changing the callback function on a handle does not change the callbacks on derived handles, such as that returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>. You must change the callback function at each level.
 * 
 * Many of the WinINet functions perform several operations on the network. Each operation can take time to complete, and each can fail.
 * 
 * It is sometimes desirable to display status information during a long-term operation. You can display status information by setting up an Internet status callback function that cannot be removed as long as any callbacks or any asynchronous functions are pending.
 * 
 * After initiating 
 * <b>InternetSetStatusCallback</b>, the callback function can be accessed from within any WinINet function for monitoring time-intensive network operations.
 * 
 * <b>Note</b>  The callback function specified in the <i>lpfnInternetCallback</i> parameter will not be called on asynchronous operations for the request handle when the <i>dwContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>), or the connection handle when the <i>dwContext</i> handle of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>).
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetStatusCallback as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet The handle for which the callback is set.
 * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
 * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetstatuscallbacka
 */
export InternetSetStatusCallbackA(hInternet, lpfnInternetCallback) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetSetStatusCallbackA", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, IntPtr)
    return result
}

/**
 * The InternetSetStatusCallbackW (Unicode) function sets up a callback function that WinINet functions can call as progress is made during an operation.
 * @remarks
 * Both synchronous and asynchronous functions use the callback function to indicate the progress of the request, such as resolving a name, connecting to a server, and so on. The callback function is required for an asynchronous operation. The asynchronous request will call back to the application with INTERNET_STATUS_REQUEST_COMPLETE to indicate the request has been completed.
 * 
 * A callback function can be set on any handle, and is inherited by derived handles. A callback function can be changed using 
 * <b>InternetSetStatusCallback</b>, providing there are no pending requests that need to use the previous callback value. Note, however, that changing the callback function on a handle does not change the callbacks on derived handles, such as that returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>. You must change the callback function at each level.
 * 
 * Many of the WinINet functions perform several operations on the network. Each operation can take time to complete, and each can fail.
 * 
 * It is sometimes desirable to display status information during a long-term operation. You can display status information by setting up an Internet status callback function that cannot be removed as long as any callbacks or any asynchronous functions are pending.
 * 
 * After initiating 
 * <b>InternetSetStatusCallback</b>, the callback function can be accessed from within any WinINet function for monitoring time-intensive network operations.
 * 
 * <b>Note</b>  The callback function specified in the <i>lpfnInternetCallback</i> parameter will not be called on asynchronous operations for the request handle when the <i>dwContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>), or the connection handle when the <i>dwContext</i> handle of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>).
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetStatusCallback as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hInternet The handle for which the callback is set.
 * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
 * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetstatuscallbackw
 */
export InternetSetStatusCallbackW(hInternet, lpfnInternetCallback) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetSetStatusCallbackW", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, IntPtr)
    return result
}

/**
 * Sets up a callback function that WinINet functions can call as progress is made during an operation.
 * @remarks
 * Both synchronous and asynchronous functions use the callback function to indicate the progress of the request, such as resolving a name, connecting to a server, and so on. The callback function is required for an asynchronous operation. The asynchronous request will call back to the application with INTERNET_STATUS_REQUEST_COMPLETE to indicate the request has been completed.
 * 
 * A callback function can be set on any handle, and is inherited by derived handles. A callback function can be changed using 
 * <b>InternetSetStatusCallback</b>, providing there are no pending requests that need to use the previous callback value. Note, however, that changing the callback function on a handle does not change the callbacks on derived handles, such as that returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>. You must change the callback function at each level.
 * 
 * Many of the WinINet functions perform several operations on the network. Each operation can take time to complete, and each can fail.
 * 
 * It is sometimes desirable to display status information during a long-term operation. You can display status information by setting up an Internet status callback function that cannot be removed as long as any callbacks or any asynchronous functions are pending.
 * 
 * After initiating 
 * <b>InternetSetStatusCallback</b>, the callback function can be accessed from within any WinINet function for monitoring time-intensive network operations.
 * 
 * <b>Note</b>  The callback function specified in the <i>lpfnInternetCallback</i> parameter will not be called on asynchronous operations for the request handle when the <i>dwContext</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>), or the connection handle when the <i>dwContext</i> handle of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> is set to zero (<b>INTERNET_NO_CALLBACK</b>).
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hInternet The handle for which the callback is set.
 * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
 * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetstatuscallback
 * @since windows5.0
 */
export InternetSetStatusCallback(hInternet, lpfnInternetCallback) {
    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetSetStatusCallback", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, IntPtr)
    return result
}

/**
 * Searches the specified directory of the given FTP session. File and directory entries are returned to the application in the WIN32_FIND_DATA structure. (ANSI)
 * @remarks
 * For 
 * <b>FtpFindFirstFile</b>, file times returned in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure are in the local time zone, not in a coordinated universal time (UTC) format.
 * 
 * <b>FtpFindFirstFile</b> is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function. Note, however, that only one 
 * <b>FtpFindFirstFile</b> can occur at a time within a given FTP session. The enumerations, therefore, are correlated with the FTP session handle. This is because the FTP protocol allows only a single directory enumeration per session.
 * 
 * After calling 
 * <b>FtpFindFirstFile</b> and until calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>, the application cannot call 
 * <b>FtpFindFirstFile</b> again on the given FTP session handle. If a call is made to 
 * <b>FtpFindFirstFile</b> on that handle, the function  fails with 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_FTP_TRANSFER_IN_PROGRESS</a>. After the calling application has finished using the 
 * <b>HINTERNET</b> handle returned by 
 * <b>FtpFindFirstFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * After beginning a directory enumeration with 
 * <b>FtpFindFirstFile</b>, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function can be used to continue the enumeration.
 * 
 * Because the FTP protocol provides no standard means of enumerating, some of the common information about files, such as file creation date and time, is not always available or correct. When this happens, 
 * <b>FtpFindFirstFile</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> fill in unavailable information with a best guess based on available information. For example, creation and last access dates are often  the same as the file's modification date.
 * 
 * The application cannot call 
 * <b>FtpFindFirstFile</b> between calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpFindFirstFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session returned from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PSTR} lpszSearchFile Pointer to a <b>null</b>-terminated string that specifies a valid directory path or file name for the FTP server's file system. The string can contain wildcards, but no blank spaces are allowed. If the value of 
 * <i>lpszSearchFile</i> is <b>NULL</b> or if it is an empty string, the function  finds the first file in the current directory on the server.
 * @param {Pointer<WIN32_FIND_DATAA>} lpFindFileData Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives information about the found file or directory.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that specifies the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {Pointer<Void>} Returns a valid handle for the request if the directory enumeration was started successfully, or returns <b>NULL</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If <b>GetLastError</b> returns ERROR_INTERNET_EXTENDED_ERROR, as in the case where the function finds no matching files, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> function to retrieve the extended error text, as documented in <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-c-handling-errors">Handling Errors</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpfindfirstfilea
 * @since windows5.0
 */
export FtpFindFirstFileA(hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext) {
    lpszSearchFile := lpszSearchFile is String ? StrPtr(lpszSearchFile) : lpszSearchFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpFindFirstFileA", hConnectMarshal, hConnect, "ptr", lpszSearchFile, WIN32_FIND_DATAA.Ptr, lpFindFileData, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Searches the specified directory of the given FTP session. File and directory entries are returned to the application in the WIN32_FIND_DATA structure. (Unicode)
 * @remarks
 * For 
 * <b>FtpFindFirstFile</b>, file times returned in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure are in the local time zone, not in a coordinated universal time (UTC) format.
 * 
 * <b>FtpFindFirstFile</b> is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function. Note, however, that only one 
 * <b>FtpFindFirstFile</b> can occur at a time within a given FTP session. The enumerations, therefore, are correlated with the FTP session handle. This is because the FTP protocol allows only a single directory enumeration per session.
 * 
 * After calling 
 * <b>FtpFindFirstFile</b> and until calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>, the application cannot call 
 * <b>FtpFindFirstFile</b> again on the given FTP session handle. If a call is made to 
 * <b>FtpFindFirstFile</b> on that handle, the function  fails with 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_FTP_TRANSFER_IN_PROGRESS</a>. After the calling application has finished using the 
 * <b>HINTERNET</b> handle returned by 
 * <b>FtpFindFirstFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * After beginning a directory enumeration with 
 * <b>FtpFindFirstFile</b>, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function can be used to continue the enumeration.
 * 
 * Because the FTP protocol provides no standard means of enumerating, some of the common information about files, such as file creation date and time, is not always available or correct. When this happens, 
 * <b>FtpFindFirstFile</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> fill in unavailable information with a best guess based on available information. For example, creation and last access dates are often  the same as the file's modification date.
 * 
 * The application cannot call 
 * <b>FtpFindFirstFile</b> between calls to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpFindFirstFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session returned from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PWSTR} lpszSearchFile Pointer to a <b>null</b>-terminated string that specifies a valid directory path or file name for the FTP server's file system. The string can contain wildcards, but no blank spaces are allowed. If the value of 
 * <i>lpszSearchFile</i> is <b>NULL</b> or if it is an empty string, the function  finds the first file in the current directory on the server.
 * @param {Pointer<WIN32_FIND_DATAW>} lpFindFileData Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives information about the found file or directory.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that specifies the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {Pointer<Void>} Returns a valid handle for the request if the directory enumeration was started successfully, or returns <b>NULL</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If <b>GetLastError</b> returns ERROR_INTERNET_EXTENDED_ERROR, as in the case where the function finds no matching files, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> function to retrieve the extended error text, as documented in <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-c-handling-errors">Handling Errors</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpfindfirstfilew
 * @since windows5.0
 */
export FtpFindFirstFileW(hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext) {
    lpszSearchFile := lpszSearchFile is String ? StrPtr(lpszSearchFile) : lpszSearchFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpFindFirstFileW", hConnectMarshal, hConnect, "ptr", lpszSearchFile, WIN32_FIND_DATAW.Ptr, lpFindFileData, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a file from the FTP server and stores it under the specified file name, creating a new local file in the process. (ANSI)
 * @remarks
 * <b>FtpGetFile</b> is a high-level routine that handles all the bookkeeping and overhead associated with reading a file from an FTP server and storing it locally. An application that needs to retrieve file data only or that requires close control over the file transfer should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> functions.
 * 
 * If the 
 * <i>dwFlags</i> parameter specifies <b>FTP_TRANSFER_TYPE_ASCII</b>, translation of the file data converts control and formatting characters to local equivalents. The default transfer is binary mode, where the file is downloaded in the same format as it is stored on the server.
 * 
 * Both 
 * <i>lpszRemoteFile</i> and 
 * <i>lpszNewFile</i> can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpGetFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszRemoteFile Pointer to a null-terminated string that contains the name of the file to be retrieved.
 * @param {PSTR} lpszNewFile Pointer to a null-terminated string that contains the name of the file to be created on the local system.
 * @param {BOOL} fFailIfExists Indicates whether the function should proceed if a local file of the specified name already exists. If 
 * <i>fFailIfExists</i> is <b>TRUE</b> and the local file exists, 
 * <b>FtpGetFile</b> fails.
 * @param {Integer} dwFlagsAndAttributes File attributes for the new file. This parameter can be any combination of the FILE_ATTRIBUTE_* flags used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
 * @param {Integer} dwFlags Controls how the function will handle the file download. The first set of flag values indicates the conditions under which the transfer occurs. These transfer type flags can be used in combination with the second set of flags that control caching.
 * 
 * 
 * The application can select one of these transfer type values.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_ASCII"></a><a id="ftp_transfer_type_ascii"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_ASCII</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file using FTP's ASCII (Type A) transfer method. Control and formatting information is converted to local equivalents.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_BINARY"></a><a id="ftp_transfer_type_binary"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_BINARY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file using FTP's Image (Type I) transfer method. The file is transferred exactly as it exists with no changes. This is the default transfer method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_UNKNOWN"></a><a id="ftp_transfer_type_unknown"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Defaults to FTP_TRANSFER_TYPE_BINARY.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_ASCII"></a><a id="internet_flag_transfer_ascii"></a><dl>
 * <dt><b>INTERNET_FLAG_TRANSFER_ASCII</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file as ASCII.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_BINARY"></a><a id="internet_flag_transfer_binary"></a><dl>
 * <dt><b>INTERNET_FLAG_TRANSFER_BINARY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file as binary.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * The following flags determine how the caching of this file will be done. Any combination of the following flags can be used with the transfer type flag.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_HYPERLINK"></a><a id="internet_flag_hyperlink"></a><dl>
 * <dt><b>INTERNET_FLAG_HYPERLINK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a reload if there was no Expires time and no LastModified time returned from the server when determining whether to reload the item from the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_NEED_FILE"></a><a id="internet_flag_need_file"></a><dl>
 * <dt><b>INTERNET_FLAG_NEED_FILE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Causes a temporary file to be created if the file cannot be cached.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RELOAD"></a><a id="internet_flag_reload"></a><dl>
 * <dt><b>INTERNET_FLAG_RELOAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a download of the requested file, object, or directory listing from the origin server, not from the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RESYNCHRONIZE"></a><a id="internet_flag_resynchronize"></a><dl>
 * <dt><b>INTERNET_FLAG_RESYNCHRONIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Reloads HTTP resources if the resource has been modified since the last time it was downloaded. All FTP resources are reloaded.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Gopher resources are also reloaded.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpgetfilea
 * @since windows5.0
 */
export FtpGetFileA(hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
    lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
    lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpGetFileA", hConnectMarshal, hConnect, "ptr", lpszRemoteFile, "ptr", lpszNewFile, BOOL, fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a file from the FTP server and stores it under the specified file name, creating a new local file in the process. (Unicode)
 * @remarks
 * <b>FtpGetFile</b> is a high-level routine that handles all the bookkeeping and overhead associated with reading a file from an FTP server and storing it locally. An application that needs to retrieve file data only or that requires close control over the file transfer should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> functions.
 * 
 * If the 
 * <i>dwFlags</i> parameter specifies <b>FTP_TRANSFER_TYPE_ASCII</b>, translation of the file data converts control and formatting characters to local equivalents. The default transfer is binary mode, where the file is downloaded in the same format as it is stored on the server.
 * 
 * Both 
 * <i>lpszRemoteFile</i> and 
 * <i>lpszNewFile</i> can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpGetFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszRemoteFile Pointer to a null-terminated string that contains the name of the file to be retrieved.
 * @param {PWSTR} lpszNewFile Pointer to a null-terminated string that contains the name of the file to be created on the local system.
 * @param {BOOL} fFailIfExists Indicates whether the function should proceed if a local file of the specified name already exists. If 
 * <i>fFailIfExists</i> is <b>TRUE</b> and the local file exists, 
 * <b>FtpGetFile</b> fails.
 * @param {Integer} dwFlagsAndAttributes File attributes for the new file. This parameter can be any combination of the FILE_ATTRIBUTE_* flags used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
 * @param {Integer} dwFlags Controls how the function will handle the file download. The first set of flag values indicates the conditions under which the transfer occurs. These transfer type flags can be used in combination with the second set of flags that control caching.
 * 
 * 
 * The application can select one of these transfer type values.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_ASCII"></a><a id="ftp_transfer_type_ascii"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_ASCII</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file using FTP's ASCII (Type A) transfer method. Control and formatting information is converted to local equivalents.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_BINARY"></a><a id="ftp_transfer_type_binary"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_BINARY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file using FTP's Image (Type I) transfer method. The file is transferred exactly as it exists with no changes. This is the default transfer method.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FTP_TRANSFER_TYPE_UNKNOWN"></a><a id="ftp_transfer_type_unknown"></a><dl>
 * <dt><b>FTP_TRANSFER_TYPE_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Defaults to FTP_TRANSFER_TYPE_BINARY.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_ASCII"></a><a id="internet_flag_transfer_ascii"></a><dl>
 * <dt><b>INTERNET_FLAG_TRANSFER_ASCII</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file as ASCII.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_BINARY"></a><a id="internet_flag_transfer_binary"></a><dl>
 * <dt><b>INTERNET_FLAG_TRANSFER_BINARY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Transfers the file as binary.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * The following flags determine how the caching of this file will be done. Any combination of the following flags can be used with the transfer type flag.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_HYPERLINK"></a><a id="internet_flag_hyperlink"></a><dl>
 * <dt><b>INTERNET_FLAG_HYPERLINK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a reload if there was no Expires time and no LastModified time returned from the server when determining whether to reload the item from the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_NEED_FILE"></a><a id="internet_flag_need_file"></a><dl>
 * <dt><b>INTERNET_FLAG_NEED_FILE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Causes a temporary file to be created if the file cannot be cached.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RELOAD"></a><a id="internet_flag_reload"></a><dl>
 * <dt><b>INTERNET_FLAG_RELOAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Forces a download of the requested file, object, or directory listing from the origin server, not from the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RESYNCHRONIZE"></a><a id="internet_flag_resynchronize"></a><dl>
 * <dt><b>INTERNET_FLAG_RESYNCHRONIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Reloads HTTP resources if the resource has been modified since the last time it was downloaded. All FTP resources are reloaded.
 * 
 * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Gopher resources are also reloaded.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpgetfilew
 * @since windows5.0
 */
export FtpGetFileW(hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
    lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
    lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpGetFileW", hConnectMarshal, hConnect, "ptr", lpszRemoteFile, "ptr", lpszNewFile, BOOL, fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Stores a file on the FTP server. (ANSI)
 * @remarks
 * <b>FtpPutFile</b> is a high-level routine that handles all the bookkeeping and overhead associated with reading a file locally and storing it on an FTP server. An application that needs to send file data only, or that requires close control over the file transfer, should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetwritefile">InternetWriteFile</a> functions.
 * 
 * If the 
 * <i>dwFlags</i> parameter specifies <b>FILE_TRANSFER_TYPE_ASCII</b>, translation of the file data converts control and formatting characters to local equivalents.
 * 
 * Both 
 * <i>lpszNewRemoteFile</i> and 
 * <i>lpszLocalFile</i> can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpPutFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszLocalFile Pointer to a null-terminated string that contains the name of the file to be sent from the local system.
 * @param {PSTR} lpszNewRemoteFile Pointer to a null-terminated string that contains the name of the file to be created on the remote system.
 * @param {FTP_FLAGS} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that control how the caching of the file will be controlled.
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpputfilea
 * @since windows5.0
 */
export FtpPutFileA(hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
    lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
    lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpPutFileA", hConnectMarshal, hConnect, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, FTP_FLAGS, dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Stores a file on the FTP server. (Unicode)
 * @remarks
 * <b>FtpPutFile</b> is a high-level routine that handles all the bookkeeping and overhead associated with reading a file locally and storing it on an FTP server. An application that needs to send file data only, or that requires close control over the file transfer, should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetwritefile">InternetWriteFile</a> functions.
 * 
 * If the 
 * <i>dwFlags</i> parameter specifies <b>FILE_TRANSFER_TYPE_ASCII</b>, translation of the file data converts control and formatting characters to local equivalents.
 * 
 * Both 
 * <i>lpszNewRemoteFile</i> and 
 * <i>lpszLocalFile</i> can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpPutFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszLocalFile Pointer to a null-terminated string that contains the name of the file to be sent from the local system.
 * @param {PWSTR} lpszNewRemoteFile Pointer to a null-terminated string that contains the name of the file to be created on the remote system.
 * @param {FTP_FLAGS} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that control how the caching of the file will be controlled.
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpputfilew
 * @since windows5.0
 */
export FtpPutFileW(hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
    lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
    lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpPutFileW", hConnectMarshal, hConnect, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, FTP_FLAGS, dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Pointer<Void>} hFtpSession 
 * @param {PSTR} lpszRemoteFile 
 * @param {PWSTR} lpszNewFile 
 * @param {BOOL} fFailIfExists 
 * @param {Integer} dwFlagsAndAttributes 
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext 
 * @returns {BOOL} 
 */
export FtpGetFileEx(hFtpSession, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
    lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
    lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

    hFtpSessionMarshal := hFtpSession is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\FtpGetFileEx", hFtpSessionMarshal, hFtpSession, "ptr", lpszRemoteFile, "ptr", lpszNewFile, BOOL, fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hFtpSession 
 * @param {PWSTR} lpszLocalFile 
 * @param {PSTR} lpszNewRemoteFile 
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext 
 * @returns {BOOL} 
 */
export FtpPutFileEx(hFtpSession, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
    lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
    lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

    hFtpSessionMarshal := hFtpSession is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\FtpPutFileEx", hFtpSessionMarshal, hFtpSession, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, "uint", dwFlags, "ptr", dwContext, BOOL)
    return result
}

/**
 * Deletes a file stored on the FTP server. (ANSI)
 * @remarks
 * The 
 * <i>lpszFileName</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpDeleteFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
 * @param {PSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be deleted.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpdeletefilea
 * @since windows5.0
 */
export FtpDeleteFileA(hConnect, lpszFileName) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpDeleteFileA", hConnectMarshal, hConnect, "ptr", lpszFileName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Deletes a file stored on the FTP server. (Unicode)
 * @remarks
 * The 
 * <i>lpszFileName</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpDeleteFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
 * @param {PWSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be deleted.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpdeletefilew
 * @since windows5.0
 */
export FtpDeleteFileW(hConnect, lpszFileName) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpDeleteFileW", hConnectMarshal, hConnect, "ptr", lpszFileName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Renames a file stored on the FTP server. (ANSI)
 * @remarks
 * The 
 * <i>lpszExisting</i> and 
 * <i>lpszNew</i> parameters can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpRenameFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszExisting Pointer to a null-terminated string that contains the name of the file to be renamed.
 * @param {PSTR} lpszNew Pointer to a null-terminated string that contains the new name for the remote file.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftprenamefilea
 * @since windows5.0
 */
export FtpRenameFileA(hConnect, lpszExisting, lpszNew) {
    lpszExisting := lpszExisting is String ? StrPtr(lpszExisting) : lpszExisting
    lpszNew := lpszNew is String ? StrPtr(lpszNew) : lpszNew

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpRenameFileA", hConnectMarshal, hConnect, "ptr", lpszExisting, "ptr", lpszNew, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Renames a file stored on the FTP server. (Unicode)
 * @remarks
 * The 
 * <i>lpszExisting</i> and 
 * <i>lpszNew</i> parameters can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpRenameFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszExisting Pointer to a null-terminated string that contains the name of the file to be renamed.
 * @param {PWSTR} lpszNew Pointer to a null-terminated string that contains the new name for the remote file.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftprenamefilew
 * @since windows5.0
 */
export FtpRenameFileW(hConnect, lpszExisting, lpszNew) {
    lpszExisting := lpszExisting is String ? StrPtr(lpszExisting) : lpszExisting
    lpszNew := lpszNew is String ? StrPtr(lpszNew) : lpszNew

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpRenameFileW", hConnectMarshal, hConnect, "ptr", lpszExisting, "ptr", lpszNew, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initiates access to a remote file on an FTP server for reading or writing. (ANSI)
 * @remarks
 * After calling 
 * <b>FtpOpenFile</b> and until calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>, all other calls to FTP functions on the same FTP session handle will fail and set the error message to 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_FTP_TRANSFER_IN_PROGRESS</a>. After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>FtpOpenFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Only one file can be open in a single FTP session. Therefore, no file handle is returned and the application simply uses the FTP session handle when necessary.
 * 
 * The 
 * <i>lpszFileName</i> parameter can be either a partially or fully qualified file name relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpOpenFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be accessed.
 * @param {Integer} dwAccess File  access. This parameter can be <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, but not both.
 * @param {FTP_FLAGS} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that indicate how the caching of the file will be controlled.
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is only used if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> otherwise. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpopenfilea
 * @since windows5.0
 */
export FtpOpenFileA(hConnect, lpszFileName, dwAccess, dwFlags, dwContext) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpOpenFileA", hConnectMarshal, hConnect, "ptr", lpszFileName, "uint", dwAccess, FTP_FLAGS, dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initiates access to a remote file on an FTP server for reading or writing. (Unicode)
 * @remarks
 * After calling 
 * <b>FtpOpenFile</b> and until calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a>, all other calls to FTP functions on the same FTP session handle will fail and set the error message to 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_FTP_TRANSFER_IN_PROGRESS</a>. After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>FtpOpenFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Only one file can be open in a single FTP session. Therefore, no file handle is returned and the application simply uses the FTP session handle when necessary.
 * 
 * The 
 * <i>lpszFileName</i> parameter can be either a partially or fully qualified file name relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpOpenFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be accessed.
 * @param {Integer} dwAccess File  access. This parameter can be <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, but not both.
 * @param {FTP_FLAGS} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that indicate how the caching of the file will be controlled.
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is only used if the application has already called 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
 * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> otherwise. To retrieve a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpopenfilew
 * @since windows5.0
 */
export FtpOpenFileW(hConnect, lpszFileName, dwAccess, dwFlags, dwContext) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpOpenFileW", hConnectMarshal, hConnect, "ptr", lpszFileName, "uint", dwAccess, FTP_FLAGS, dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a new directory on the FTP server. (ANSI)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpCreateDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
 * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be created. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to create a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpcreatedirectorya
 * @since windows5.0
 */
export FtpCreateDirectoryA(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpCreateDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a new directory on the FTP server. (Unicode)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpCreateDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
 * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be created. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to create a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpcreatedirectoryw
 * @since windows5.0
 */
export FtpCreateDirectoryW(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpCreateDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Removes the specified directory on the FTP server. (ANSI)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory, instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpRemoveDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be removed. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to remove a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpremovedirectorya
 * @since windows5.0
 */
export FtpRemoveDirectoryA(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpRemoveDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Removes the specified directory on the FTP server. (Unicode)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory, instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpRemoveDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be removed. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to remove a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpremovedirectoryw
 * @since windows5.0
 */
export FtpRemoveDirectoryW(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpRemoveDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Changes to a different working directory on the FTP server. (ANSI)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory, instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpSetCurrentDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to become the current working directory. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to change a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpsetcurrentdirectorya
 * @since windows5.0
 */
export FtpSetCurrentDirectoryA(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpSetCurrentDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Changes to a different working directory on the FTP server. (Unicode)
 * @remarks
 * An application should use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpgetcurrentdirectorya">FtpGetCurrentDirectory</a> to determine the remote site's current working directory, instead of assuming that the remote system uses a hierarchical naming scheme for directories.
 * 
 * The 
 * <i>lpszDirectory</i> parameter can be either partially or fully qualified file names relative to the current directory.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpSetCurrentDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to become the current working directory. This can be either a fully qualified path or a name relative to the current directory.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to change a directory, use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpsetcurrentdirectoryw
 * @since windows5.0
 */
export FtpSetCurrentDirectoryW(hConnect, lpszDirectory) {
    lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpSetCurrentDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current directory for the specified FTP session. (ANSI)
 * @remarks
 * If the 
 * <i>lpszCurrentDirectory</i> buffer is not large enough, 
 * <i>lpdwCurrentDirectory</i> receives the number of bytes required to retrieve the full, current directory name.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpGetCurrentDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PSTR} lpszCurrentDirectory Pointer to a null-terminated string that receives the absolute path of the current directory.
 * @param {Pointer<Integer>} lpdwCurrentDirectory Pointer to a variable that specifies the length of the buffer, in <b>TCHARs</b>. The buffer length must include room for a terminating null character. Using a length of <b>MAX_PATH</b> is sufficient for all paths. When the function returns, the variable receives the number of characters copied into the buffer.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpgetcurrentdirectorya
 * @since windows5.0
 */
export FtpGetCurrentDirectoryA(hConnect, lpszCurrentDirectory, lpdwCurrentDirectory) {
    lpszCurrentDirectory := lpszCurrentDirectory is String ? StrPtr(lpszCurrentDirectory) : lpszCurrentDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lpdwCurrentDirectoryMarshal := lpdwCurrentDirectory is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpGetCurrentDirectoryA", hConnectMarshal, hConnect, "ptr", lpszCurrentDirectory, lpdwCurrentDirectoryMarshal, lpdwCurrentDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current directory for the specified FTP session. (Unicode)
 * @remarks
 * If the 
 * <i>lpszCurrentDirectory</i> buffer is not large enough, 
 * <i>lpdwCurrentDirectory</i> receives the number of bytes required to retrieve the full, current directory name.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpGetCurrentDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to an FTP session.
 * @param {PWSTR} lpszCurrentDirectory Pointer to a null-terminated string that receives the absolute path of the current directory.
 * @param {Pointer<Integer>} lpdwCurrentDirectory Pointer to a variable that specifies the length of the buffer, in <b>TCHARs</b>. The buffer length must include room for a terminating null character. Using a length of <b>MAX_PATH</b> is sufficient for all paths. When the function returns, the variable receives the number of characters copied into the buffer.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpgetcurrentdirectoryw
 * @since windows5.0
 */
export FtpGetCurrentDirectoryW(hConnect, lpszCurrentDirectory, lpdwCurrentDirectory) {
    lpszCurrentDirectory := lpszCurrentDirectory is String ? StrPtr(lpszCurrentDirectory) : lpszCurrentDirectory

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lpdwCurrentDirectoryMarshal := lpdwCurrentDirectory is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpGetCurrentDirectoryW", hConnectMarshal, hConnect, "ptr", lpszCurrentDirectory, lpdwCurrentDirectoryMarshal, lpdwCurrentDirectory, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends commands directly to an FTP server. (ANSI)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can return 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_INTERNET_NO_DIRECT_ACCESS</a> if the client application is offline. If one or more of the parameters are invalid, 
 * <b>GetLastError</b> will return <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpCommand as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect A handle returned from a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {BOOL} fExpectResponse A Boolean value that indicates whether the application expects a data connection to be established by the FTP server. This must be set to <b>TRUE</b> if a data connection is expected, or <b>FALSE</b> otherwise.
 * @param {FTP_FLAGS} dwFlags 
 * @param {PSTR} lpszCommand A pointer to a string that contains the command to send to the FTP server.
 * @param {Pointer} dwContext A pointer to a variable that contains an application-defined value used to identify the application context in callback operations.
 * @param {Pointer<Pointer<Void>>} phFtpCommand A pointer to a handle that is created if a valid data socket is opened. The 
 * <i>fExpectResponse</i> parameter must be set to <b>TRUE</b> for 
 * <i>phFtpCommand</i> to be filled.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpcommanda
 * @since windows5.0
 */
export FtpCommandA(hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand) {
    lpszCommand := lpszCommand is String ? StrPtr(lpszCommand) : lpszCommand

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    phFtpCommandMarshal := phFtpCommand is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpCommandA", hConnectMarshal, hConnect, BOOL, fExpectResponse, FTP_FLAGS, dwFlags, "ptr", lpszCommand, "ptr", dwContext, phFtpCommandMarshal, phFtpCommand, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends commands directly to an FTP server. (Unicode)
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> can return 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/wininet-errors">ERROR_INTERNET_NO_DIRECT_ACCESS</a> if the client application is offline. If one or more of the parameters are invalid, 
 * <b>GetLastError</b> will return <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FtpCommand as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect A handle returned from a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {BOOL} fExpectResponse A Boolean value that indicates whether the application expects a data connection to be established by the FTP server. This must be set to <b>TRUE</b> if a data connection is expected, or <b>FALSE</b> otherwise.
 * @param {FTP_FLAGS} dwFlags 
 * @param {PWSTR} lpszCommand A pointer to a string that contains the command to send to the FTP server.
 * @param {Pointer} dwContext A pointer to a variable that contains an application-defined value used to identify the application context in callback operations.
 * @param {Pointer<Pointer<Void>>} phFtpCommand A pointer to a handle that is created if a valid data socket is opened. The 
 * <i>fExpectResponse</i> parameter must be set to <b>TRUE</b> for 
 * <i>phFtpCommand</i> to be filled.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpcommandw
 * @since windows5.0
 */
export FtpCommandW(hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand) {
    lpszCommand := lpszCommand is String ? StrPtr(lpszCommand) : lpszCommand

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    phFtpCommandMarshal := phFtpCommand is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FtpCommandW", hConnectMarshal, hConnect, BOOL, fExpectResponse, FTP_FLAGS, dwFlags, "ptr", lpszCommand, "ptr", dwContext, phFtpCommandMarshal, phFtpCommand, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the file size of the requested FTP resource.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hFile Handle returned from a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>.
 * @param {Pointer<Integer>} lpdwFileSizeHigh Pointer to the high-order unsigned long integer of the file size of the requested FTP resource.
 * @returns {Integer} Returns the low-order unsigned long integer of the file size of the requested FTP resource.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-ftpgetfilesize
 * @since windows5.0
 */
export FtpGetFileSize(hFile, lpdwFileSizeHigh) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
    lpdwFileSizeHighMarshal := lpdwFileSizeHigh is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\FtpGetFileSize", hFileMarshal, hFile, lpdwFileSizeHighMarshal, lpdwFileSizeHigh, UInt32)
    return result
}

/**
 * Creates a Gopher or Gopher+ locator string from the selector string's component parts. (ANSI)
 * @remarks
 * To retrieve information from a Gopher server, an application must first get a Gopher "locator" from the Gopher server.
 * 
 * The locator, which the application should treat as an opaque token, is normally used for calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> function to retrieve a specific piece of information.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherCreateLocator as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszHost Pointer to a <b>null</b>-terminated string that contains the name of the host, or a dotted-decimal IP address (such as 198.105.232.1).
 * @param {Integer} nServerPort Port number on which the Gopher server at 
 * <i>lpszHost</i> lives, in host byte order. If 
 * <i>nServerPort</i> is <b>INTERNET_INVALID_PORT_NUMBER</b>, the default Gopher port is used.
 * @param {PSTR} lpszDisplayString Pointer to a <b>null</b>-terminated string that contains the Gopher document or directory to be displayed. If this parameter is <b>NULL</b>, the function returns the default directory for the Gopher server.
 * @param {PSTR} lpszSelectorString Pointer to the selector string to send to the Gopher server in order to retrieve information. This parameter can be <b>NULL</b>.
 * @param {Integer} dwGopherType Determines whether 
 * <i>lpszSelectorString</i> refers to a directory or document, and whether the request is Gopher+ or Gopher. The default value, GOPHER_TYPE_DIRECTORY, is used if the value of 
 * <i>dwGopherType</i> is zero. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
 * @param {PSTR} lpszLocator Pointer to a buffer  that receives the locator string. If 
 * <i>lpszLocator</i> is <b>NULL</b>, 
 * <i>lpdwBufferLength</i> receives the necessary buffer length, but the function performs no other processing.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the length of the 
 * <i>lpszLocator</i> buffer, in characters. When the function returns, this parameter receives the number of characters written to the 
 * buffer. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter receives the number of characters required.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophercreatelocatora
 * @since windows5.0
 */
export GopherCreateLocatorA(lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength) {
    lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
    lpszDisplayString := lpszDisplayString is String ? StrPtr(lpszDisplayString) : lpszDisplayString
    lpszSelectorString := lpszSelectorString is String ? StrPtr(lpszSelectorString) : lpszSelectorString
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherCreateLocatorA", "ptr", lpszHost, "ushort", nServerPort, "ptr", lpszDisplayString, "ptr", lpszSelectorString, "uint", dwGopherType, "ptr", lpszLocator, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a Gopher or Gopher+ locator string from the selector string's component parts. (Unicode)
 * @remarks
 * To retrieve information from a Gopher server, an application must first get a Gopher "locator" from the Gopher server.
 * 
 * The locator, which the application should treat as an opaque token, is normally used for calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> function to retrieve a specific piece of information.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherCreateLocator as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszHost Pointer to a <b>null</b>-terminated string that contains the name of the host, or a dotted-decimal IP address (such as 198.105.232.1).
 * @param {Integer} nServerPort Port number on which the Gopher server at 
 * <i>lpszHost</i> lives, in host byte order. If 
 * <i>nServerPort</i> is <b>INTERNET_INVALID_PORT_NUMBER</b>, the default Gopher port is used.
 * @param {PWSTR} lpszDisplayString Pointer to a <b>null</b>-terminated string that contains the Gopher document or directory to be displayed. If this parameter is <b>NULL</b>, the function returns the default directory for the Gopher server.
 * @param {PWSTR} lpszSelectorString Pointer to the selector string to send to the Gopher server in order to retrieve information. This parameter can be <b>NULL</b>.
 * @param {Integer} dwGopherType Determines whether 
 * <i>lpszSelectorString</i> refers to a directory or document, and whether the request is Gopher+ or Gopher. The default value, GOPHER_TYPE_DIRECTORY, is used if the value of 
 * <i>dwGopherType</i> is zero. This can be one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
 * @param {PWSTR} lpszLocator Pointer to a buffer  that receives the locator string. If 
 * <i>lpszLocator</i> is <b>NULL</b>, 
 * <i>lpdwBufferLength</i> receives the necessary buffer length, but the function performs no other processing.
 * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the length of the 
 * <i>lpszLocator</i> buffer, in characters. When the function returns, this parameter receives the number of characters written to the 
 * buffer. If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter receives the number of characters required.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophercreatelocatorw
 * @since windows5.0
 */
export GopherCreateLocatorW(lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength) {
    lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
    lpszDisplayString := lpszDisplayString is String ? StrPtr(lpszDisplayString) : lpszDisplayString
    lpszSelectorString := lpszSelectorString is String ? StrPtr(lpszSelectorString) : lpszSelectorString
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherCreateLocatorW", "ptr", lpszHost, "ushort", nServerPort, "ptr", lpszDisplayString, "ptr", lpszSelectorString, "uint", dwGopherType, "ptr", lpszLocator, lpdwBufferLengthMarshal, lpdwBufferLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Parses a Gopher locator and determines its attributes. (ANSI)
 * @remarks
 * <b>GopherGetLocatorType</b> returns information about the item referenced by a Gopher locator. Note that it is possible for multiple attributes to be set on a file. For example, both <b>GOPHER_TYPE_TEXT_FILE</b> and <b>GOPHER_TYPE_GOPHER_PLUS</b> are set for a text file stored on a Gopher+ server.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherGetLocatorType as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszLocator Pointer to a null-terminated string that specifies the Gopher locator to be parsed.
 * @param {Pointer<Integer>} lpdwGopherType Pointer to a variable that receives the type of the locator. The type is a bitmask that consists of a combination of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophergetlocatortypea
 * @since windows5.0
 */
export GopherGetLocatorTypeA(lpszLocator, lpdwGopherType) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

    lpdwGopherTypeMarshal := lpdwGopherType is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherGetLocatorTypeA", "ptr", lpszLocator, lpdwGopherTypeMarshal, lpdwGopherType, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Parses a Gopher locator and determines its attributes. (Unicode)
 * @remarks
 * <b>GopherGetLocatorType</b> returns information about the item referenced by a Gopher locator. Note that it is possible for multiple attributes to be set on a file. For example, both <b>GOPHER_TYPE_TEXT_FILE</b> and <b>GOPHER_TYPE_GOPHER_PLUS</b> are set for a text file stored on a Gopher+ server.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherGetLocatorType as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszLocator Pointer to a null-terminated string that specifies the Gopher locator to be parsed.
 * @param {Pointer<Integer>} lpdwGopherType Pointer to a variable that receives the type of the locator. The type is a bitmask that consists of a combination of the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophergetlocatortypew
 * @since windows5.0
 */
export GopherGetLocatorTypeW(lpszLocator, lpdwGopherType) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

    lpdwGopherTypeMarshal := lpdwGopherType is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherGetLocatorTypeW", "ptr", lpszLocator, lpdwGopherTypeMarshal, lpdwGopherType, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Uses a Gopher locator and search criteria to create a session with the server and locate the requested documents, binary files, index servers, or directory trees. (ANSI)
 * @remarks
 * <b>GopherFindFirstFile</b> closely resembles the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function. It creates a connection with a Gopher server, and then returns a single structure containing information about the first Gopher object referenced by the locator string.
 * 
 * After calling 
 * <b>GopherFindFirstFile</b> to retrieve the first Gopher object in an enumeration, an application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function to retrieve subsequent Gopher objects.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>GopherFindFirstFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherFindFirstFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that contains the name of the item to locate. This can be one of the following: 
 * 					
 * 
 * <ul>
 * <li>Gopher locator returned by a previous call to this function or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function.</li>
 * <li><b>NULL</b> pointer or empty string indicating that the topmost information from a Gopher server is being returned.</li>
 * <li>Locator created by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophercreatelocatora">GopherCreateLocator</a> function.</li>
 * </ul>
 * @param {PSTR} lpszSearchString Pointer to a buffer that contains the strings to search, if this request is to an index server. Otherwise, this parameter should be <b>NULL</b>.
 * @param {Pointer<GOPHER_FIND_DATAA>} lpFindData Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure that receives the information retrieved by this function.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data.
 * @returns {Pointer<Void>} Returns a valid search handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gopherfindfirstfilea
 * @since windows5.0
 */
export GopherFindFirstFileA(hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszSearchString := lpszSearchString is String ? StrPtr(lpszSearchString) : lpszSearchString

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherFindFirstFileA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszSearchString, GOPHER_FIND_DATAA.Ptr, lpFindData, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Uses a Gopher locator and search criteria to create a session with the server and locate the requested documents, binary files, index servers, or directory trees. (Unicode)
 * @remarks
 * <b>GopherFindFirstFile</b> closely resembles the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function. It creates a connection with a Gopher server, and then returns a single structure containing information about the first Gopher object referenced by the locator string.
 * 
 * After calling 
 * <b>GopherFindFirstFile</b> to retrieve the first Gopher object in an enumeration, an application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function to retrieve subsequent Gopher objects.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>GopherFindFirstFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherFindFirstFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that contains the name of the item to locate. This can be one of the following: 
 * 					
 * 
 * <ul>
 * <li>Gopher locator returned by a previous call to this function or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function.</li>
 * <li><b>NULL</b> pointer or empty string indicating that the topmost information from a Gopher server is being returned.</li>
 * <li>Locator created by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophercreatelocatora">GopherCreateLocator</a> function.</li>
 * </ul>
 * @param {PWSTR} lpszSearchString Pointer to a buffer that contains the strings to search, if this request is to an index server. Otherwise, this parameter should be <b>NULL</b>.
 * @param {Pointer<GOPHER_FIND_DATAW>} lpFindData Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure that receives the information retrieved by this function.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data.
 * @returns {Pointer<Void>} Returns a valid search handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gopherfindfirstfilew
 * @since windows5.0
 */
export GopherFindFirstFileW(hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszSearchString := lpszSearchString is String ? StrPtr(lpszSearchString) : lpszSearchString

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherFindFirstFileW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszSearchString, GOPHER_FIND_DATAW.Ptr, lpFindData, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Begins reading a Gopher data file from a Gopher server. (ANSI)
 * @remarks
 * <b>GopherOpenFile</b> opens a file at a Gopher server. Because a file cannot actually be opened or locked at a server, this function simply associates location information with a handle that an application can use for file-based operations such as 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophergetattributea">GopherGetAttribute</a>.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>GopherOpenFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherOpenFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that specifies the file to be opened. Generally, this locator is returned from a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>. Because the Gopher protocol has no concept of a current directory, the locator is always fully qualified.
 * @param {PSTR} lpszView Pointer to a <b>null</b>-terminated string that describes the view to open if several views of the file exist on the server. If 
 * <i>lpszView</i> is <b>NULL</b>, the function uses the default file view.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that associates this operation with any application data.
 * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> if the file cannot be opened. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gopheropenfilea
 * @since windows5.0
 */
export GopherOpenFileA(hConnect, lpszLocator, lpszView, dwFlags, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszView := lpszView is String ? StrPtr(lpszView) : lpszView

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherOpenFileA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszView, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Begins reading a Gopher data file from a Gopher server. (Unicode)
 * @remarks
 * <b>GopherOpenFile</b> opens a file at a Gopher server. Because a file cannot actually be opened or locked at a server, this function simply associates location information with a handle that an application can use for file-based operations such as 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetreadfile">InternetReadFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophergetattributea">GopherGetAttribute</a>.
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>GopherOpenFile</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherOpenFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that specifies the file to be opened. Generally, this locator is returned from a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>. Because the Gopher protocol has no concept of a current directory, the locator is always fully qualified.
 * @param {PWSTR} lpszView Pointer to a <b>null</b>-terminated string that describes the view to open if several views of the file exist on the server. If 
 * <i>lpszView</i> is <b>NULL</b>, the function uses the default file view.
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that associates this operation with any application data.
 * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> if the file cannot be opened. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gopheropenfilew
 * @since windows5.0
 */
export GopherOpenFileW(hConnect, lpszLocator, lpszView, dwFlags, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszView := lpszView is String ? StrPtr(lpszView) : lpszView

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherOpenFileW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszView, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the specific attribute information from the server. (ANSI)
 * @remarks
 * Generally, applications call this function after calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>.
 * 
 * The size of the 
 * <i>lpBuffer</i> parameter must be equal to or greater than the value of <b>MIN_GOPHER_ATTRIBUTE_LENGTH</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherGetAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that identifies the item at the Gopher server on which to return attribute information.
 * @param {PSTR} lpszAttributeName Pointer to a space-delimited string specifying the names of attributes to return. If 
 * <i>lpszAttributeName</i> is <b>NULL</b>, 
 * <b>GopherGetAttribute</b> returns information about all attributes.
 * @param {Pointer<Integer>} lpBuffer Pointer to an application-defined buffer from which attribute information is retrieved.
 * @param {Integer} dwBufferLength Size of the 
 * <i>lpBuffer</i> buffer, in <b>TCHARs</b>.
 * @param {Pointer<Integer>} lpdwCharactersReturned Pointer to a variable that contains the number of characters read into the 
 * <i>lpBuffer</i> buffer.
 * @param {Pointer<GOPHER_ATTRIBUTE_ENUMERATOR>} lpfnEnumerator Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-gopher_attribute_enumerator">GopherAttributeEnumerator</a> callback function that enumerates each attribute of the locator. This parameter is optional. If it is <b>NULL</b>, all  Gopher attribute information is placed into 
 * <i>lpBuffer</i>. If 
 * <i>lpfnEnumerator</i> is specified, the callback function is called once for each attribute of the object.
 * 				
 * 
 * 
 * The callback function receives the address of a single 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_attribute_type">GOPHER_ATTRIBUTE_TYPE</a> structure with each call. The enumeration callback function allows the application to avoid having to parse the Gopher attribute information.
 * @param {Pointer} dwContext Application-defined value that associates this operation with any application data.
 * @returns {BOOL} Returns <b>TRUE</b> if the request is satisfied, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophergetattributea
 * @since windows5.0
 */
export GopherGetAttributeA(hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszAttributeName := lpszAttributeName is String ? StrPtr(lpszAttributeName) : lpszAttributeName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"
    lpdwCharactersReturnedMarshal := lpdwCharactersReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherGetAttributeA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszAttributeName, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, lpdwCharactersReturnedMarshal, lpdwCharactersReturned, "ptr", lpfnEnumerator, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the specific attribute information from the server. (Unicode)
 * @remarks
 * Generally, applications call this function after calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>.
 * 
 * The size of the 
 * <i>lpBuffer</i> parameter must be equal to or greater than the value of <b>MIN_GOPHER_ATTRIBUTE_LENGTH</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GopherGetAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that identifies the item at the Gopher server on which to return attribute information.
 * @param {PWSTR} lpszAttributeName Pointer to a space-delimited string specifying the names of attributes to return. If 
 * <i>lpszAttributeName</i> is <b>NULL</b>, 
 * <b>GopherGetAttribute</b> returns information about all attributes.
 * @param {Pointer<Integer>} lpBuffer Pointer to an application-defined buffer from which attribute information is retrieved.
 * @param {Integer} dwBufferLength Size of the 
 * <i>lpBuffer</i> buffer, in <b>TCHARs</b>.
 * @param {Pointer<Integer>} lpdwCharactersReturned Pointer to a variable that contains the number of characters read into the 
 * <i>lpBuffer</i> buffer.
 * @param {Pointer<GOPHER_ATTRIBUTE_ENUMERATOR>} lpfnEnumerator Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-gopher_attribute_enumerator">GopherAttributeEnumerator</a> callback function that enumerates each attribute of the locator. This parameter is optional. If it is <b>NULL</b>, all  Gopher attribute information is placed into 
 * <i>lpBuffer</i>. If 
 * <i>lpfnEnumerator</i> is specified, the callback function is called once for each attribute of the object.
 * 				
 * 
 * 
 * The callback function receives the address of a single 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_attribute_type">GOPHER_ATTRIBUTE_TYPE</a> structure with each call. The enumeration callback function allows the application to avoid having to parse the Gopher attribute information.
 * @param {Pointer} dwContext Application-defined value that associates this operation with any application data.
 * @returns {BOOL} Returns <b>TRUE</b> if the request is satisfied, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-gophergetattributew
 * @since windows5.0
 */
export GopherGetAttributeW(hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext) {
    lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
    lpszAttributeName := lpszAttributeName is String ? StrPtr(lpszAttributeName) : lpszAttributeName

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"
    lpdwCharactersReturnedMarshal := lpdwCharactersReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GopherGetAttributeW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszAttributeName, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, lpdwCharactersReturnedMarshal, lpdwCharactersReturned, "ptr", lpfnEnumerator, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates an HTTP request handle. (ANSI)
 * @remarks
 * The <b>HttpOpenRequest</b> function creates a new HTTP request handle and stores the specified parameters in that handle. An HTTP request handle holds a request to be sent to an HTTP server and contains all RFC822/MIME/HTTP headers to be sent as part of the request.
 * 
 * If a verb other than "GET" or "POST" is specified, <b>HttpOpenRequest</b> automatically sets INTERNET_FLAG_NO_CACHE_WRITE and INTERNET_FLAG_RELOAD for the request.
 * 
 * With Microsoft Internet Explorer 5 and later, if 
 * <i>lpszVerb</i> is set to "HEAD", the Content-Length header is ignored on responses from HTTP/1.1 servers.
 * 
 * On Windows 7, Windows Server 2008 R2, and later, the <i>lpszVersion</i> parameter is overridden by Internet Explorer settings.  The <b>EnableHttp1_1</b> is a registry value under <b>HKLM\Software\Microsoft\InternetExplorer\AdvacnedOptions\HTTP\GENABLE</b> controlled by Internet Options set in Internet Explorer for the system.  The <b>EnableHttp1_1</b> value defaults to 1. The <b>HttpOpenRequest</b> function upgrades any HTTP version less than 1.1 to HTTP version 1.1 if <b>EnableHttp1_1</b> is set to 1.
 * 
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>HttpOpenRequest</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * <b>Note</b>   When a request is sent in asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the request handle will not be invoked, however, the call will still be performed in asynchronous mode. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpOpenRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect A  handle to an HTTP session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PSTR} lpszVerb A pointer to a <b>null</b>-terminated string that contains the HTTP verb to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the HTTP verb.
 * @param {PSTR} lpszObjectName A pointer to a <b>null</b>-terminated string that contains the name of the target object of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
 * @param {PSTR} lpszVersion A pointer to a <b>null</b>-terminated string that contains the HTTP version to use in the request. Settings in Internet Explorer will override the value specified in this parameter. 
 * 
 * If this parameter is <b>NULL</b>, the function uses an HTTP version of 1.1 or 1.0, depending on the value of the Internet Explorer settings. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTP_1.0"></a><a id="http_1.0"></a><dl>
 * <dt><b>HTTP/1.0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HTTP version 1.0
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTP_1.1"></a><a id="http_1.1"></a><dl>
 * <dt><b>HTTP/1.1</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HTTP version 1.1
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PSTR} lpszReferrer A pointer to a <b>null</b>-terminated string that specifies the URL of the document from which the URL in the request (<i>lpszObjectName</i>) was obtained. If this parameter is <b>NULL</b>, no referrer is specified.
 * @param {Pointer<PSTR>} lplpszAcceptTypes A pointer to a <b>null</b>-terminated array of strings that indicates media types accepted by the client. Here is an example.
 * 
 * <c>PCTSTR rgpszAcceptTypes[] = {_T("text//"), NULL};</c>
 * 
 *  Failing to properly terminate the array with a NULL pointer will cause a crash.
 * 
 * If this parameter is <b>NULL</b>, no types are accepted by the client. Servers generally interpret a lack of accept types to indicate that the client accepts only documents of type "text//" (that is, only text documents—no pictures or other binary files).<!--  For more information and  a list of valid media types, see <a href="http://ftp.isi.edu/in-notes/iana/assignments/media-types/">ftp://ftp.isi.edu/in-notes/iana/assignments/media-types/media-types</a>. -->
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A pointer to a variable that contains the application-defined value that associates this operation with any application data.
 * @returns {Pointer<Void>} Returns an HTTP request handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpopenrequesta
 * @since windows5.0
 */
export HttpOpenRequestA(hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext) {
    lpszVerb := lpszVerb is String ? StrPtr(lpszVerb) : lpszVerb
    lpszObjectName := lpszObjectName is String ? StrPtr(lpszObjectName) : lpszObjectName
    lpszVersion := lpszVersion is String ? StrPtr(lpszVersion) : lpszVersion
    lpszReferrer := lpszReferrer is String ? StrPtr(lpszReferrer) : lpszReferrer

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lplpszAcceptTypesMarshal := lplpszAcceptTypes is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpOpenRequestA", hConnectMarshal, hConnect, "ptr", lpszVerb, "ptr", lpszObjectName, "ptr", lpszVersion, "ptr", lpszReferrer, lplpszAcceptTypesMarshal, lplpszAcceptTypes, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates an HTTP request handle. (Unicode)
 * @remarks
 * The <b>HttpOpenRequest</b> function creates a new HTTP request handle and stores the specified parameters in that handle. An HTTP request handle holds a request to be sent to an HTTP server and contains all RFC822/MIME/HTTP headers to be sent as part of the request.
 * 
 * If a verb other than "GET" or "POST" is specified, <b>HttpOpenRequest</b> automatically sets INTERNET_FLAG_NO_CACHE_WRITE and INTERNET_FLAG_RELOAD for the request.
 * 
 * With Microsoft Internet Explorer 5 and later, if 
 * <i>lpszVerb</i> is set to "HEAD", the Content-Length header is ignored on responses from HTTP/1.1 servers.
 * 
 * On Windows 7, Windows Server 2008 R2, and later, the <i>lpszVersion</i> parameter is overridden by Internet Explorer settings.  The <b>EnableHttp1_1</b> is a registry value under <b>HKLM\Software\Microsoft\InternetExplorer\AdvacnedOptions\HTTP\GENABLE</b> controlled by Internet Options set in Internet Explorer for the system.  The <b>EnableHttp1_1</b> value defaults to 1. The <b>HttpOpenRequest</b> function upgrades any HTTP version less than 1.1 to HTTP version 1.1 if <b>EnableHttp1_1</b> is set to 1.
 * 
 * 
 * After the calling application has finished using the 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle returned by 
 * <b>HttpOpenRequest</b>, it must be closed using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetclosehandle">InternetCloseHandle</a> function.
 * 
 * <b>Note</b>   When a request is sent in asynchronous mode (the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a> specifies <b>INTERNET_FLAG_ASYNC</b>), and the <i>dwContext</i> parameter is zero (<b>INTERNET_NO_CALLBACK</b>), the callback function set with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> on the request handle will not be invoked, however, the call will still be performed in asynchronous mode. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpOpenRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hConnect A handle to an HTTP session returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
 * @param {PWSTR} lpszVerb A pointer to a <b>null</b>-terminated string that contains the HTTP verb to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the HTTP verb.
 * @param {PWSTR} lpszObjectName A pointer to a <b>null</b>-terminated string that contains the name of the target object of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
 * @param {PWSTR} lpszVersion A pointer to a <b>null</b>-terminated string that contains the HTTP version to use in the request. Settings in Internet Explorer will override the value specified in this parameter. 
 * 
 * If this parameter is <b>NULL</b>, the function uses an HTTP version of 1.1 or 1.0, depending on the value of the Internet Explorer settings. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTP_1.0"></a><a id="http_1.0"></a><dl>
 * <dt><b>HTTP/1.0</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HTTP version 1.0
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTP_1.1"></a><a id="http_1.1"></a><dl>
 * <dt><b>HTTP/1.1</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * HTTP version 1.1
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} lpszReferrer A pointer to a <b>null</b>-terminated string that specifies the URL of the document from which the URL in the request (<i>lpszObjectName</i>) was obtained. If this parameter is <b>NULL</b>, no referrer is specified.
 * @param {Pointer<PWSTR>} lplpszAcceptTypes A pointer to a <b>null</b>-terminated array of strings that indicates media types accepted by the client. Here is an example.
 * 
 * <c>PCTSTR rgpszAcceptTypes[] = {_T("text//"), NULL};</c>
 * 
 *  Failing to properly terminate the array with a NULL pointer will cause a crash.
 * 
 * If this parameter is <b>NULL</b>, no types are accepted by the client. Servers generally interpret a lack of accept types to indicate that the client accepts only documents of type "text//" (that is, only text documents—no pictures or other binary files). <!--For more information and  a list of valid media types, see  ftp://ftp.isi.edu/in-notes/iana/assignments/media-types/media-types. -->
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext A pointer to a variable that contains the application-defined value that associates this operation with any application data.
 * @returns {Pointer<Void>} Returns an HTTP request handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpopenrequestw
 * @since windows5.0
 */
export HttpOpenRequestW(hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext) {
    lpszVerb := lpszVerb is String ? StrPtr(lpszVerb) : lpszVerb
    lpszObjectName := lpszObjectName is String ? StrPtr(lpszObjectName) : lpszObjectName
    lpszVersion := lpszVersion is String ? StrPtr(lpszVersion) : lpszVersion
    lpszReferrer := lpszReferrer is String ? StrPtr(lpszReferrer) : lpszReferrer

    hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
    lplpszAcceptTypesMarshal := lplpszAcceptTypes is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpOpenRequestW", hConnectMarshal, hConnect, "ptr", lpszVerb, "ptr", lpszObjectName, "ptr", lpszVersion, "ptr", lpszReferrer, lplpszAcceptTypesMarshal, lplpszAcceptTypes, "uint", dwFlags, "ptr", dwContext, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds one or more HTTP request headers to the HTTP request handle. (HttpAddRequestHeadersA)
 * @remarks
 * <b>HttpAddRequestHeaders</b> appends additional, free-format headers to the HTTP request handle and is intended for use by sophisticated clients that need detailed control over the exact request sent to the HTTP server.
 * 
 * Note that for basic 
 * <b>HttpAddRequestHeaders</b>, the application can pass in multiple headers in a single buffer. If the application is trying to remove or replace a header, only one header can be supplied in 
 * <i>lpszHeaders</i>.
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpAddRequestHeadersA</b> function  represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpAddRequestHeadersW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpAddRequestHeadersW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpAddRequestHeaders as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {PSTR} lpszHeaders A pointer to a string variable containing the headers to append to the request. Each header must be terminated by a CR/LF (carriage return/line feed) pair.
 * @param {Integer} dwHeadersLength The size of 
 * <i>lpszHeaders</i>, in <b>TCHARs</b>. If this parameter is -1L, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
 * @param {HTTP_ADDREQ_FLAG} dwModifiers 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpaddrequestheadersa
 * @since windows5.0
 */
export HttpAddRequestHeadersA(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpAddRequestHeadersA", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, HTTP_ADDREQ_FLAG, dwModifiers, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds one or more HTTP request headers to the HTTP request handle. (HttpAddRequestHeadersW)
 * @remarks
 * <b>HttpAddRequestHeaders</b> appends additional, free-format headers to the HTTP request handle and is intended for use by sophisticated clients that need detailed control over the exact request sent to the HTTP server.
 * 
 * Note that for basic 
 * <b>HttpAddRequestHeaders</b>, the application can pass in multiple headers in a single buffer. If the application is trying to remove or replace a header, only one header can be supplied in 
 * <i>lpszHeaders</i>.
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpAddRequestHeadersA</b> function  represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpAddRequestHeadersW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpAddRequestHeadersW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpAddRequestHeaders as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {PWSTR} lpszHeaders A pointer to a string variable containing the headers to append to the request. Each header must be terminated by a CR/LF (carriage return/line feed) pair.
 * @param {Integer} dwHeadersLength The size of 
 * <i>lpszHeaders</i>, in <b>TCHARs</b>. If this parameter is -1L, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
 * @param {HTTP_ADDREQ_FLAG} dwModifiers 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpaddrequestheadersw
 * @since windows5.0
 */
export HttpAddRequestHeadersW(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpAddRequestHeadersW", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, HTTP_ADDREQ_FLAG, dwModifiers, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends the specified request to the HTTP server, allowing callers to send extra data beyond what is normally passed to HttpSendRequestEx. (ANSI)
 * @remarks
 * <b>HttpSendRequest</b> sends the specified request to the HTTP server and allows the client to specify additional headers to send along with the request.
 * 
 * The function also lets the client specify optional data to send to the HTTP server immediately following the request headers. This feature is generally used for "write" operations such as PUT and POST.
 * 
 * After the request is sent, the status code and response headers from the HTTP server are read. These headers are maintained internally and are available to client applications through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpqueryinfoa">HttpQueryInfo</a> function.
 * 
 * An application can use the same HTTP request handle in multiple calls to 
 * <b>HttpSendRequest</b>, but the application must read all data returned from the previous call before calling the function again.
 * 
 * In offline mode, 
 * <b>HttpSendRequest</b> returns <b>ERROR_FILE_NOT_FOUND</b> if the resource is not found in the Internet cache.
 * 
 * There are two versions of 
 * <b>HttpSendRequest</b>—<b>HttpSendRequestA</b> (used with ANSI builds) and <b>HttpSendRequestW</b> (used with Unicode builds).  If 
 * <b>dwHeadersLength</b> is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, the following will happen:  If <b>HttpSendRequestA</b> is called, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated.  If <b>HttpSendRequestW</b> is called, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpSendRequestA</b> function  represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpSendRequestW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpSendRequestW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpSendRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {PSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that contains the additional headers to be appended to the request. This parameter can be <b>NULL</b> if there are no additional headers to be appended.
 * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated. See Remarks for specifics.
 * @param {Integer} lpOptional A pointer to a buffer containing any optional data to be sent immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or information being posted to the server. This parameter can be <b>NULL</b> if there is no optional data to send.
 * @param {Integer} dwOptionalLength The size of the optional data, in bytes. This parameter can be zero if there is no optional data to send.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpsendrequesta
 * @since windows5.0
 */
export HttpSendRequestA(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpSendRequestA", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends the specified request to the HTTP server, allowing callers to send extra data beyond what is normally passed to HttpSendRequestEx. (Unicode)
 * @remarks
 * <b>HttpSendRequest</b> sends the specified request to the HTTP server and allows the client to specify additional headers to send along with the request.
 * 
 * The function also lets the client specify optional data to send to the HTTP server immediately following the request headers. This feature is generally used for "write" operations such as PUT and POST.
 * 
 * After the request is sent, the status code and response headers from the HTTP server are read. These headers are maintained internally and are available to client applications through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpqueryinfoa">HttpQueryInfo</a> function.
 * 
 * An application can use the same HTTP request handle in multiple calls to 
 * <b>HttpSendRequest</b>, but the application must read all data returned from the previous call before calling the function again.
 * 
 * In offline mode, 
 * <b>HttpSendRequest</b> returns <b>ERROR_FILE_NOT_FOUND</b> if the resource is not found in the Internet cache.
 * 
 * There are two versions of 
 * <b>HttpSendRequest</b>—<b>HttpSendRequestA</b> (used with ANSI builds) and <b>HttpSendRequestW</b> (used with Unicode builds).  If 
 * <b>dwHeadersLength</b> is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, the following will happen:  If <b>HttpSendRequestA</b> is called, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated.  If <b>HttpSendRequestW</b> is called, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpSendRequestA</b> function  represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpSendRequestW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpSendRequestW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpSendRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {PWSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that contains the additional headers to be appended to the request. This parameter can be <b>NULL</b> if there are no additional headers to be appended.
 * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
 * <i>lpszHeaders</i> is not <b>NULL</b>, the function assumes that 
 * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated. See Remarks for specifics.
 * @param {Integer} lpOptional A pointer to a buffer containing any optional data to be sent immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or information being posted to the server. This parameter can be <b>NULL</b> if there is no optional data to send.
 * @param {Integer} dwOptionalLength The size of the optional data, in bytes. This parameter can be zero if there is no optional data to send.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpsendrequestw
 * @since windows5.0
 */
export HttpSendRequestW(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength) {
    lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpSendRequestW", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends the specified request to the HTTP server. (HttpSendRequestExA)
 * @remarks
 * <b>HttpSendRequestEx</b> performs  both the send and the receive for the response.  This does not allow the application to send any extra data beyond the single buffer that was passed to <b>HttpSendRequestEx</b>. Callers that need to send extra data beyond what is normally passed to <b>HttpSendRequestEx</b> can do so by calling <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> instead.   After the call to <b>HttpSendRequestEx</b>, send the remaining data by calling <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetwritefile">InternetWriteFile</a>.  Finally, follow up with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpendrequesta">HttpEndRequest</a>.  
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpSendRequestExA</b> function  represents data to send as ISO-8859-1 characters not ANSI characters. The <b>HttpSendRequestExW</b> function represents data to send as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpSendRequestExW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpSendRequestEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A 
 * 						handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersIn Optional. A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure.
 * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut Reserved. Must be <b>NULL</b>.
 * @param {Integer} dwFlags Reserved. Must be zero.
 * @param {Pointer} dwContext Application-defined context value, if a status callback function has been registered.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpsendrequestexa
 * @since windows5.0
 */
export HttpSendRequestExA(hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpSendRequestExA", hRequestMarshal, hRequest, INTERNET_BUFFERSA.Ptr, lpBuffersIn, INTERNET_BUFFERSA.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends the specified request to the HTTP server. (HttpSendRequestExW)
 * @remarks
 * <b>HttpSendRequestEx</b> performs  both the send and the receive for the response.  This does not allow the application to send any extra data beyond the single buffer that was passed to <b>HttpSendRequestEx</b>. Callers that need to send extra data beyond what is normally passed to <b>HttpSendRequestEx</b> can do so by calling <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> instead.   After the call to <b>HttpSendRequestEx</b>, send the remaining data by calling <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetwritefile">InternetWriteFile</a>.  Finally, follow up with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpendrequesta">HttpEndRequest</a>.  
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpSendRequestExA</b> function  represents data to send as ISO-8859-1 characters not ANSI characters. The <b>HttpSendRequestExW</b> function represents data to send as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpSendRequestExW</b> function when the headers to be added can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpSendRequestEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A 
 * 						handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
 * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersIn Optional. A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure.
 * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut Reserved. Must be <b>NULL</b>.
 * @param {Integer} dwFlags Reserved. Must be zero.
 * @param {Pointer} dwContext Application-defined context value, if a status callback function has been registered.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpsendrequestexw
 * @since windows5.0
 */
export HttpSendRequestExW(hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpSendRequestExW", hRequestMarshal, hRequest, INTERNET_BUFFERSW.Ptr, lpBuffersIn, INTERNET_BUFFERSW.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Ends an HTTP request that was initiated by HttpSendRequestEx. (ANSI)
 * @remarks
 * If 
 * <i>lpBuffersOut</i> is not set to <b>NULL</b>, 
 * <b>HttpEndRequest</b> will return ERROR_INVALID_PARAMETER.
 * 			
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpEndRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest Handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
 * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut This parameter is reserved and must be <b>NULL</b>.
 * @param {Integer} dwFlags This parameter is reserved and must be set to 0.
 * @param {Pointer} dwContext This parameter is reserved and must be set to 0.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpendrequesta
 * @since windows5.0
 */
export HttpEndRequestA(hRequest, lpBuffersOut, dwFlags, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpEndRequestA", hRequestMarshal, hRequest, INTERNET_BUFFERSA.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Ends an HTTP request that was initiated by HttpSendRequestEx. (Unicode)
 * @remarks
 * If 
 * <i>lpBuffersOut</i> is not set to <b>NULL</b>, 
 * <b>HttpEndRequest</b> will return ERROR_INVALID_PARAMETER.
 * 			
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpEndRequest as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest Handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
 * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut This parameter is reserved and must be <b>NULL</b>.
 * @param {Integer} dwFlags This parameter is reserved and must be set to 0.
 * @param {Pointer} dwContext This parameter is reserved and must be set to 0.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpendrequestw
 * @since windows5.0
 */
export HttpEndRequestW(hRequest, lpBuffersOut, dwFlags, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpEndRequestW", hRequestMarshal, hRequest, INTERNET_BUFFERSW.Ptr, lpBuffersOut, "uint", dwFlags, "ptr", dwContext, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves header information associated with an HTTP request. (ANSI)
 * @remarks
 * You can retrieve the following types of data from 
 * <b>HttpQueryInfo</b>:<ul>
 * <li>Strings (default)</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> (for dates)</li>
 * <li><b>DWORD</b> (for <b>STATUS_CODE</b>, <b>CONTENT_LENGTH</b>, and so on, if <b>HTTP_QUERY_FLAG_NUMBER</b> has been used)</li>
 * </ul>
 * 
 * 
 * If your application requires that the data be returned as a data type other than a string, you must include the appropriate modifier with the attribute passed to 
 * <i>dwInfoLevel</i>.
 * 
 * The <b>HttpQueryInfo</b> function is available in Microsoft Internet Explorer 3.0 for ISO-8859-1 characters (<b>HttpQueryInfoA</b> function) and in Internet Explorer 4.0 or later for ISO-8859-1 characters (<b>HttpQueryInfoA</b> function)  and for ISO-8859-1  characters converted to UTF-16LE  characters.(the <b>HttpQueryInfoW</b> function). 
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpQueryInfoA</b> function represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpQueryInfoW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpQueryInfoW</b> function when the headers can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * See <a href="https://docs.microsoft.com/windows/desktop/WinInet/retrieving-http-headers">Retrieving HTTP Headers</a> for an example code calling the <b>HttpQueryInfo</b> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpQueryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
 * @param {Integer} dwInfoLevel A combination of an attribute to be retrieved and flags that modify the request. For a list of possible attribute and modifier values, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/query-info-flags">Query Info Flags</a>.
 * @param {Integer} lpBuffer A pointer to a buffer to receive the requested information. This parameter must not be <b>NULL</b>.
 * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains, on entry, the size in bytes of the buffer pointed to by <i>lpvBuffer</i>. 
 * 
 * When the function returns successfully, this variable contains the number of bytes of information written to the buffer. In the case of a string, the byte count does not include the string's terminating <b>null</b> character.
 * 
 * When the function  
 * 					fails with an extended error code of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable pointed to by <i>lpdwBufferLength</i> contains on exit the size, in bytes, of a buffer large enough to receive the requested information. The calling application can then allocate a buffer of this size or larger, and call the function again.
 * @param {Pointer<Integer>} lpdwIndex A pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, <b>ERROR_HTTP_HEADER_NOT_FOUND</b> is returned.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpqueryinfoa
 * @since windows5.0
 */
export HttpQueryInfoA(hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
    lpdwIndexMarshal := lpdwIndex is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpQueryInfoA", hRequestMarshal, hRequest, "uint", dwInfoLevel, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpdwIndexMarshal, lpdwIndex, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves header information associated with an HTTP request. (Unicode)
 * @remarks
 * You can retrieve the following types of data from 
 * <b>HttpQueryInfo</b>:<ul>
 * <li>Strings (default)</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> (for dates)</li>
 * <li><b>DWORD</b> (for <b>STATUS_CODE</b>, <b>CONTENT_LENGTH</b>, and so on, if <b>HTTP_QUERY_FLAG_NUMBER</b> has been used)</li>
 * </ul>
 * 
 * 
 * If your application requires that the data be returned as a data type other than a string, you must include the appropriate modifier with the attribute passed to 
 * <i>dwInfoLevel</i>.
 * 
 * The <b>HttpQueryInfo</b> function is available in Microsoft Internet Explorer 3.0 for ISO-8859-1 characters (<b>HttpQueryInfoA</b> function) and in Internet Explorer 4.0 or later for ISO-8859-1 characters (<b>HttpQueryInfoA</b> function)  and for ISO-8859-1  characters converted to UTF-16LE  characters.(the <b>HttpQueryInfoW</b> function). 
 * 
 * <div class="alert"><b>Note</b>  The <b>HttpQueryInfoA</b> function represents headers as ISO-8859-1 characters not ANSI characters. The <b>HttpQueryInfoW</b> function represents headers as ISO-8859-1 characters converted to UTF-16LE  characters.   As a result, it is never safe to use the <b>HttpQueryInfoW</b> function when the headers can contain non-ASCII characters.
 * Instead, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions with a <i>Codepage</i> parameter set to 28591 to map between ANSI characters and  UTF-16LE characters.
 * </div>
 * <div> </div>
 * See <a href="https://docs.microsoft.com/windows/desktop/WinInet/retrieving-http-headers">Retrieving HTTP Headers</a> for an example code calling the <b>HttpQueryInfo</b> function.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines HttpQueryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<Void>} hRequest A handle returned by 
 * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
 * @param {Integer} dwInfoLevel A combination of an attribute to be retrieved and flags that modify the request. For a list of possible attribute and modifier values, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/query-info-flags">Query Info Flags</a>.
 * @param {Integer} lpBuffer A pointer to a buffer to receive the requested information. This parameter must not be <b>NULL</b>.
 * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains, on entry, the size in bytes of the buffer pointed to by <i>lpvBuffer</i>. 
 * 
 * When the function returns successfully, this variable contains the number of bytes of information written to the buffer. In the case of a string, the byte count does not include the string's terminating <b>null</b> character.
 * 
 * When the function  
 * 					fails with an extended error code of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable pointed to by <i>lpdwBufferLength</i> contains on exit the size, in bytes, of a buffer large enough to receive the requested information. The calling application can then allocate a buffer of this size or larger, and call the function again.
 * @param {Pointer<Integer>} lpdwIndex A pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, <b>ERROR_HTTP_HEADER_NOT_FOUND</b> is returned.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-httpqueryinfow
 * @since windows5.0
 */
export HttpQueryInfoW(hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
    lpdwIndexMarshal := lpdwIndex is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\HttpQueryInfoW", hRequestMarshal, hRequest, "uint", dwInfoLevel, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpdwIndexMarshal, lpdwIndex, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a cookie associated with the specified URL. (InternetSetCookieA)
 * @remarks
 * Cookies created by 
 * <b>InternetSetCookie</b> without an expiration date are stored in memory and are available only in the same process that created them. Cookies that include an expiration date are stored in the windows\cookies directory.
 * 
 * Creating a new cookie might cause a dialog box to appear on the screen asking the user if they want to allow or disallow  cookies from this site based on the privacy settings for the user.
 * 
 * 
 * <div class="alert"><b>Caution</b>  <b>InternetSetCookie</b> will unconditionally create a cookie even if “Block all cookies” is set in Internet Explorer. This behavior can be viewed as a breach of privacy even though such cookies are not subsequently sent back to servers while the “Block all cookies” setting is active. Applications should use <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetcookieexa">InternetSetCookieEx</a> to correctly honor the user's privacy settings.
 * 
 * <p class="note">For more cookie internals, see <a href="https://docs.microsoft.com/archive/blogs/ieinternals/">http://blogs.msdn.com/ieinternals/archive/2009/08/20/WinINET-IE-Cookie-Internals-FAQ.aspx</a>.
 * 
 * </div>
 * <div> </div>
 * 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetCookie as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL for which the cookie should be set.
 * @param {PSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that specifies the name to be associated with the cookie data. If this parameter is <b>NULL</b>, no name is associated with the cookie.
 * @param {PSTR} lpszCookieData Pointer to the actual data to be associated with the URL.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetcookiea
 * @since windows5.0
 */
export InternetSetCookieA(lpszUrl, lpszCookieName, lpszCookieData) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetCookieA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a cookie associated with the specified URL. (InternetSetCookieW)
 * @remarks
 * Cookies created by 
 * <b>InternetSetCookie</b> without an expiration date are stored in memory and are available only in the same process that created them. Cookies that include an expiration date are stored in the windows\cookies directory.
 * 
 * Creating a new cookie might cause a dialog box to appear on the screen asking the user if they want to allow or disallow  cookies from this site based on the privacy settings for the user.
 * 
 * 
 * <div class="alert"><b>Caution</b>  <b>InternetSetCookie</b> will unconditionally create a cookie even if “Block all cookies” is set in Internet Explorer. This behavior can be viewed as a breach of privacy even though such cookies are not subsequently sent back to servers while the “Block all cookies” setting is active. Applications should use <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetcookieexa">InternetSetCookieEx</a> to correctly honor the user's privacy settings.
 * 
 * <p class="note">For more cookie internals, see <a href="https://docs.microsoft.com/archive/blogs/ieinternals/">http://blogs.msdn.com/ieinternals/archive/2009/08/20/WinINET-IE-Cookie-Internals-FAQ.aspx</a>.
 * 
 * </div>
 * <div> </div>
 * 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetCookie as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL for which the cookie should be set.
 * @param {PWSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that specifies the name to be associated with the cookie data. If this parameter is <b>NULL</b>, no name is associated with the cookie.
 * @param {PWSTR} lpszCookieData Pointer to the actual data to be associated with the URL.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetcookiew
 * @since windows5.0
 */
export InternetSetCookieW(lpszUrl, lpszCookieName, lpszCookieData) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetCookieW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the cookie for the specified URL. (ANSI)
 * @remarks
 * <b>InternetGetCookie</b> does not require a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>. 
 * <b>InternetGetCookie</b> checks in the windows\cookies directory for persistent cookies that have an expiration date set sometime in the future. 
 * <b>InternetGetCookie</b> also searches memory for any session cookies, that is, cookies that do not have an expiration date that were created in the same process by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetcookiea">InternetSetCookie</a>, because these cookies are not written to any files. Rules for creating cookie files are internal to the system and can change in the future.
 * 
 * As noted in <a href="https://docs.microsoft.com/windows/desktop/WinInet/http-cookies">HTTP Cookies</a>, <b>InternetGetCookie</b> does not return cookies that the server marked as non-scriptable with the "HttpOnly" attribute in the Set-Cookie header.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetCookie as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that specifies the URL for which cookies are to be retrieved.
 * @param {PSTR} lpszCookieName Not implemented.
 * @param {PSTR} lpszCookieData A pointer to a buffer that receives the cookie data. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpdwSize A pointer to a variable that specifies the size of the 
 * <i>lpszCookieData</i> parameter buffer, in TCHARs. If the function succeeds, the buffer receives the amount of data copied to the 
 * <i>lpszCookieData</i> buffer. If 
 * <i>lpszCookieData</i> is <b>NULL</b>, this parameter receives a value that specifies the size of the buffer necessary to copy all the cookie data, expressed as a byte count.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The following error values apply to 
 * <b>InternetGetCookie</b>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is no cookie for the specified URL and all its parents.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value passed in 
 * <i>lpdwSize</i> is insufficient to copy all the cookie data. The value returned in 
 * <i>lpdwSize</i> is the size of the buffer necessary to get all the data.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the parameters is invalid.
 * 
 * The <i>lpszUrl</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetcookiea
 * @since windows5.0
 */
export InternetGetCookieA(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetCookieA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the cookie for the specified URL. (Unicode)
 * @remarks
 * <b>InternetGetCookie</b> does not require a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>. 
 * <b>InternetGetCookie</b> checks in the windows\cookies directory for persistent cookies that have an expiration date set sometime in the future. 
 * <b>InternetGetCookie</b> also searches memory for any session cookies, that is, cookies that do not have an expiration date that were created in the same process by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetcookiea">InternetSetCookie</a>, because these cookies are not written to any files. Rules for creating cookie files are internal to the system and can change in the future.
 * 
 * As noted in <a href="https://docs.microsoft.com/windows/desktop/WinInet/http-cookies">HTTP Cookies</a>, <b>InternetGetCookie</b> does not return cookies that the server marked as non-scriptable with the "HttpOnly" attribute in the Set-Cookie header.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetCookie as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that specifies the URL for which cookies are to be retrieved.
 * @param {PWSTR} lpszCookieName Not implemented.
 * @param {PWSTR} lpszCookieData A pointer to a buffer that receives the cookie data. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpdwSize A pointer to a variable that specifies the size of the 
 * <i>lpszCookieData</i> parameter buffer, in TCHARs. If the function succeeds, the buffer receives the amount of data copied to the 
 * <i>lpszCookieData</i> buffer. If 
 * <i>lpszCookieData</i> is <b>NULL</b>, this parameter receives a value that specifies the size of the buffer necessary to copy all the cookie data, expressed as a byte count.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error data, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The following error values apply to 
 * <b>InternetGetCookie</b>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is no cookie for the specified URL and all its parents.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value passed in 
 * <i>lpdwSize</i> is insufficient to copy all the cookie data. The value returned in 
 * <i>lpdwSize</i> is the size of the buffer necessary to get all the data.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the parameters is invalid.
 * 
 * The <i>lpszUrl</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetcookiew
 * @since windows5.0
 */
export InternetGetCookieW(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetCookieW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetSetCookieEx function creates a cookie with a specified name that is associated with a specified URL. This function differs from the InternetSetCookie function by being able to create third-party cookies. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetCookieEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that contains the URL for which the cookie should be set. 
 * 
 * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {PSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that  contains the name to associate with this cookie.
 *       If this pointer is <b>NULL</b>, then no name is associated with the cookie.
 * @param {PSTR} lpszCookieData Pointer to a <b>null</b>-terminated string that contains the data to be associated with the new cookie.
 * 
 * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {Integer} dwFlags Flags that control how the function retrieves cookie data:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_EVALUATE_P3P"></a><a id="internet_cookie_evaluate_p3p"></a><dl>
 * <dt><b>INTERNET_COOKIE_EVALUATE_P3P</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set and the <i>dwReserved</i> parameter is not <b>NULL</b>, then the <i>dwReserved</i> parameter is cast to an <b>LPCTSTR</b> that points to a Platform-for-Privacy-Protection (P3P) header for the cookie in question.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_HTTPONLY"></a><a id="internet_cookie_httponly"></a><dl>
 * <dt><b>INTERNET_COOKIE_HTTPONLY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables the retrieval of cookies that are marked as "HTTPOnly".  
 * 
 * 
 * 
 * Do  not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks.  It is utterly imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide.
 * 
 *  
 * 
 * <b>Version:  </b>Requires Internet Explorer 8.0 or later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_THIRD_PARTY"></a><a id="internet_cookie_third_party"></a><dl>
 * <dt><b>INTERNET_COOKIE_THIRD_PARTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the cookie being set is a third-party cookie.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RESTRICTED_ZONE"></a><a id="internet_flag_restricted_zone"></a><dl>
 * <dt><b>INTERNET_FLAG_RESTRICTED_ZONE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the cookie being set is associated with an untrusted site.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer} dwReserved <b>NULL</b>, or contains a pointer to a Platform-for-Privacy-Protection (P3P) header to be associated with the cookie.
 * @returns {Integer} Returns a member of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration if successful,  or  <b>FALSE</b> if the function fails. On failure, if a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_NOT_ENOUGH_MEMORY,  insufficient system memory was available.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetcookieexa
 * @since windows5.1.2600
 */
export InternetSetCookieExA(lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetCookieExA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "uint", dwFlags, "ptr", dwReserved, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetSetCookieEx function creates a cookie with a specified name that is associated with a specified URL. This function differs from the InternetSetCookie function by being able to create third-party cookies. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetCookieEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that contains the URL for which the cookie should be set. 
 * 
 * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {PWSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that  contains the name to associate with this cookie.
 *       If this pointer is <b>NULL</b>, then no name is associated with the cookie.
 * @param {PWSTR} lpszCookieData Pointer to a <b>null</b>-terminated string that contains the data to be associated with the new cookie.
 * 
 * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {Integer} dwFlags Flags that control how the function retrieves cookie data:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_EVALUATE_P3P"></a><a id="internet_cookie_evaluate_p3p"></a><dl>
 * <dt><b>INTERNET_COOKIE_EVALUATE_P3P</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If this flag is set and the <i>dwReserved</i> parameter is not <b>NULL</b>, then the <i>dwReserved</i> parameter is cast to an <b>LPCTSTR</b> that points to a Platform-for-Privacy-Protection (P3P) header for the cookie in question.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_HTTPONLY"></a><a id="internet_cookie_httponly"></a><dl>
 * <dt><b>INTERNET_COOKIE_HTTPONLY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables the retrieval of cookies that are marked as "HTTPOnly".  
 * 
 * 
 * 
 * Do  not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks.  It is utterly imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide.
 * 
 *  
 * 
 * <b>Version:  </b>Requires Internet Explorer 8.0 or later.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_COOKIE_THIRD_PARTY"></a><a id="internet_cookie_third_party"></a><dl>
 * <dt><b>INTERNET_COOKIE_THIRD_PARTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the cookie being set is a third-party cookie.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_FLAG_RESTRICTED_ZONE"></a><a id="internet_flag_restricted_zone"></a><dl>
 * <dt><b>INTERNET_FLAG_RESTRICTED_ZONE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the cookie being set is associated with an untrusted site.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer} dwReserved <b>NULL</b>, or contains a pointer to a Platform-for-Privacy-Protection (P3P) header to be associated with the cookie.
 * @returns {Integer} Returns a member of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration if successful,  or  <b>FALSE</b> if the function fails. On failure, if a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_NOT_ENOUGH_MEMORY,  insufficient system memory was available.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetcookieexw
 * @since windows5.1.2600
 */
export InternetSetCookieExW(lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    A_LastError := 0

    result := DllCall("WININET.dll\InternetSetCookieExW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "uint", dwFlags, "ptr", dwReserved, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves data stored in cookies associated with a specified URL. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetCookieEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the URL with which the cookie to retrieve is associated. This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {PSTR} lpszCookieName A pointer to a <b>null</b>-terminated string that contains the name of the cookie to retrieve. This name is case-sensitive.
 * @param {PSTR} lpszCookieData A pointer to a buffer to receive the cookie data.
 * @param {Pointer<Integer>} lpdwSize A pointer to a DWORD variable. 
 * 
 * On entry, the variable must contain the size, in TCHARs, of the buffer pointed to by the <i>pchCookieData</i> parameter.
 * 
 * On exit, if the function is successful, this variable contains the number of TCHARs of cookie data copied into the buffer. If <b>NULL</b> was passed as the <i>lpszCookieData</i> parameter, or if the function fails with an error of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable contains the size, in BYTEs, of buffer required to receive the cookie data.
 * 
 * This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {INTERNET_COOKIE_FLAGS} dwFlags 
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get a specific error value, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If <b>NULL</b> is passed to <i>lpszCookieData</i>, the call will succeed and the function will not set <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * 
 * 
 * The following error codes may be set by this function.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if cookie data retrieved is larger than the buffer size pointed to by the <i>pcchCookieData</i> parameter or if that parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if either the <i>pchURL</i> or the <i>pcchCookieData</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if no cookied data as specified could be retrieved.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetcookieexa
 * @since windows5.1.2600
 */
export InternetGetCookieExA(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetCookieExA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, INTERNET_COOKIE_FLAGS, dwFlags, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves data stored in cookies associated with a specified URL. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetCookieEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the URL with which the cookie to retrieve is associated. This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {PWSTR} lpszCookieName A pointer to a <b>null</b>-terminated string that contains the name of the cookie to retrieve. This name is case-sensitive.
 * @param {PWSTR} lpszCookieData A pointer to a buffer to receive the cookie data.
 * @param {Pointer<Integer>} lpdwSize A pointer to a DWORD variable. 
 * 
 * On entry, the variable must contain the size, in TCHARs, of the buffer pointed to by the <i>pchCookieData</i> parameter.
 * 
 * On exit, if the function is successful, this variable contains the number of TCHARs of cookie data copied into the buffer. If <b>NULL</b> was passed as the <i>lpszCookieData</i> parameter, or if the function fails with an error of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable contains the size, in BYTEs, of buffer required to receive the cookie data.
 * 
 * This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
 * @param {INTERNET_COOKIE_FLAGS} dwFlags 
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get a specific error value, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If <b>NULL</b> is passed to <i>lpszCookieData</i>, the call will succeed and the function will not set <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * 
 * 
 * The following error codes may be set by this function.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if cookie data retrieved is larger than the buffer size pointed to by the <i>pcchCookieData</i> parameter or if that parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if either the  <i>pchURL</i> or the <i>pcchCookieData</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if no cookied data as specified could be retrieved.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetcookieexw
 * @since windows5.1.2600
 */
export InternetGetCookieExW(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetCookieExW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, INTERNET_COOKIE_FLAGS, dwFlags, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees an array of INTERNET_COOKIE2 structures.
 * @remarks
 * > [!NOTE]
 * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
 * @param {Pointer<INTERNET_COOKIE2>} pCookies Pointer to an array of [**INTERNET\_COOKIE2**](ns-wininet-internet_cookie2.md) structures.
 * @param {Integer} dwCookieCount The number of structures in the array.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetfreecookies
 */
export InternetFreeCookies(pCookies, dwCookieCount) {
    DllCall("WININET.dll\InternetFreeCookies", INTERNET_COOKIE2.Ptr, pCookies, "uint", dwCookieCount)
}

/**
 * Retrieves one or more cookies associated with the specified URL.
 * @remarks
 * > [!NOTE]
 * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
 * @param {PWSTR} pcwszUrl The URL for which to retrieve cookies.
 * @param {PWSTR} pcwszCookieName The name of the cookie to retrieve. May be NULL.
 * @param {Integer} dwFlags Flags of the cookie to retrieve. The following flags are available.
 * 
 * | Value | Meaning |
 * |-------|---------|
 * | INTERNET_COOKIE_THIRD_PARTY | Retrieve cookies as a third party, causing first-party-only cookies to be excluded. |
 * | INTERNET_COOKIE_NON_SCRIPT | Indicate that this query was not triggered via JavaScript, allowing retrieval of HTTP-only cookies. |
 * | INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE | Retrieve cookies as if in a cross site context, excluding cookies with the SameSite property set. |
 * | INTERNET_FLAG_RESTRICTED_ZONE | Retrieve only cookies that would be allowed if the specified URL were untrusted; that is, if it belonged to the URLZONE_UNTRUSTED zone. |
 * @param {Pointer<Pointer<INTERNET_COOKIE2>>} ppCookies Pointer that receives an array of [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structures. The returned array must be freed by [InternetFreeCookies](nf-wininet-internetfreecookies.md).
 * @param {Pointer<Integer>} pdwCookieCount Pointer to a DWORD that receives the number of structures in the array.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or a [system error code](/windows/desktop/debug/system-error-codes) on failure.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetcookieex2
 */
export InternetGetCookieEx2(pcwszUrl, pcwszCookieName, dwFlags, ppCookies, pdwCookieCount) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl
    pcwszCookieName := pcwszCookieName is String ? StrPtr(pcwszCookieName) : pcwszCookieName

    ppCookiesMarshal := ppCookies is VarRef ? "ptr*" : "ptr"
    pdwCookieCountMarshal := pdwCookieCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetCookieEx2", "ptr", pcwszUrl, "ptr", pcwszCookieName, "uint", dwFlags, ppCookiesMarshal, ppCookies, pdwCookieCountMarshal, pdwCookieCount, UInt32)
    return result
}

/**
 * Creates a cookie associated with the specified URL. (InternetSetCookieEx2)
 * @remarks
 * > [!NOTE]
 * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
 * @param {PWSTR} pcwszUrl The URL for which to set the cookie.
 * @param {Pointer<INTERNET_COOKIE2>} pCookie Pointer to an [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structure containing the cookie data.
 * @param {PWSTR} pcwszP3PPolicy String containing the Platform-for-Privacy-Protection (P3P) policy for the cookie. May be NULL.
 * @param {Integer} dwFlags Flags for the cookie to be set. The following flags are available.
 * 
 * | Value | Meaning |
 * |-------|---------|
 * | INTERNET_COOKIE_THIRD_PARTY | Set this cookie in a third-party context. |
 * | INTERNET_COOKIE_PROMPT_REQUIRED | Show a UI prompt for the user to accept or reject this cookie. |
 * | INTERNET_COOKIE_EVALUATE_P3P | Evaluate the provided P3P policy for this cookie. This will evaluate default policy when *pcwszP3PPolicy* is NULL. |
 * | INTERNET_COOKIE_NON_SCRIPT | Indicate that this cookie is not being set via JavaScript, allowing HTTP-only cookies to be set. |
 * | INTERNET_COOKIE_APPLY_HOST_ONLY | Apply host-only policy to this cookie. If the domain attribute is not set, then this cookie will be marked host-only. |
 * @param {Pointer<Integer>} pdwCookieState Pointer to a DWORD that receives the result of setting the cookie. For a list of possible values, see [InternetCookieState](/windows/win32/api/wininet/ne-wininet-internetcookiestate).
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or a [system error code](/windows/desktop/debug/system-error-codes) on failure.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetcookieex2
 */
export InternetSetCookieEx2(pcwszUrl, pCookie, pcwszP3PPolicy, dwFlags, pdwCookieState) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl
    pcwszP3PPolicy := pcwszP3PPolicy is String ? StrPtr(pcwszP3PPolicy) : pcwszP3PPolicy

    pdwCookieStateMarshal := pdwCookieState is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetSetCookieEx2", "ptr", pcwszUrl, INTERNET_COOKIE2.Ptr, pCookie, "ptr", pcwszP3PPolicy, "uint", dwFlags, pdwCookieStateMarshal, pdwCookieState, UInt32)
    return result
}

/**
 * Attempts to make a connection to the Internet.
 * @remarks
 * This function allows an application to first attempt to connect before issuing any requests. A client program can use this to evoke the dial-up dialog box. If the attempt fails, the application should enter offline mode.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetattemptconnect
 * @since windows5.0
 */
export InternetAttemptConnect(dwReserved) {
    result := DllCall("WININET.dll\InternetAttemptConnect", "uint", dwReserved, UInt32)
    return result
}

/**
 * Allows an application to check if a connection to the Internet can be established. (ANSI)
 * @remarks
 * <b>InternetCheckConnection</b> is deprecated. <b>InternetCheckConnection</b> does not work in environments that use a web proxy server to access the Internet. Depending on the environment, use  <a href="https://docs.microsoft.com/uwp/api/Windows.Networking.Connectivity.NetworkInformation#Windows_Networking_Connectivity_NetworkInformation_GetInternetConnectionProfile_">NetworkInformation.GetInternetConnectionProfile</a> or the <a href="https://docs.microsoft.com/windows/desktop/NLA/nlm-interfaces">NLM Interfaces</a> to check for Internet access instead.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCheckConnection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL to use to check the connection. This value can be <b>NULL</b>.
 * @param {Integer} dwFlags Options. FLAG_ICC_FORCE_CONNECTION is the only flag that is currently available. If this flag is set, it forces a connection. A sockets connection is attempted in the following order:
 * 
 * <ul>
 * <li>If 
 * <i>lpszUrl</i> is non-<b>NULL</b>, the host value is extracted from it and used to ping that specific host.</li>
 * <li>If 
 * <i>lpszUrl</i> is <b>NULL</b> and there is an entry in the internal server database for the nearest server, the host value is extracted from the entry and used to ping that server.</li>
 * </ul>
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if a connection is made successfully, or <b>FALSE</b> otherwise. Use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code. ERROR_NOT_CONNECTED is returned by 
 * <b>GetLastError</b> if a connection cannot be made or if the sockets database is unconditionally offline.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcheckconnectiona
 * @since windows5.0
 */
export InternetCheckConnectionA(lpszUrl, dwFlags, dwReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCheckConnectionA", "ptr", lpszUrl, "uint", dwFlags, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Allows an application to check if a connection to the Internet can be established. (Unicode)
 * @remarks
 * <b>InternetCheckConnection</b> is deprecated. <b>InternetCheckConnection</b> does not work in environments that use a web proxy server to access the Internet. Depending on the environment, use  <a href="https://docs.microsoft.com/uwp/api/Windows.Networking.Connectivity.NetworkInformation#Windows_Networking_Connectivity_NetworkInformation_GetInternetConnectionProfile_">NetworkInformation.GetInternetConnectionProfile</a> or the <a href="https://docs.microsoft.com/windows/desktop/NLA/nlm-interfaces">NLM Interfaces</a> to check for Internet access instead.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetCheckConnection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL to use to check the connection. This value can be <b>NULL</b>.
 * @param {Integer} dwFlags Options. FLAG_ICC_FORCE_CONNECTION is the only flag that is currently available. If this flag is set, it forces a connection. A sockets connection is attempted in the following order:
 * 
 * <ul>
 * <li>If 
 * <i>lpszUrl</i> is non-<b>NULL</b>, the host value is extracted from it and used to ping that specific host.</li>
 * <li>If 
 * <i>lpszUrl</i> is <b>NULL</b> and there is an entry in the internal server database for the nearest server, the host value is extracted from the entry and used to ping that server.</li>
 * </ul>
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if a connection is made successfully, or <b>FALSE</b> otherwise. Use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code. ERROR_NOT_CONNECTED is returned by 
 * <b>GetLastError</b> if a connection cannot be made or if the sockets database is unconditionally offline.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetcheckconnectionw
 * @since windows5.0
 */
export InternetCheckConnectionW(lpszUrl, dwFlags, dwReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    A_LastError := 0

    result := DllCall("WININET.dll\InternetCheckConnectionW", "ptr", lpszUrl, "uint", dwFlags, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The ResumeSuspendedDownload function resumes a request that is suspended by a user interface dialog box.
 * @remarks
 * Applications that use WinINet functions asynchronously can call <b>ResumeSuspendedDownload</b> to resume a request that is suspended by a user interface dialog box.
 * 
 * For example,  call  <b>ResumeSuspendedDownload</b> after a call to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-interneterrordlg">InternetErrorDlg</a>, or in an <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>  function when the <i>lpvStatusInformation</i> parameter equals <b>INTERNET_STATUS_USER_INPUT_REQUIRED</b>. The following code example shows you how to use the <b>ResumeSuspendedDownload</b>  function in a callback.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hRequest Handle of the request that is suspended by a user interface dialog box.
 * @param {Integer} dwResultCode The error result returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-interneterrordlg">InternetErrorDlg</a>, or zero if a different dialog  is  invoked.
 * @returns {BOOL} Returns <b>TRUE</b> if successful; otherwise  <b>FALSE</b>. Call
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-resumesuspendeddownload
 * @since windows5.0
 */
export ResumeSuspendedDownload(hRequest, dwResultCode) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\ResumeSuspendedDownload", hRequestMarshal, hRequest, "uint", dwResultCode, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Displays a dialog box for the error that is passed to InternetErrorDlg, if an appropriate dialog box exists.
 * @remarks
 * Always inform the user  when any of the following events occur:<ul>
 * <li>ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR</li>
 * <li>ERROR_INTERNET_INVALID_CA</li>
 * <li>ERROR_INTERNET_POST_IS_NON_SECURE</li>
 * <li>ERROR_INTERNET_SEC_CERT_CN_INVALID</li>
 * <li>ERROR_INTERNET_SEC_CERT_DATE_INVALID</li>
 * </ul>Unless the user has explicitly chosen not to be informed of these events, failure to do so exposes the user involuntarily to  a significant security risk.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HWND} _hWnd Handle to the parent window for any needed dialog box. If no dialog box is needed and <b>FLAGS_ERROR_UI_FLAGS_NO_UI</b> is passed to <i>dwFlags</i>, then this parameter can be <b>NULL</b>.
 * @param {Pointer<Void>} hRequest Handle to the Internet connection used in the call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a>.
 * @param {Integer} dwError 
 * @param {Integer} dwFlags 
 * @param {Pointer<Pointer<Void>>} lppvData Pointer  to the address of a data structure. The structure can be different for each error that needs to be handled.
 * @returns {Integer} Returns one of the following values, or an error value otherwise.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function completed successfully.
 * 
 * For more information, see <b>ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED</b> in the <i>dwError</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function was canceled by the user.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INTERNET_FORCE_RETRY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This indicates that the function needs to redo its request.  In the case of authentication this indicates that the user clicked the <b>OK</b> button.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle to the parent window is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-interneterrordlg
 * @since windows5.0
 */
export InternetErrorDlg(_hWnd, hRequest, dwError, dwFlags, lppvData) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
    lppvDataMarshal := lppvData is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\InternetErrorDlg", HWND, _hWnd, hRequestMarshal, hRequest, "uint", dwError, "uint", dwFlags, lppvDataMarshal, lppvData, UInt32)
    return result
}

/**
 * Checks for changes between secure and nonsecure URLs. Always inform the user when a change occurs in security between two URLs. Typically, an application should allow the user to acknowledge the change through interaction with a dialog box. (InternetConfirmZoneCrossingA)
 * @remarks
 * Always inform the user when a change in security level occurs, or you risk subjecting the user to  involuntary information disclosure.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetConfirmZoneCrossing as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} _hWnd Handle to the parent window for any required dialog box.
 * @param {PSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
 * @param {PSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
 * @param {BOOL} bPost Not implemented.
 * @returns {Integer} Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user confirmed that it was okay to continue, or there was no user input required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory to carry out the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetconfirmzonecrossinga
 * @since windows5.0
 */
export InternetConfirmZoneCrossingA(_hWnd, szUrlPrev, szUrlNew, bPost) {
    szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
    szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

    result := DllCall("WININET.dll\InternetConfirmZoneCrossingA", HWND, _hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, BOOL, bPost, UInt32)
    return result
}

/**
 * The InternetConfirmZoneCrossingW (Unicode) function (wininet.h) checks for changes between secure and nonsecure URLs.
 * @remarks
 * Always inform the user when a change in security level occurs, or you risk subjecting the user to  involuntary information disclosure.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetConfirmZoneCrossing as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} _hWnd Handle to the parent window for any required dialog box.
 * @param {PWSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
 * @param {PWSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
 * @param {BOOL} bPost Not implemented.
 * @returns {Integer} Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user confirmed that it was okay to continue, or there was no user input required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory to carry out the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetconfirmzonecrossingw
 * @since windows5.0
 */
export InternetConfirmZoneCrossingW(_hWnd, szUrlPrev, szUrlNew, bPost) {
    szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
    szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

    result := DllCall("WININET.dll\InternetConfirmZoneCrossingW", HWND, _hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, BOOL, bPost, UInt32)
    return result
}

/**
 * The InternetConfirmZoneCrossing function (wininet.h) checks for changes between secure and nonsecure URLs.
 * @remarks
 * Always inform the user when a change in security level occurs, or you risk subjecting the user to  involuntary information disclosure.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HWND} _hWnd Handle to the parent window for any required dialog box.
 * @param {PSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
 * @param {PSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
 * @param {BOOL} bPost Not implemented.
 * @returns {Integer} Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user confirmed that it was okay to continue, or there was no user input required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is not enough memory to carry out the request.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetconfirmzonecrossing
 * @since windows5.0
 */
export InternetConfirmZoneCrossing(_hWnd, szUrlPrev, szUrlNew, bPost) {
    szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
    szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

    result := DllCall("WININET.dll\InternetConfirmZoneCrossing", HWND, _hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, BOOL, bPost, UInt32)
    return result
}

/**
 * Creates a local file name for saving the cache entry based on the specified URL and the file name extension. (ANSI)
 * @remarks
 * After 
 * <b>CreateUrlCacheEntry</b> is called, the application can write directly into the file in local storage. When the file is completely received, the caller should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-commiturlcacheentrya">CommitUrlCacheEntry</a> to commit the entry in the cache.
 * 
 * WinINet attempts to decode Unicode  parameters according to the system code page. Applications should ensure that  Unicode parameters are properly encoded for the system code page. Applications can set the system code page with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetoptiona">InternetSetOption</a> as shown in the following code example:
 * 
 * 
 * ``` syntax
 * DWORD CP_SHIFT_JIS = 932;  // ANSI/OEM  Japanese, Shift-JIS
 * InternetSetOption( hRequest, 
 *                    INTERNET_OPTION_CODEPAGE,
 *                    &amp;CP_SHIFT_JIS, 
 *                    sizeof(DWORD) );
 * ```
 * 
 * If the Unicode parameter is not properly encoded to the system code page, WinINet attempts UTF8 decoding. 
 * 
 * When items are retrieved from the cache, the system code page that was used to place the item in the cache must match the current system code page for the user. For applications running under IE6 and earlier, if decoding for the system code page fails, WinINet attempts UTF8 decoding. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines CreateUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a string value that contains the name of the URL. The string must contain a value; an empty string will cause <b>CreateUrlCacheEntry</b> to fail. In addition, the string must not contain any escape characters.
 * @param {Integer} dwExpectedFileSize Expected size of the file needed to store the data that corresponds to the source entity, in <b>TCHARs</b>. If the expected size is unknown, set this value to zero.
 * @param {PSTR} lpszFileExtension Pointer to a string value that contains an extension name of the file in the local storage.
 * @param {PSTR} lpszFileName Pointer to a buffer that receives the file name. The buffer should be large enough  to store the path of the created file (at least MAX_PATH  characters in length).
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-createurlcacheentrya
 * @since windows5.0
 */
export CreateUrlCacheEntryA(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
    lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    A_LastError := 0

    result := DllCall("WININET.dll\CreateUrlCacheEntryA", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a local file name for saving the cache entry based on the specified URL and the file name extension. (Unicode)
 * @remarks
 * After 
 * <b>CreateUrlCacheEntry</b> is called, the application can write directly into the file in local storage. When the file is completely received, the caller should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-commiturlcacheentrya">CommitUrlCacheEntry</a> to commit the entry in the cache.
 * 
 * WinINet attempts to decode Unicode  parameters according to the system code page. Applications should ensure that  Unicode parameters are properly encoded for the system code page. Applications can set the system code page with <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetoptiona">InternetSetOption</a> as shown in the following code example:
 * 
 * 
 * ``` syntax
 * DWORD CP_SHIFT_JIS = 932;  // ANSI/OEM  Japanese, Shift-JIS
 * InternetSetOption( hRequest, 
 *                    INTERNET_OPTION_CODEPAGE,
 *                    &amp;CP_SHIFT_JIS, 
 *                    sizeof(DWORD) );
 * ```
 * 
 * If the Unicode parameter is not properly encoded to the system code page, WinINet attempts UTF8 decoding. 
 * 
 * When items are retrieved from the cache, the system code page that was used to place the item in the cache must match the current system code page for the user. For applications running under IE6 and earlier, if decoding for the system code page fails, WinINet attempts UTF8 decoding. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines CreateUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a string value that contains the name of the URL. The string must contain a value; an empty string will cause <b>CreateUrlCacheEntry</b> to fail. In addition, the string must not contain any escape characters.
 * @param {Integer} dwExpectedFileSize Expected size of the file needed to store the data that corresponds to the source entity, in <b>TCHARs</b>. If the expected size is unknown, set this value to zero.
 * @param {PWSTR} lpszFileExtension Pointer to a string value that contains an extension name of the file in the local storage.
 * @param {PWSTR} lpszFileName Pointer to a buffer that receives the file name. The buffer should be large enough  to store the path of the created file (at least MAX_PATH  characters in length).
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-createurlcacheentryw
 * @since windows5.0
 */
export CreateUrlCacheEntryW(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
    lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    A_LastError := 0

    result := DllCall("WININET.dll\CreateUrlCacheEntryW", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Stores data in the specified file in the Internet cache and associates it with the specified URL. (ANSI)
 * @remarks
 * The STICKY_CACHE_ENTRY type is used to make cache entries exempt from scavenging. The default exempt time for entries set using 
 * <b>CommitUrlCacheEntryA</b> is ten minutes. The exempt time can be changed by setting the expires time parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure in the call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-seturlcacheentryinfoa">SetUrlCacheEntryInfo</a> function.
 * 
 * If the cache storage is full, 
 * <b>CommitUrlCacheEntryA</b> invokes cache cleanup to make space for this new file. If the cache entry already exists, the function overwrites the entry if it is not in use. An entry is in use when it has been retrieved with either 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentryfilea">RetrieveUrlCacheEntryFile</a>.
 * 
 * Clients that add entries to the cache should set the headers to at least "HTTP/1.0 200 OK\r\n\r\n"; otherwise, Microsoft Internet Explorer and other client applications should disregard the entry.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/WinInet/caching">Caching</a> for example code calling <b>CreateUrlCacheEntryA</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines CommitUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a string variable that contains the source name of the cache entry. The name string must be unique and should not contain any escape characters.
 * @param {PSTR} lpszLocalFileName Pointer to a string variable that contains the name of the local file that is being cached. This should be the same name as that returned by 
 * <b>CreateUrlCacheEntryA</b>.
 * @param {FILETIME} ExpireTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expire date and time (in Greenwich mean time) of the file that is being cached. If the expire date and time is unknown, set this parameter to zero.
 * @param {FILETIME} LastModifiedTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified date and time (in Greenwich mean time) of the URL that is being cached. If the last modified date and time is unknown, set this parameter to zero.
 * @param {Integer} CacheEntryType A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
 * 
 * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>COOKIE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cookie cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>EDITED_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>NORMAL_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Normal cache entry; can be deleted to recover space for new entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SPARSE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Partial response cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>STICKY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sticky cache entry; exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>URLHISTORY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Visited link cache entry.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} lpHeaderInfo Pointer to the buffer that contains the header information. If this parameter is not <b>NULL</b>, the header information is treated as extended attributes of the URL that are returned in the <b>lpHeaderInfo</b> 
 * member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
 * @param {Integer} cchHeaderInfo Size of the header information, in <b>TCHARs</b>. If 
 * <i>lpHeaderInfo</i> is not <b>NULL</b>, this value is assumed to indicate the size of the buffer that  stores the header information. An application can maintain headers as part of the data and provide 
 * <i>cchHeaderInfo</i> together with a <b>NULL</b> value for 
 * <i>lpHeaderInfo</i>.
 * @param {PSTR} lpszOriginalUrl Pointer to a string  that contains the original URL, if redirection has occurred.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DISK_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache storage is full.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local file is not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-commiturlcacheentrya
 * @since windows5.0
 */
export CommitUrlCacheEntryA(lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpHeaderInfo, cchHeaderInfo, lpszOriginalUrl) {
    static lpszFileExtension := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
    lpszLocalFileName := lpszLocalFileName is String ? StrPtr(lpszLocalFileName) : lpszLocalFileName
    lpszOriginalUrl := lpszOriginalUrl is String ? StrPtr(lpszOriginalUrl) : lpszOriginalUrl

    lpHeaderInfoMarshal := lpHeaderInfo is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\CommitUrlCacheEntryA", "ptr", lpszUrlName, "ptr", lpszLocalFileName, FILETIME, ExpireTime, FILETIME, LastModifiedTime, "uint", CacheEntryType, lpHeaderInfoMarshal, lpHeaderInfo, "uint", cchHeaderInfo, "ptr", lpszFileExtension, "ptr", lpszOriginalUrl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Stores data in the specified file in the Internet cache and associates it with the specified URL. (Unicode)
 * @remarks
 * The STICKY_CACHE_ENTRY type is used to make cache entries exempt from scavenging. The default exempt time for entries set using 
 * <b>CommitUrlCacheEntryW</b> is ten minutes. The exempt time can be changed by setting the expires time parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure in the call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-seturlcacheentryinfoa">SetUrlCacheEntryInfo</a> function.
 * 
 * If the cache storage is full, 
 * <b>CommitUrlCacheEntryW</b> invokes cache cleanup to make space for this new file. If the cache entry already exists, the function overwrites the entry if it is not in use. An entry is in use when it has been retrieved with either 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentryfilea">RetrieveUrlCacheEntryFile</a>.
 * 
 * Clients that add entries to the cache should set the headers to at least "HTTP/1.0 200 OK\r\n\r\n"; otherwise, Microsoft Internet Explorer and other client applications should disregard the entry.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/WinInet/caching">Caching</a> for example code calling <b>CreateUrlCacheEntryW</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines CommitUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a string variable that contains the source name of the cache entry. The name string must be unique and should not contain any escape characters.
 * @param {PWSTR} lpszLocalFileName Pointer to a string variable that contains the name of the local file that is being cached. This should be the same name as that returned by 
 * <b>CreateUrlCacheEntryW</b>.
 * @param {FILETIME} ExpireTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expire date and time (in Greenwich mean time) of the file that is being cached. If the expire date and time is unknown, set this parameter to zero.
 * @param {FILETIME} LastModifiedTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified date and time (in Greenwich mean time) of the URL that is being cached. If the last modified date and time is unknown, set this parameter to zero.
 * @param {Integer} CacheEntryType A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
 * 
 * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>COOKIE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cookie cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>EDITED_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>NORMAL_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Normal cache entry; can be deleted to recover space for new entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SPARSE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Partial response cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>STICKY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sticky cache entry; exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>URLHISTORY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Visited link cache entry.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} lpszHeaderInfo Pointer to the buffer that contains the header information. If this parameter is not <b>NULL</b>, the header information is treated as extended attributes of the URL that are returned in the 
 * <b>lpHeaderInfo</b> 
 * member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
 * @param {Integer} cchHeaderInfo Size of the header information, in <b>TCHARs</b>. If 
 * <i>lpHeaderInfo</i> is not <b>NULL</b>, this value is assumed to indicate the size of the buffer that  stores the header information. An application can maintain headers as part of the data and provide 
 * <i>cchHeaderInfo</i> together with a <b>NULL</b> value for 
 * <i>lpHeaderInfo</i>.
 * @param {PWSTR} lpszOriginalUrl Pointer to a string  that contains the original URL, if redirection has occurred.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DISK_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache storage is full.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified local file is not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-commiturlcacheentryw
 * @since windows5.0
 */
export CommitUrlCacheEntryW(lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpszHeaderInfo, cchHeaderInfo, lpszOriginalUrl) {
    static lpszFileExtension := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
    lpszLocalFileName := lpszLocalFileName is String ? StrPtr(lpszLocalFileName) : lpszLocalFileName
    lpszHeaderInfo := lpszHeaderInfo is String ? StrPtr(lpszHeaderInfo) : lpszHeaderInfo
    lpszOriginalUrl := lpszOriginalUrl is String ? StrPtr(lpszOriginalUrl) : lpszOriginalUrl

    A_LastError := 0

    result := DllCall("WININET.dll\CommitUrlCacheEntryW", "ptr", lpszUrlName, "ptr", lpszLocalFileName, FILETIME, ExpireTime, FILETIME, LastModifiedTime, "uint", CacheEntryType, "ptr", lpszHeaderInfo, "uint", cchHeaderInfo, "ptr", lpszFileExtension, "ptr", lpszOriginalUrl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Locks the cache entry file associated with the specified URL. (ANSI)
 * @remarks
 * <b>RetrieveUrlCacheEntryFile</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL http://adatum.com/example.htm#sample was passed, the function would return ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is in the cache.
 * 
 * The file is locked for the caller when it is retrieved; the caller should unlock the file after the caller is finished with the file. The cache manager automatically unlocks the files after a certain interval. While the file is locked, the cache manager will not remove the file from the cache. It is important to note that this function may or may not perform efficiently, depending on the internal implementation of the cache. For instance, if the URL data is stored in a packed file that contains data for other URLs, the cache will make a copy of the data to a file in a temporary directory maintained by the cache. The cache will eventually delete the copy. It is recommended that this function be used only in situations where a file name is needed to launch an application. 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> and associated stream functions should be used in most cases.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines RetrieveUrlCacheEntryFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a string that contains the URL of the resource associated with the cache entry. This must be a unique name. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo Pointer to a cache entry information buffer. If the buffer is not sufficient, this function returns ERROR_INSUFFICIENT_BUFFER and sets 
 * <i>lpdwCacheEntryInfoBufferSize</i> to the number of bytes required.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to an unsigned long integer variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the size, in bytes, of the actual buffer used or the number of bytes required to retrieve the cache entry file. The caller should check the return value in this parameter. If the return size is less than or equal to the size passed in, all the relevant data has been returned.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache entry specified by the source name is not found in the cache storage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of the 
 * <i>lpCacheEntryInfo</i> buffer as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to get all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-retrieveurlcacheentryfilea
 * @since windows5.0
 */
export RetrieveUrlCacheEntryFileA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\RetrieveUrlCacheEntryFileA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Locks the cache entry file associated with the specified URL. (Unicode)
 * @remarks
 * <b>RetrieveUrlCacheEntryFile</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL http://adatum.com/example.htm#sample was passed, the function would return ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is in the cache.
 * 
 * The file is locked for the caller when it is retrieved; the caller should unlock the file after the caller is finished with the file. The cache manager automatically unlocks the files after a certain interval. While the file is locked, the cache manager will not remove the file from the cache. It is important to note that this function may or may not perform efficiently, depending on the internal implementation of the cache. For instance, if the URL data is stored in a packed file that contains data for other URLs, the cache will make a copy of the data to a file in a temporary directory maintained by the cache. The cache will eventually delete the copy. It is recommended that this function be used only in situations where a file name is needed to launch an application. 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> and associated stream functions should be used in most cases.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines RetrieveUrlCacheEntryFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a string that contains the URL of the resource associated with the cache entry. This must be a unique name. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo Pointer to a cache entry information buffer. If the buffer is not sufficient, this function returns ERROR_INSUFFICIENT_BUFFER and sets 
 * <i>lpdwCacheEntryInfoBufferSize</i> to the number of bytes required.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to an unsigned long integer variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the size, in bytes, of the actual buffer used or the number of bytes required to retrieve the cache entry file. The caller should check the return value in this parameter. If the return size is less than or equal to the size passed in, all the relevant data has been returned.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache entry specified by the source name is not found in the cache storage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of the 
 * <i>lpCacheEntryInfo</i> buffer as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to get all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-retrieveurlcacheentryfilew
 * @since windows5.0
 */
export RetrieveUrlCacheEntryFileW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\RetrieveUrlCacheEntryFileW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Unlocks the cache entry that was locked while the file was retrieved for use from the cache. (UnlockUrlCacheEntryFileA)
 * @remarks
 * The application should not access the file after calling this function.
 * 
 * When this function returns, the cache manager is free to delete the cache entry.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines UnlockUrlCacheEntryFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-unlockurlcacheentryfilea
 * @since windows5.0
 */
export UnlockUrlCacheEntryFileA(lpszUrlName) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\UnlockUrlCacheEntryFileA", "ptr", lpszUrlName, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The UnlockUrlCacheEntryFileW (Unicode) function (wininet.h) unlocks the cache entry that was locked while the file was retrieved for use from the cache.
 * @remarks
 * The application should not access the file after calling this function.
 * 
 * When this function returns, the cache manager is free to delete the cache entry.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines UnlockUrlCacheEntryFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-unlockurlcacheentryfilew
 * @since windows5.0
 */
export UnlockUrlCacheEntryFileW(lpszUrlName) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\UnlockUrlCacheEntryFileW", "ptr", lpszUrlName, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The UnlockUrlCacheEntryFile function (wininet.h) unlocks the cache entry that was locked while the file was retrieved for use from the cache.
 * @remarks
 * The application should not access the file after calling this function.
 * 
 * When this function returns, the cache manager is free to delete the cache entry.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-unlockurlcacheentryfile
 * @since windows5.0
 */
export UnlockUrlCacheEntryFile(lpszUrlName) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\UnlockUrlCacheEntryFile", "ptr", lpszUrlName, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Provides the most efficient and implementation-independent way to access the cache data. (ANSI)
 * @remarks
 * <b>RetrieveUrlCacheEntryStream</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL http://adatum.com/example.htm#sample is passed, the function returns ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is in the cache.
 * 
 * Cache clients that do not need URL data in the form of a file should use this function to access the data for a particular URL.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines RetrieveUrlCacheEntryStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a null-terminated string that contains the source name of the cache entry. This must be a unique name. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size, in bytes, of the 
 * <i>lpCacheEntryInfo</i> buffer. When the function returns, the variable receives the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note that this buffer size must accommodate both the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure and the associated strings that are stored immediately following it.
 * @param {BOOL} fRandomRead Whether the stream is open for random access. Set the flag to <b>TRUE</b> to open the stream for random access.
 * @returns {HANDLE} If the function succeeds, the function returns a valid handle for use in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-readurlcacheentrystream">ReadUrlCacheEntryStream</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-unlockurlcacheentrystream">UnlockUrlCacheEntryStream</a> functions.
 * 
 * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache entry specified by the source name is not found in the cache storage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpCacheEntryInfo</i> as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-retrieveurlcacheentrystreama
 * @since windows5.0
 */
export RetrieveUrlCacheEntryStreamA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\RetrieveUrlCacheEntryStreamA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL, fRandomRead, "uint", dwReserved, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Provides the most efficient and implementation-independent way to access the cache data. (Unicode)
 * @remarks
 * <b>RetrieveUrlCacheEntryStream</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL http://adatum.com/example.htm#sample is passed, the function returns ERROR_FILE_NOT_FOUND even if http://adatum.com/example.htm is in the cache.
 * 
 * Cache clients that do not need URL data in the form of a file should use this function to access the data for a particular URL.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines RetrieveUrlCacheEntryStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a null-terminated string that contains the source name of the cache entry. This must be a unique name. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size, in bytes, of the 
 * <i>lpCacheEntryInfo</i> buffer. When the function returns, the variable receives the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note that this buffer size must accommodate both the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure and the associated strings that are stored immediately following it.
 * @param {BOOL} fRandomRead Whether the stream is open for random access. Set the flag to <b>TRUE</b> to open the stream for random access.
 * @returns {HANDLE} If the function succeeds, the function returns a valid handle for use in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-readurlcacheentrystream">ReadUrlCacheEntryStream</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-unlockurlcacheentrystream">UnlockUrlCacheEntryStream</a> functions.
 * 
 * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The cache entry specified by the source name is not found in the cache storage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpCacheEntryInfo</i> as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-retrieveurlcacheentrystreamw
 * @since windows5.0
 */
export RetrieveUrlCacheEntryStreamW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\RetrieveUrlCacheEntryStreamW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL, fRandomRead, "uint", dwReserved, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Reads the cached data from a stream that has been opened using the RetrieveUrlCacheEntryStream function.
 * @remarks
 * If the buffer size is not sufficient, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER and sets 
 * <i>lpdwLen</i> to the size necessary to contain all the information.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HANDLE} hUrlCacheStream Handle that was returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> function.
 * @param {Integer} dwLocation Offset to be read from.
 * @param {Integer} lpBuffer Pointer to a buffer that receives the data.
 * @param {Pointer<Integer>} lpdwLen Pointer to a  variable that specifies the size of the 
 * <i>lpBuffer</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-readurlcacheentrystream
 * @since windows5.0
 */
export ReadUrlCacheEntryStream(hUrlCacheStream, dwLocation, lpBuffer, lpdwLen) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpdwLenMarshal := lpdwLen is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\ReadUrlCacheEntryStream", HANDLE, hUrlCacheStream, "uint", dwLocation, "ptr", lpBuffer, lpdwLenMarshal, lpdwLen, "uint", Reserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {HANDLE} hUrlCacheStream 
 * @param {Integer} qwLocation 
 * @param {Integer} lpBuffer 
 * @param {Pointer<Integer>} lpdwLen 
 * @returns {BOOL} 
 */
export ReadUrlCacheEntryStreamEx(hUrlCacheStream, qwLocation, lpBuffer, lpdwLen) {
    lpdwLenMarshal := lpdwLen is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\ReadUrlCacheEntryStreamEx", HANDLE, hUrlCacheStream, "uint", qwLocation, "ptr", lpBuffer, lpdwLenMarshal, lpdwLen, BOOL)
    return result
}

/**
 * Closes the stream that has been retrieved using the RetrieveUrlCacheEntryStream function.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HANDLE} hUrlCacheStream Handle that was returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-unlockurlcacheentrystream
 * @since windows5.0
 */
export UnlockUrlCacheEntryStream(hUrlCacheStream) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\UnlockUrlCacheEntryStream", HANDLE, hUrlCacheStream, "uint", Reserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about a cache entry. (ANSI)
 * @remarks
 * <b>GetUrlCacheEntryInfo</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL `http://example.com/example.htm#sample` is passed, the function returns <b>ERROR_FILE_NOT_FOUND</b> even if `http://example.com/example.htm` is in the cache.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheEntryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
 * 
 * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo A pointer to a variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified cache entry is not found in the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpCacheEntryInfo</i> as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcacheentryinfoa
 * @since windows5.0
 */
export GetUrlCacheEntryInfoA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheEntryInfoA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about a cache entry. (Unicode)
 * @remarks
 * <b>GetUrlCacheEntryInfo</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL `http://example.com/example.htm#sample` is passed, the function returns <b>ERROR_FILE_NOT_FOUND</b> even if `http://example.com/example.htm` is in the cache.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheEntryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
 * 
 * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo A pointer to a variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified cache entry is not found in the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpCacheEntryInfo</i> as specified by 
 * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcacheentryinfow
 * @since windows5.0
 */
export GetUrlCacheEntryInfoW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheEntryInfoW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Initiates the enumeration of the cache groups in the Internet cache.
 * @remarks
 * The handle returned from <b>FindFirstUrlCacheGroup</b> is used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcachegroup">FindNextUrlCacheGroup</a>. At the end of the enumeration, the application should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findcloseurlcache">FindCloseUrlCache</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwFlags This parameter is reserved and must be 0.
 * @param {Integer} dwFilter 
 * @param {Pointer<Integer>} lpGroupId Pointer to the ID of the first cache group that matches the search criteria.
 * @returns {HANDLE} Returns a valid handle to the first item in the enumeration if successful, or <b>NULL</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findfirsturlcachegroup
 * @since windows5.0
 */
export FindFirstUrlCacheGroup(dwFlags, dwFilter, lpGroupId) {
    static lpSearchCondition := 0, dwSearchCondition := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpGroupIdMarshal := lpGroupId is VarRef ? "int64*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindFirstUrlCacheGroup", "uint", dwFlags, "uint", dwFilter, "ptr", lpSearchCondition, "uint", dwSearchCondition, lpGroupIdMarshal, lpGroupId, "ptr", lpReserved, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the next cache group in a cache group enumeration started by FindFirstUrlCacheGroup.
 * @remarks
 * Continue to call <b>FindNextUrlCacheGroup</b> until the last item in the cache is returned.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HANDLE} hFind The cache group enumeration handle, which is returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcachegroup">FindFirstUrlCacheGroup</a>.
 * @param {Pointer<Integer>} lpGroupId Pointer to a variable that receives the cache group identifier.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findnexturlcachegroup
 * @since windows5.0
 */
export FindNextUrlCacheGroup(hFind, lpGroupId) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpGroupIdMarshal := lpGroupId is VarRef ? "int64*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindNextUrlCacheGroup", HANDLE, hFind, lpGroupIdMarshal, lpGroupId, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the attribute information of the specified cache group. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheGroupAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} gid Identifier of the cache group.
 * @param {Integer} dwAttributes 
 * @param {Integer} lpGroupInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that receives the requested information.
 * @param {Pointer<Integer>} lpcbGroupInfo Pointer to a variable that contains the size of the 
 * <i>lpGroupInfo</i> buffer. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcachegroupattributea
 * @since windows5.0
 */
export GetUrlCacheGroupAttributeA(gid, dwAttributes, lpGroupInfo, lpcbGroupInfo) {
    static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpcbGroupInfoMarshal := lpcbGroupInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheGroupAttributeA", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, lpcbGroupInfoMarshal, lpcbGroupInfo, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the attribute information of the specified cache group. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheGroupAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} gid Identifier of the cache group.
 * @param {Integer} dwAttributes 
 * @param {Integer} lpGroupInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that receives the requested information.
 * @param {Pointer<Integer>} lpcbGroupInfo Pointer to a variable that contains the size of the 
 * <i>lpGroupInfo</i> buffer. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcachegroupattributew
 * @since windows5.0
 */
export GetUrlCacheGroupAttributeW(gid, dwAttributes, lpGroupInfo, lpcbGroupInfo) {
    static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpcbGroupInfoMarshal := lpcbGroupInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheGroupAttributeW", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, lpcbGroupInfoMarshal, lpcbGroupInfo, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the attribute information of the specified cache group. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheGroupAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} gid Identifier of the cache group.
 * @param {Integer} dwAttributes 
 * @param {Pointer<INTERNET_CACHE_GROUP_INFOA>} lpGroupInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that specifies the attribute information to be stored.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcachegroupattributea
 * @since windows5.0
 */
export SetUrlCacheGroupAttributeA(gid, dwAttributes, lpGroupInfo) {
    static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\SetUrlCacheGroupAttributeA", "int64", gid, "uint", dwFlags, "uint", dwAttributes, INTERNET_CACHE_GROUP_INFOA.Ptr, lpGroupInfo, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the attribute information of the specified cache group. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheGroupAttribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} gid Identifier of the cache group.
 * @param {Integer} dwAttributes 
 * @param {Pointer<INTERNET_CACHE_GROUP_INFOW>} lpGroupInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that specifies the attribute information to be stored.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcachegroupattributew
 * @since windows5.0
 */
export SetUrlCacheGroupAttributeW(gid, dwAttributes, lpGroupInfo) {
    static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\SetUrlCacheGroupAttributeW", "int64", gid, "uint", dwFlags, "uint", dwAttributes, INTERNET_CACHE_GROUP_INFOW.Ptr, lpGroupInfo, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information on the cache entry associated with the specified URL, taking into account any redirections that are applied in offline mode by the HttpSendRequest function. (ANSI)
 * @remarks
 * <b>GetUrlCacheEntryInfoEx</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL `http://example.com/example.htm#sample` is passed, the function returns ERROR_FILE_NOT_FOUND even if `http://example.com/example.htm` is in the cache.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheEntryInfoEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
 * 
 * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer in bytes.
 * @param {Integer} dwFlags This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if the URL was located, or <b>FALSE</b> otherwise. Call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for specific error information. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL was not found in the cache index, even after taking any cached redirections into account.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer referenced by 
 * <i>lpCacheEntryInfo</i> was not large enough to hold the requested information. The size of the buffer needed will be returned to 
 * <i>lpdwCacheEntryInfoBufSize</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcacheentryinfoexa
 * @since windows5.0
 */
export GetUrlCacheEntryInfoExA(lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, dwFlags) {
    static lpszRedirectUrl := 0, lpcbRedirectUrl := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheEntryInfoExA", "ptr", lpszUrl, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpszRedirectUrl, "uint*", lpcbRedirectUrl, "ptr", lpReserved, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information on the cache entry associated with the specified URL, taking into account any redirections that are applied in offline mode by the HttpSendRequest function. (Unicode)
 * @remarks
 * <b>GetUrlCacheEntryInfoEx</b> does not do any URL parsing, so a URL containing an anchor (#) will not be found in the cache, even if the resource is cached. For example, if the URL `http://example.com/example.htm#sample` is passed, the function returns ERROR_FILE_NOT_FOUND even if `http://example.com/example.htm` is in the cache.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines GetUrlCacheEntryInfoEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
 * @param {Integer} lpCacheEntryInfo A pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
 * 
 * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer in bytes.
 * @param {Integer} dwFlags This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if the URL was located, or <b>FALSE</b> otherwise. Call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for specific error information. Possible errors include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The URL was not found in the cache index, even after taking any cached redirections into account.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer referenced by 
 * <i>lpCacheEntryInfo</i> was not large enough to hold the requested information. The size of the buffer needed will be returned to 
 * <i>lpdwCacheEntryInfoBufSize</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-geturlcacheentryinfoexw
 * @since windows5.0
 */
export GetUrlCacheEntryInfoExW(lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, dwFlags) {
    static lpszRedirectUrl := 0, lpcbRedirectUrl := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheEntryInfoExW", "ptr", lpszUrl, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpszRedirectUrl, "uint*", lpcbRedirectUrl, "ptr", lpReserved, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the specified members of the INTERNET_CACHE_ENTRY_INFO structure. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheEntryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a null-terminated string that specifies the name of the cache entry. The name string should not contain any escape characters.
 * @param {Pointer<INTERNET_CACHE_ENTRY_INFOA>} lpCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure containing the values to be assigned to the cache entry designated by 
 * <i>lpszUrlName</i>.
 * @param {Integer} dwFieldControl 
 * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified cache entry is not found in the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value(s) to be set is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentryinfoa
 * @since windows5.0
 */
export SetUrlCacheEntryInfoA(lpszUrlName, lpCacheEntryInfo, dwFieldControl) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\SetUrlCacheEntryInfoA", "ptr", lpszUrlName, INTERNET_CACHE_ENTRY_INFOA.Ptr, lpCacheEntryInfo, "uint", dwFieldControl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the specified members of the INTERNET_CACHE_ENTRY_INFO structure. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheEntryInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a null-terminated string that specifies the name of the cache entry. The name string should not contain any escape characters.
 * @param {Pointer<INTERNET_CACHE_ENTRY_INFOW>} lpCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure containing the values to be assigned to the cache entry designated by 
 * <i>lpszUrlName</i>.
 * @param {Integer} dwFieldControl 
 * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified cache entry is not found in the cache.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The value(s) to be set is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentryinfow
 * @since windows5.0
 */
export SetUrlCacheEntryInfoW(lpszUrlName, lpCacheEntryInfo, dwFieldControl) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\SetUrlCacheEntryInfoW", "ptr", lpszUrlName, INTERNET_CACHE_ENTRY_INFOW.Ptr, lpCacheEntryInfo, "uint", dwFieldControl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Generates cache group identifications.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwFlags Controls the creation of the cache group. This parameter can be set to 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">CACHEGROUP_FLAG_GIDONLY</a>, which causes 
 * <b>CreateUrlCacheGroup</b> to generate a unique GROUPID, but does not create a physical group.
 * @returns {Integer} Returns a valid <b>GROUPID</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-createurlcachegroup
 * @since windows5.0
 */
export CreateUrlCacheGroup(dwFlags) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\CreateUrlCacheGroup", "uint", dwFlags, "ptr", lpReserved, Int64)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Releases the specified GROUPID and any associated state in the cache index file.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} GroupId ID of the cache group to be released.
 * @param {Integer} dwFlags Controls the cache group deletion. This can be set to 
 * any member of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">cache group constants</a>. When this parameter is set to <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">CACHEGROUP_FLAG_FLUSHURL_ONDELETE</a>, it causes 
 * <b>DeleteUrlCacheGroup</b> to delete all of the cache entries associated with this group, unless the entry belongs to another group.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-deleteurlcachegroup
 * @since windows5.0
 */
export DeleteUrlCacheGroup(GroupId, dwFlags) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheGroup", "int64", GroupId, "uint", dwFlags, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds entries to or removes entries from a cache group. (SetUrlCacheEntryGroupA)
 * @remarks
 * A cache entry can belong to more than one cache group.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheEntryGroup as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
 * @param {Integer} dwFlags 
 * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentrygroupa
 * @since windows5.0
 */
export SetUrlCacheEntryGroupA(lpszUrlName, dwFlags, GroupId) {
    static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    result := DllCall("WININET.dll\SetUrlCacheEntryGroupA", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, BOOL)
    return result
}

/**
 * The SetUrlCacheEntryGroupW (Unicode) function (wininet.h) adds entries to or removes entries from a cache group.
 * @remarks
 * A cache entry can belong to more than one cache group.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines SetUrlCacheEntryGroup as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
 * @param {Integer} dwFlags 
 * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentrygroupw
 * @since windows5.0
 */
export SetUrlCacheEntryGroupW(lpszUrlName, dwFlags, GroupId) {
    static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    result := DllCall("WININET.dll\SetUrlCacheEntryGroupW", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, BOOL)
    return result
}

/**
 * The SetUrlCacheEntryGroup function (wininet.h) adds entries to or removes entries from a cache group.
 * @remarks
 * A cache entry can belong to more than one cache group.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
 * @param {Integer} dwFlags 
 * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentrygroup
 * @since windows5.0
 */
export SetUrlCacheEntryGroup(lpszUrlName, dwFlags, GroupId) {
    static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    result := DllCall("WININET.dll\SetUrlCacheEntryGroup", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, BOOL)
    return result
}

/**
 * Starts a filtered enumeration of the Internet cache. (ANSI)
 * @remarks
 * The handle returned from <b>FindFirstUrlCacheEntryEx</b> is used in all subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentryexa">FindNextUrlCacheEntryEx</a>. At the end of the enumeration, the application should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findcloseurlcache">FindCloseUrlCache</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindFirstUrlCacheEntryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, <b>FindFirstUrlCacheEntryEx</b> returns all content entries in the cache.
 * @param {Integer} dwFlags Controls the enumeration. No flags are currently implemented; this parameter must be set to zero.
 * @param {Integer} dwFilter A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
 * 
 * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>COOKIE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cookie cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>EDITED_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>NORMAL_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Normal cache entry; can be deleted to recover space for new entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SPARSE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Partial response cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>STICKY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sticky cache entry; exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>URLHISTORY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Visited link cache entry.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} GroupId ID of the cache group to be enumerated. Set this parameter to zero to enumerate all entries that are not grouped.
 * @param {Integer} lpFirstCacheEntryInfo Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure to receive the cache entry information.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to variable that indicates the size of 
 * the structure referenced by the <i>lpFirstCacheEntryInfo</i> parameter, in bytes.
 * @returns {HANDLE} Returns a valid handle if successful, or NULL otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findfirsturlcacheentryexa
 * @since windows5.0
 */
export FindFirstUrlCacheEntryExA(lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
    static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindFirstUrlCacheEntryExA", "ptr", lpszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Starts a filtered enumeration of the Internet cache. (Unicode)
 * @remarks
 * The handle returned from <b>FindFirstUrlCacheEntryEx</b> is used in all subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentryexa">FindNextUrlCacheEntryEx</a>. At the end of the enumeration, the application should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findcloseurlcache">FindCloseUrlCache</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindFirstUrlCacheEntryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, <b>FindFirstUrlCacheEntryEx</b> returns all content entries in the cache.
 * @param {Integer} dwFlags Controls the enumeration. No flags are currently implemented; this parameter must be set to zero.
 * @param {Integer} dwFilter A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
 * 
 * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>COOKIE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cookie cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>EDITED_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>NORMAL_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Normal cache entry; can be deleted to recover space for new entries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>SPARSE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Partial response cache entry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>STICKY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sticky cache entry; exempt from scavenging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not currently implemented.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>URLHISTORY_CACHE_ENTRY</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Visited link cache entry.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} GroupId ID of the cache group to be enumerated. Set this parameter to zero to enumerate all entries that are not grouped.
 * @param {Integer} lpFirstCacheEntryInfo Pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure to receive the cache entry information.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to variable that indicates the size of 
 * the structure referenced by the <i>lpFirstCacheEntryInfo</i> parameter, in bytes.
 * @returns {HANDLE} Returns a valid handle if successful, or NULL otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
 * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findfirsturlcacheentryexw
 * @since windows5.0
 */
export FindFirstUrlCacheEntryExW(lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
    static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindFirstUrlCacheEntryExW", "ptr", lpszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Finds the next cache entry in a cache enumeration started by the FindFirstUrlCacheEntryEx function. (ANSI)
 * @remarks
 * Continue to call <b>FindNextUrlCacheEntryEx</b> until the last item in the cache is returned.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindNextUrlCacheEntryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hEnumHandle Handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentryexa">FindFirstUrlCacheEntryEx</a>, which started a cache enumeration.
 * @param {Integer} lpNextCacheEntryInfo Pointer to the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives the cache entry information.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that indicates the size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findnexturlcacheentryexa
 * @since windows5.0
 */
export FindNextUrlCacheEntryExA(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
    static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindNextUrlCacheEntryExA", HANDLE, hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Finds the next cache entry in a cache enumeration started by the FindFirstUrlCacheEntryEx function. (Unicode)
 * @remarks
 * Continue to call <b>FindNextUrlCacheEntryEx</b> until the last item in the cache is returned.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindNextUrlCacheEntryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hEnumHandle Handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentryexa">FindFirstUrlCacheEntryEx</a>, which started a cache enumeration.
 * @param {Integer} lpNextCacheEntryInfo Pointer to the  
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives the cache entry information.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that indicates the size of the buffer, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findnexturlcacheentryexw
 * @since windows5.0
 */
export FindNextUrlCacheEntryExW(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
    static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindNextUrlCacheEntryExW", HANDLE, hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Begins the enumeration of the Internet cache. (ANSI)
 * @remarks
 * The handle returned from <b>FindFirstUrlCacheEntry</b> is used in all subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a>. At the end of the enumeration, the application should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findcloseurlcache">FindCloseUrlCache</a>.
 * 
 * <b>FindFirstUrlCacheEntry</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> return variable size information. If ERROR_INSUFFICIENT_BUFFER is returned, the application should allocate a buffer of the size specified by 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-b-using-buffers">Using Buffers</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindFirstUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or <b>NULL</b>. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is <b>NULL</b>, <b>FindFirstUrlCacheEntry</b> returns all content entries in the cache.
 * @param {Integer} lpFirstCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpFirstCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size needed to retrieve the cache entry, in bytes.
 * @returns {HANDLE} Returns a handle that the application can use in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> function to retrieve subsequent entries in the cache. If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * ERROR_INSUFFICIENT_BUFFER indicates that the size of 
 * <i>lpFirstCacheEntryInfo</i> as specified by 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findfirsturlcacheentrya
 * @since windows5.0
 */
export FindFirstUrlCacheEntryA(lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
    lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindFirstUrlCacheEntryA", "ptr", lpszUrlSearchPattern, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Begins the enumeration of the Internet cache. (Unicode)
 * @remarks
 * The handle returned from <b>FindFirstUrlCacheEntry</b> is used in all subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a>. At the end of the enumeration, the application should call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findcloseurlcache">FindCloseUrlCache</a>.
 * 
 * <b>FindFirstUrlCacheEntry</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> return variable size information. If ERROR_INSUFFICIENT_BUFFER is returned, the application should allocate a buffer of the size specified by 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-b-using-buffers">Using Buffers</a>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindFirstUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or <b>NULL</b>. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is <b>NULL</b>, <b>FindFirstUrlCacheEntry</b> returns all content entries in the cache.
 * @param {Integer} lpFirstCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpFirstCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size needed to retrieve the cache entry, in bytes.
 * @returns {HANDLE} Returns a handle that the application can use in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> function to retrieve subsequent entries in the cache. If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * ERROR_INSUFFICIENT_BUFFER indicates that the size of 
 * <i>lpFirstCacheEntryInfo</i> as specified by 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwFirstCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findfirsturlcacheentryw
 * @since windows5.0
 */
export FindFirstUrlCacheEntryW(lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
    lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindFirstUrlCacheEntryW", "ptr", lpszUrlSearchPattern, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the next entry in the Internet cache. (ANSI)
 * @remarks
 * Continue to call <b>FindNextUrlCacheEntry</b> until the last item in the cache is returned. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindNextUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hEnumHandle Handle to the enumeration obtained from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a>.
 * @param {Integer} lpNextCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpNextCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the size of the buffer required to retrieve the cache entry, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpNextCacheEntryInfo</i> as specified by 
 * <i>lpdwNextCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwNextCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration completed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findnexturlcacheentrya
 * @since windows5.0
 */
export FindNextUrlCacheEntryA(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindNextUrlCacheEntryA", HANDLE, hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the next entry in the Internet cache. (Unicode)
 * @remarks
 * Continue to call <b>FindNextUrlCacheEntry</b> until the last item in the cache is returned. 
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines FindNextUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} hEnumHandle Handle to the enumeration obtained from a previous call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a>.
 * @param {Integer} lpNextCacheEntryInfo Pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
 * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
 * <i>lpNextCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the size of the buffer required to retrieve the cache entry, in bytes.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of 
 * <i>lpNextCacheEntryInfo</i> as specified by 
 * <i>lpdwNextCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
 * <i>lpdwNextCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration completed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findnexturlcacheentryw
 * @since windows5.0
 */
export FindNextUrlCacheEntryW(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
    lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\FindNextUrlCacheEntryW", HANDLE, hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Closes the specified cache enumeration handle.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HANDLE} hEnumHandle Handle returned by a previous call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-findcloseurlcache
 * @since windows5.0
 */
export FindCloseUrlCache(hEnumHandle) {
    A_LastError := 0

    result := DllCall("WININET.dll\FindCloseUrlCache", HANDLE, hEnumHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Removes the file associated with the source name from the cache, if the file exists. (DeleteUrlCacheEntryA)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines DeleteUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is not in the cache.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-deleteurlcacheentrya
 * @since windows5.0
 */
export DeleteUrlCacheEntryA(lpszUrlName) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheEntryA", "ptr", lpszUrlName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeleteUrlCacheEntryW (Unicode) function (wininet.h) removes the file associated with the source name from the cache, if the file exists.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines DeleteUrlCacheEntry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is not in the cache.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-deleteurlcacheentryw
 * @since windows5.0
 */
export DeleteUrlCacheEntryW(lpszUrlName) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheEntryW", "ptr", lpszUrlName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeleteUrlCacheEntry function (wininet.h) removes the file associated with the source name from the cache, if the file exists.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The file is not in the cache.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-deleteurlcacheentry
 * @since windows5.0
 */
export DeleteUrlCacheEntry(lpszUrlName) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheEntry", "ptr", lpszUrlName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetDialA (ANSI) function (wininet.h) initiates a connection to the Internet using a modem.
 * @remarks
 * <b>InternetDial</b> does not support double-dial connections, SmartCard authentication, or connections that require registry-based certification.
 * 
 * <div class="alert"><b>Note</b>  Starting on Windows Vista and Windows Server 2008, the WinINet dial-up functions use the <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-functions">RAS  functions</a> to establish a dial-up connection. WinINet supports the functionality documented in the <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a> function.</div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetDial as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {PSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
 * @param {Integer} dwFlags 
 * @param {Pointer<Pointer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique identifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
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
 * One or more of the parameters are incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is a problem with the dial-up connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetdiala
 * @since windows5.0
 */
export InternetDialA(hwndParent, lpszConnectoid, dwFlags, lpdwConnection) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    lpdwConnectionMarshal := lpdwConnection is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\InternetDialA", HWND, hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, UInt32)
    return result
}

/**
 * The InternetDialW (Unicode) function (wininet.h) initiates a connection to the Internet using a modem.
 * @remarks
 * <b>InternetDial</b> does not support double-dial connections, SmartCard authentication, or connections that require registry-based certification.
 * 
 * <div class="alert"><b>Note</b>  Starting on Windows Vista and Windows Server 2008, the WinINet dial-up functions use the <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-functions">RAS  functions</a> to establish a dial-up connection. WinINet supports the functionality documented in the <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a> function.</div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetDial as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {PWSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
 * @param {Integer} dwFlags 
 * @param {Pointer<Pointer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique identifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
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
 * One or more of the parameters are incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is a problem with the dial-up connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetdialw
 * @since windows5.0
 */
export InternetDialW(hwndParent, lpszConnectoid, dwFlags, lpdwConnection) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    lpdwConnectionMarshal := lpdwConnection is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\InternetDialW", HWND, hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, UInt32)
    return result
}

/**
 * The InternetDial function (wininet.h) initiates a connection to the Internet using a modem.
 * @remarks
 * <b>InternetDial</b> does not support double-dial connections, SmartCard authentication, or connections that require registry-based certification.
 * 
 * <div class="alert"><b>Note</b>  Starting on Windows Vista and Windows Server 2008, the WinINet dial-up functions use the <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-functions">RAS  functions</a> to establish a dial-up connection. WinINet supports the functionality documented in the <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a> function.</div>
 * <div> </div>
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {PSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
 * @param {Integer} dwFlags 
 * @param {Pointer<Integer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique identifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
 * @param {Integer} dwReserved This parameter is reserved and must be <b>NULL</b>.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
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
 * One or more of the parameters are incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_CONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is a problem with the dial-up connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetdial
 * @since windows5.0
 */
export InternetDial(hwndParent, lpszConnectoid, dwFlags, lpdwConnection, dwReserved) {
    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    lpdwConnectionMarshal := lpdwConnection is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetDial", HWND, hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, UInt32)
    return result
}

/**
 * The InternetHangUp function (wininet.h) instructs the modem to disconnect from the Internet.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer} dwConnection Connection number of  the connection to be disconnected.
 * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internethangup
 * @since windows5.0
 */
export InternetHangUp(dwConnection) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    result := DllCall("WININET.dll\InternetHangUp", "ptr", dwConnection, "uint", dwReserved, UInt32)
    return result
}

/**
 * The InternetGoOnlineA (ANSI) function (wininet.h) prompts the user for permission to initiate connection to a URL.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGoOnline as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {Integer} dwFlags This parameter can be zero or the following flag.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
 * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag is not used.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * 
 * If the functions fails, it can  return the following error code:
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
 * One or more of the parameters is incorrect.
 * 
 * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgoonlinea
 * @since windows5.0
 */
export InternetGoOnlineA(lpszURL, hwndParent, dwFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGoOnlineA", "ptr", lpszURL, HWND, hwndParent, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetGoOnlineW (Unicode) function (wininet.h) prompts the user for permission to initiate connection to a URL.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGoOnline as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {Integer} dwFlags This parameter can be zero or the following flag.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
 * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag is not used.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * 
 * If the functions fails, it can  return the following error code:
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
 * One or more of the parameters is incorrect.
 * 
 * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgoonlinew
 * @since windows5.0
 */
export InternetGoOnlineW(lpszURL, hwndParent, dwFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGoOnlineW", "ptr", lpszURL, HWND, hwndParent, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetGoOnline function (wininet.h) prompts the user for permission to initiate connection to a URL.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
 * @param {HWND} hwndParent Handle to the parent window.
 * @param {Integer} dwFlags This parameter can be zero or the following flag.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
 * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag is not used.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * 
 * If the functions fails, it can  return the following error code:
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
 * One or more of the parameters is incorrect.
 * 
 * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgoonline
 * @since windows5.0
 */
export InternetGoOnline(lpszURL, hwndParent, dwFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGoOnline", "ptr", lpszURL, HWND, hwndParent, "uint", dwFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetAutodial function (wininet.h) causes the modem to automatically dial the default Internet connection.
 * @remarks
 * <b>InternetAutodial</b> does not support double-dial connections, SmartCard authentication, or connections that require registry-based certification.
 * 
 * <div class="alert"><b>Note</b>  Starting on Windows Vista and Windows Server 2008, the WinINet dial-up functions use the <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-functions">RAS  functions</a> to establish a dial-up connection. WinINet supports the functionality documented in the <a href="https://docs.microsoft.com/windows/desktop/api/rasdlg/nf-rasdlg-rasdialdlga">RasDialDlg</a> function.</div>
 * <div> </div>
 * <b>InternetAutodial</b> does not attempt to dial if there is an existing dial-up connection on the system. Also, if there is an existing LAN connection, and <b>InternetAutodial</b> is not configured to force dial (set the <b>INTERNET_AUTODIAL_FORCE_ONLINE</b> in the <i>dwFlags</i> parameter), <b>InternetAutodial</b> does not attempt to dial the connection and returns <b>TRUE</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {INTERNET_AUTODIAL} dwFlags 
 * @param {HWND} hwndParent Handle to the parent window.
 * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetautodial
 * @since windows5.0
 */
export InternetAutodial(dwFlags, hwndParent) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetAutodial", INTERNET_AUTODIAL, dwFlags, HWND, hwndParent, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetAutodialHangup function (wininet.h) disconnects an automatic dial-up connection.
 * @remarks
 * <b>InternetAutoDialHangup</b> returns <b>TRUE</b> if autodial is not enabled, or if autodial is enabled but does not have an entry configured on the computer.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
 * 
 * 
 * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetautodialhangup
 * @since windows5.0
 */
export InternetAutodialHangup() {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\InternetAutodialHangup", "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetGetConnectedState function (wininet.h) retrieves the connected state of the local system and is not recommended for use.
 * @remarks
 * A return value of <b>TRUE</b> from <b>InternetGetConnectedState</b> indicates that at least one connection to the Internet is available.  It does not guarantee that a connection to a specific host can be established. Applications should always check for errors returned from API calls that connect to a server. <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcheckconnectiona">InternetCheckConnection</a> can be called to determine if a connection to a specific destination can be established.
 * 
 * A return value of <b>TRUE</b> indicates that either the modem connection is active, or a LAN connection is active and a proxy is properly configured for the LAN. A return value of <b>FALSE</b> indicates that neither the modem nor the LAN is connected. If <b>FALSE</b> is returned, the <b>INTERNET_CONNECTION_CONFIGURED</b> flag may be set to indicate that autodial is configured to "always dial" but is not currently active. If autodial is not configured, the function returns <b>FALSE</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<INTERNET_CONNECTION>} lpdwFlags 
 * @returns {BOOL} Returns <b>TRUE</b> if there is an active modem or a LAN Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
 * 
 * When <b>InternetGetConnectedState</b> returns <b>FALSE</b>, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetconnectedstate
 * @since windows5.0
 */
export InternetGetConnectedState(lpdwFlags) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetConnectedState", lpdwFlagsMarshal, lpdwFlags, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetGetConnectedStateExA (ANSI) function (wininet.h) retrieves the connected state of the specified Internet connection and is not recommended for use.
 * @remarks
 * A return value of <b>TRUE</b> from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> indicates that at least one connection to the Internet is available.  It does not guarantee that a connection to a specific host can be established.    Applications should always check for errors returned from API calls that connect to a server. <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcheckconnectiona">InternetCheckConnection</a> can be called to determine if a connection to a specific destination can be established.
 * 
 * A return value of <b>TRUE</b> indicates that either the modem connection is active, or a LAN connection is active and a proxy is properly configured for the LAN. A return value of <b>FALSE</b> indicates that neither the modem nor the LAN is connected. If <b>FALSE</b> is returned, the <b>INTERNET_CONNECTION_CONFIGURED</b> flag may be set to indicate that autodial is configured to "always dial" but is not currently active. If autodial is not configured, the function returns <b>FALSE</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetConnectedStateEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<INTERNET_CONNECTION>} lpdwFlags 
 * @param {PSTR} lpszConnectionName Pointer to a string value that receives the connection name.
 * @param {Integer} cchNameLen TBD
 * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetconnectedstateexa
 * @since windows5.0
 */
export InternetGetConnectedStateExA(lpdwFlags, lpszConnectionName, cchNameLen) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetConnectedStateExA", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", cchNameLen, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetGetConnectedStateExW (Unicode) function (wininet.h) retrieves the connected state of the specified Internet connection and is not recommended for use.
 * @remarks
 * A return value of <b>TRUE</b> from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> indicates that at least one connection to the Internet is available.  It does not guarantee that a connection to a specific host can be established.    Applications should always check for errors returned from API calls that connect to a server. <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcheckconnectiona">InternetCheckConnection</a> can be called to determine if a connection to a specific destination can be established.
 * 
 * A return value of <b>TRUE</b> indicates that either the modem connection is active, or a LAN connection is active and a proxy is properly configured for the LAN. A return value of <b>FALSE</b> indicates that neither the modem nor the LAN is connected. If <b>FALSE</b> is returned, the <b>INTERNET_CONNECTION_CONFIGURED</b> flag may be set to indicate that autodial is configured to "always dial" but is not currently active. If autodial is not configured, the function returns <b>FALSE</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetConnectedStateEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<INTERNET_CONNECTION>} lpdwFlags 
 * @param {PWSTR} lpszConnectionName Pointer to a string value that receives the connection name.
 * @param {Integer} cchNameLen TBD
 * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetconnectedstateexw
 * @since windows5.0
 */
export InternetGetConnectedStateExW(lpdwFlags, lpszConnectionName, cchNameLen) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetConnectedStateExW", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", cchNameLen, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {WPAD_CACHE_DELETE} param0 
 * @returns {BOOL} 
 */
export DeleteWpadCacheForNetworks(param0) {
    result := DllCall("WININET.dll\DeleteWpadCacheForNetworks", WPAD_CACHE_DELETE, param0, BOOL)
    return result
}

/**
 * The InternetInitializeAutoProxyDll function (wininet.h) is one of two WinINet functions named InternetInitializeAutoProxyDll.
 * @remarks
 * Because the <b>InternetInitializeAutoProxyDll</b> function takes time to complete its operation, it should not be called from  a UI thread.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwReserved This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetinitializeautoproxydll
 * @since windows5.0
 */
export InternetInitializeAutoProxyDll(dwReserved) {
    A_LastError := 0

    result := DllCall("WININET.dll\InternetInitializeAutoProxyDll", "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DetectAutoProxyUrl function (wininet.h) attempts to determine the location of a WPAD autoproxy script.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} pszAutoProxyUrl Pointer to a buffer to receive the URL from which a WPAD autoproxy script can be downloaded.
 * @param {Integer} cchAutoProxyUrl Size of 
 * the buffer pointed to by <i>lpszAutoProxyUrl</i>, in bytes.
 * @param {PROXY_AUTO_DETECT_TYPE} dwDetectFlags 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-detectautoproxyurl
 * @since windows5.0
 */
export DetectAutoProxyUrl(pszAutoProxyUrl, cchAutoProxyUrl, dwDetectFlags) {
    pszAutoProxyUrl := pszAutoProxyUrl is String ? StrPtr(pszAutoProxyUrl) : pszAutoProxyUrl

    A_LastError := 0

    result := DllCall("WININET.dll\DetectAutoProxyUrl", "ptr", pszAutoProxyUrl, "uint", cchAutoProxyUrl, PROXY_AUTO_DETECT_TYPE, dwDetectFlags, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The CreateMD5SSOHash function (wininet.h) obtains the Microsoft Passport password, creates an MD5 hash using a specific string, and returns the result.
 * @remarks
 * Once the <b>CreateMD5SSOHash</b> function successfully obtains the Microsoft Passport password for the specified account or realm, it converts both the challenge string and the password from wide characters to multi-byte (generally 8-bit) characters, concatenates them, and uses the RSA library to generate an MD5 hash from the resulting key. It then converts the hash into a <b>null</b>-terminated string of 8-bit hexadecimal digits (using lowercase letters) which it places in the buffer pointed to by the <i>pbHexHash</i> parameter. 
 * 
 * The output buffer pointed to by  <i>pbHexHash</i> must therefore be long enough to accept two bytes for each of the 16 bytes of the hash, plus a terminating <b>null</b> character, for a total of 33 bytes.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PWSTR} pszChallengeInfo Pointer to the wide-character challenge string to use for the MD5 hash.
 * @param {PWSTR} pwszRealm Pointer to a string that names a realm for which to obtain the password. This parameter is ignored unless <i>pwszTarget</i> is <b>NULL</b>. If both <i>pwszTarget</i> and <i>pwszRealm</i> are <b>NULL</b>, the default realm is used.
 * @param {PWSTR} pwszTarget Pointer to a string that names an account for which to obtain the password. If <i>pwszTarget</i> is <b>NULL</b>, the realm indicated by <i>pwszRealm</i> is used.
 * @param {Pointer<Integer>} pbHexHash Pointer to an output buffer into which the MD5 hash is returned in hex string format. This buffer must be at least 33 bytes long.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-createmd5ssohash
 * @since windows5.0
 */
export CreateMD5SSOHash(pszChallengeInfo, pwszRealm, pwszTarget, pbHexHash) {
    pszChallengeInfo := pszChallengeInfo is String ? StrPtr(pszChallengeInfo) : pszChallengeInfo
    pwszRealm := pwszRealm is String ? StrPtr(pwszRealm) : pwszRealm
    pwszTarget := pwszTarget is String ? StrPtr(pwszTarget) : pwszTarget

    pbHexHashMarshal := pbHexHash is VarRef ? "char*" : "ptr"

    result := DllCall("WININET.dll\CreateMD5SSOHash", "ptr", pszChallengeInfo, "ptr", pwszRealm, "ptr", pwszTarget, pbHexHashMarshal, pbHexHash, BOOL)
    return result
}

/**
 * The InternetGetConnectedStateEx function (wininet.h) retrieves the connected state of the specified Internet connection and is not recommended for use.
 * @remarks
 * A return value of <b>TRUE</b> from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> indicates that at least one connection to the Internet is available.  It does not guarantee that a connection to a specific host can be established.    Applications should always check for errors returned from API calls that connect to a server. <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcheckconnectiona">InternetCheckConnection</a> can be called to determine if a connection to a specific destination can be established.
 * 
 * A return value of <b>TRUE</b> indicates that either the modem connection is active, or a LAN connection is active and a proxy is properly configured for the LAN. A return value of <b>FALSE</b> indicates that neither the modem nor the LAN is connected. If <b>FALSE</b> is returned, the <b>INTERNET_CONNECTION_CONFIGURED</b> flag may be set to indicate that autodial is configured to "always dial" but is not currently active. If autodial is not configured, the function returns <b>FALSE</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Pointer<INTERNET_CONNECTION>} lpdwFlags 
 * @param {PSTR} lpszConnectionName Pointer to a string value that receives the connection name.
 * @param {Integer} dwNameLen Size of the 
 * <i>lpszConnectionName</i> string, in <b>TCHARs</b>.
 * @param {Integer} dwReserved This parameter is reserved and must be <b>NULL</b>.
 * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetconnectedstateex
 * @since windows5.0
 */
export InternetGetConnectedStateEx(lpdwFlags, lpszConnectionName, dwNameLen, dwReserved) {
    lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

    lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WININET.dll\InternetGetConnectedStateEx", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", dwNameLen, "uint", dwReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The InternetSetDialStateA (ANSI) function (wininet.h) is not supported, is obsolete, and should not be used.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetDialState as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszConnectoid Unused.
 * @param {Integer} dwState Unused.
 * @returns {BOOL} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetdialstatea
 */
export InternetSetDialStateA(lpszConnectoid, dwState) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    result := DllCall("WININET.dll\InternetSetDialStateA", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, BOOL)
    return result
}

/**
 * The InternetSetDialStateW (Unicode) function (wininet.h) is not supported, is obsolete, and should not be used.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetDialState as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszConnectoid Unused.
 * @param {Integer} dwState Unused.
 * @returns {BOOL} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetdialstatew
 */
export InternetSetDialStateW(lpszConnectoid, dwState) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    result := DllCall("WININET.dll\InternetSetDialStateW", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, BOOL)
    return result
}

/**
 * The InternetSetDialState function (wininet.h) is not supported, is obsolete, and should not be used.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {PSTR} lpszConnectoid Unused.
 * @param {Integer} dwState Unused.
 * @param {Integer} dwReserved Unused.
 * @returns {BOOL} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetdialstate
 */
export InternetSetDialState(lpszConnectoid, dwState, dwReserved) {
    lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

    result := DllCall("WININET.dll\InternetSetDialState", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, BOOL)
    return result
}

/**
 * Sets a decision on cookies for a given domain. (ANSI)
 * @remarks
 * WinINet minimizes the domain specified in the <i>pchHostName</i> parameter and sets the cookie policy on the minimum legal domain. For example, if the specified host name is  widgets.microsoft.com, the policy is set on the minimized host name microsoft.com.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
 * @param {Integer} dwDecision A value of type <b>DWORD</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
 * @returns {BOOL} Returns <b>TRUE</b> if the decision is set and <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetpersitecookiedecisiona
 * @since windows5.0
 */
export InternetSetPerSiteCookieDecisionA(pchHostName, dwDecision) {
    pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

    result := DllCall("WININET.dll\InternetSetPerSiteCookieDecisionA", "ptr", pchHostName, "uint", dwDecision, BOOL)
    return result
}

/**
 * Sets a decision on cookies for a given domain. (Unicode)
 * @remarks
 * WinINet minimizes the domain specified in the <i>pchHostName</i> parameter and sets the cookie policy on the minimum legal domain. For example, if the specified host name is  widgets.microsoft.com, the policy is set on the minimized host name microsoft.com.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetSetPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
 * @param {Integer} dwDecision A value of type <b>DWORD</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
 * @returns {BOOL} Returns <b>TRUE</b> if the decision is set and <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetsetpersitecookiedecisionw
 * @since windows5.0
 */
export InternetSetPerSiteCookieDecisionW(pchHostName, dwDecision) {
    pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

    result := DllCall("WININET.dll\InternetSetPerSiteCookieDecisionW", "ptr", pchHostName, "uint", dwDecision, BOOL)
    return result
}

/**
 * Retrieves a decision on cookies for a given domain. (ANSI)
 * @remarks
 * A return value of <b>FALSE</b> may indicate that the domain <i>pchHostName</i> does not have any site-specific cookie regulations.
 * 
 * 
 * 
 * WinINet minimizes the domain specified in the <i>pchHostName</i> parameter and sets the cookie policy on the minimum legal domain. For example, if the specified host name is  widgets.microsoft.com, the policy is set on the minimized host name microsoft.com.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
 * @param {Pointer<Integer>} pResult A pointer to an <b>unsigned long</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
 * @returns {BOOL} Returns <b>TRUE</b> if the decision was retrieved and <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetpersitecookiedecisiona
 * @since windows5.0
 */
export InternetGetPerSiteCookieDecisionA(pchHostName, pResult) {
    pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

    pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetPerSiteCookieDecisionA", "ptr", pchHostName, pResultMarshal, pResult, BOOL)
    return result
}

/**
 * Retrieves a decision on cookies for a given domain. (Unicode)
 * @remarks
 * A return value of <b>FALSE</b> may indicate that the domain <i>pchHostName</i> does not have any site-specific cookie regulations.
 * 
 * 
 * 
 * WinINet minimizes the domain specified in the <i>pchHostName</i> parameter and sets the cookie policy on the minimum legal domain. For example, if the specified host name is  widgets.microsoft.com, the policy is set on the minimized host name microsoft.com.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetGetPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
 * @param {Pointer<Integer>} pResult A pointer to an <b>unsigned long</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
 * @returns {BOOL} Returns <b>TRUE</b> if the decision was retrieved and <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetgetpersitecookiedecisionw
 * @since windows5.0
 */
export InternetGetPerSiteCookieDecisionW(pchHostName, pResult) {
    pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

    pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetPerSiteCookieDecisionW", "ptr", pchHostName, pResultMarshal, pResult, BOOL)
    return result
}

/**
 * Clears all decisions that were made about cookies on a site by site basis.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @returns {BOOL} Returns <b>TRUE</b> if all decisions were cleared and <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetclearallpersitecookiedecisions
 * @since windows5.0
 */
export InternetClearAllPerSiteCookieDecisions() {
    result := DllCall("WININET.dll\InternetClearAllPerSiteCookieDecisions", BOOL)
    return result
}

/**
 * The InternetEnumPerSiteCookieDecisionA (ANSI) function (wininet.h) retrieves the domains and cookie settings of websites with set site-specific cookie regulations.
 * @remarks
 * <b>InternetEnumPerSiteCookieDecision</b> should be initially called with <i>dwIndex</i> equal to 0. Incrementing the <i>dwIndex</i> parameter steps through the list of websites and cookie settings. The end of the list is reached when <b>InternetEnumPerSiteCookieDecision</b> returns <b>FALSE</b> and produces the wininet error, <b>ERROR_NO_MORE_ITEMS</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetEnumPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pszSiteName An <b>LPSTR</b> that receives a string specifying a website domain.
 * @param {Pointer<Integer>} pcSiteNameSize A pointer to an unsigned long that specifies the size of the <i>pcSiteNameSize</i> parameter provided to the InternetEnumPerSiteCookieDecision function when it is called. When <b>InternetEnumPerSiteCookieDecision</b> returns, <i>pcSiteNameSize</i> receives the actual length of the domain string returned in <i>pszSiteName</i>.
 * @param {Pointer<Integer>} pdwDecision Pointer to an unsigned long that receives the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration value corresponding to <i>pszSiteName</i>.
 * @param {Integer} dwIndex An unsigned long that specifies the index of the website and corresponding cookie setting to retrieve.
 * @returns {BOOL} <b>TRUE</b> if the function retrieved the cookie setting for the given domain; otherwise, false. <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetenumpersitecookiedecisiona
 * @since windows5.0
 */
export InternetEnumPerSiteCookieDecisionA(pszSiteName, pcSiteNameSize, pdwDecision, dwIndex) {
    pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName

    pcSiteNameSizeMarshal := pcSiteNameSize is VarRef ? "uint*" : "ptr"
    pdwDecisionMarshal := pdwDecision is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetEnumPerSiteCookieDecisionA", "ptr", pszSiteName, pcSiteNameSizeMarshal, pcSiteNameSize, pdwDecisionMarshal, pdwDecision, "uint", dwIndex, BOOL)
    return result
}

/**
 * The InternetEnumPerSiteCookieDecisionW (Unicode) function (wininet.h) retrieves the domains and cookie settings of websites with set site-specific cookie regulations.
 * @remarks
 * <b>InternetEnumPerSiteCookieDecision</b> should be initially called with <i>dwIndex</i> equal to 0. Incrementing the <i>dwIndex</i> parameter steps through the list of websites and cookie settings. The end of the list is reached when <b>InternetEnumPerSiteCookieDecision</b> returns <b>FALSE</b> and produces the wininet error, <b>ERROR_NO_MORE_ITEMS</b>.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines InternetEnumPerSiteCookieDecision as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pszSiteName An <b>LPSTR</b> that receives a string specifying a website domain.
 * @param {Pointer<Integer>} pcSiteNameSize A pointer to an unsigned long that specifies the size of the <i>pcSiteNameSize</i> parameter provided to the InternetEnumPerSiteCookieDecision function when it is called. When <b>InternetEnumPerSiteCookieDecision</b> returns, <i>pcSiteNameSize</i> receives the actual length of the domain string returned in <i>pszSiteName</i>.
 * @param {Pointer<Integer>} pdwDecision Pointer to an unsigned long that receives the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration value corresponding to <i>pszSiteName</i>.
 * @param {Integer} dwIndex An unsigned long that specifies the index of the website and corresponding cookie setting to retrieve.
 * @returns {BOOL} <b>TRUE</b> if the function retrieved the cookie setting for the given domain; otherwise, false. <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-internetenumpersitecookiedecisionw
 * @since windows5.0
 */
export InternetEnumPerSiteCookieDecisionW(pszSiteName, pcSiteNameSize, pdwDecision, dwIndex) {
    pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName

    pcSiteNameSizeMarshal := pcSiteNameSize is VarRef ? "uint*" : "ptr"
    pdwDecisionMarshal := pdwDecision is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetEnumPerSiteCookieDecisionW", "ptr", pszSiteName, pcSiteNameSizeMarshal, pcSiteNameSize, pdwDecisionMarshal, pdwDecision, "uint", dwIndex, BOOL)
    return result
}

/**
 * The PrivacySetZonePreferenceW (Unicode) function (wininet.h) sets the privacy settings for a given URLZONE and PrivacyType.
 * @remarks
 * These privacy settings for the Internet zone are found on the <b>Privacy</b> tab of the <b>Internet Options</b> dialog box.
 * 
 * Setting the privacy options for the <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone">URLZONE_INTERNET</a> involves setting the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-templates">privacy templates</a> for both <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyTypes</a>. The slider on the <b>Privacy</b> Menu in <b>Internet Options</b> only moves if privacy is set for both <b>PrivacyTypes</b>.
 * 
 * Custom privacy preferences for a given <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone">URLZONE</a> and <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyType</a> can be set through the <i>pszPreference</i> parameter. The <i>pszPreference</i> parameter can contain a series of rules separated by white space describing the privacy preferences. It is important to note that the rules themselves cannot contain white space. The <i>pszPreference</i> has the following structure where there can be multiple logical rules: &lt;<i>signature</i>&gt; &lt;<i>logical-rule</i>&gt; &lt;<i>special-rule</i>&gt;.
 * 
 * Currently, the signature must be set to IE6-P3PSettings/V1:.
 * 
 * Logical rules have the following format: /&lt;<i>expression</i>&gt;=&lt;<i>decision</i>&gt;/.
 * 
 * An expression is a Boolean statement composed of compact policy tokens using the operators &amp; (logical AND) and ! (logical NOT). The compact policy token is case-sensitive. (For more information on Platform for Privacy Preferences (P3P) privacy policies and compact policy tokens, see the <a href="https://www.w3.org/P3P/">W3C: Platform for Privacy Preferences (P3P) Project</a>  specification.) The decision is a single lowercase character that defines the action to take on the cookie whose compact policy contains the specified token(s). The following table lists valid decision characters.
 * 
 * <table>
 * <tr>
 * <th>Character</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>a</td>
 * <td>Accept the cookie.</td>
 * </tr>
 * <tr>
 * <td>p</td>
 * <td>Prompt user to accept or deny the cookie.</td>
 * </tr>
 * <tr>
 * <td>r</td>
 * <td>Reject the cookie.</td>
 * </tr>
 * <tr>
 * <td>l</td>
 * <td>Leash the cookie (only send it in a first-party context).</td>
 * </tr>
 * <tr>
 * <td>d</td>
 * <td>Downgrade the cookie, if it is a persistent cookie, to a session cookie.</td>
 * </tr>
 * </table>
 *  
 * 
 * Logical rules are evaluated in the order they are listed. The first logical-rule to be matched, if any, determines the cookie action.
 * 
 * An empty expression is also allowed. If an expression is empty, the left side evaluates to true. This form of a logical-rule can be used at the end of a set of rules to catch all situations that did not fall into the other categories.
 * 
 * The following examples show valid logical rules. 
 * 
 * 
 * ``` syntax
 * /DEM=d/
 *     Deny a cookie whose compact policy contains the DEM token
 * /CON&amp;!TEL=a/	
 *     Accept a cookie whose compact policy contains the CON token 
 *     and does not contain the TEL token
 * /=a/		
 *     Accept all cookies
 * ```
 * 
 * Special rules are specified using the nopolicy, session, and always symbols. The nopolicy symbol is used to specify the action to taken when there is no compact policy. For example nopolicy=d specifies to downgrade all cookies without a compact policy to session cookies. The session symbol is used to specify the action to take on session cookies and can only be set to a. When session=a is specified, all session cookies are accepted regardless of the content of the compact policy. If this rule is not specified, session cookies are subject to the same rules as persistent cookies. Finally, the always symbol is used to specify to perform the same action for everything. For example, always=d specifies to deny all cookies regardless of the existence of a compact policy. Note that always=d is equivalent to /=d/.
 * 
 * The following example shows a privacy preferences string that specifies to accept cookies for which the compact policy contains a FIN/CONi token pair, reject cookies with compact policies containing FIN/CON, FIN/CONo, FIN/CONa and GOV/PUB token pairs or a TEL token, and to prompt the user when a cookie's compact policy contains the UNR token. It also specifies to downgrade cookies without a compact policy to session cookies and to accept all cookies that do not match one of the given rules. Note that the first rule that evaluates to true determines the cookie action. 
 * 
 * 
 * ``` syntax
 * IE6-P3PSettings/V1: /FIN&amp;CONi=a/ /FIN&amp;CONo=r/ /FIN&amp;CONa=r/ /FIN&amp;CON=r/ 
 * /GOV&amp;PUB=r/ /TEL=r/ /UNR=p/ nopolicy=d /=a/
 * ```
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwZone Value of type <b>DWORD</b> that specifies the <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone">URLZONE</a> for which privacy settings are being set.
 * @param {Integer} dwType Value of type <b>DWORD</b> that specifies the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyType</a> for which privacy settings are being set.
 * @param {Integer} dwTemplate Value of type <b>DWORD</b> that specifies which of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-templates">privacy templates</a> is to be used to set the privacy settings.
 * @param {PWSTR} pszPreference If <i>dwTemplate</i> is set to <b>PRIVACY_TEMPLATE_CUSTOM</b>, this parameter is the string representation of the custom preferences. Otherwise, it should be set to <b>NULL</b>. A description of this string representation is included in the Remarks section.
 * @returns {Integer} Returns zero if successful. Otherwise, one of the errors defined in winerr.h is returned.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-privacysetzonepreferencew
 * @since windows5.0
 */
export PrivacySetZonePreferenceW(dwZone, dwType, dwTemplate, pszPreference) {
    pszPreference := pszPreference is String ? StrPtr(pszPreference) : pszPreference

    result := DllCall("WININET.dll\PrivacySetZonePreferenceW", "uint", dwZone, "uint", dwType, "uint", dwTemplate, "ptr", pszPreference, UInt32)
    return result
}

/**
 * The PrivacyGetZonePreferenceW (Unicode) function (wininet.h) retrieves the privacy settings for a given URLZONE and PrivacyType.
 * @remarks
 * These privacy settings for the Internet zone are found on the Privacy tab of the Internet Options dialog box.
 * 
 * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @param {Integer} dwZone A value of type <i>DWORD</i> that specifies the <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone">URLZONE</a> for which privacy settings are being retrieved.
 * @param {Integer} dwType A value of type <i>DWORD</i> that specifies the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyType</a> for which privacy settings are being retrieved.
 * @param {Pointer<Integer>} pdwTemplate An <b>LPDWORD</b> that returns a pointer to a <b>DWORD</b> containing which of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-templates">PrivacyTemplates</a> is in use for this <i>dwZone</i> and <i>dwType</i>.
 * @param {PWSTR} pszBuffer An  <b>LPWSTR</b> that points to a buffer containing a <b>LPCWSTR</b> representing a string version of the <i>pdwTemplate</i> or a customized string if the <i>pdwTemplate</i> is set to <b>PRIVACY_TEMPLATE_CUSTOM</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-privacysetzonepreferencew">PrivacySetZonePreferenceW</a> for a description of a customized privacy preferences string.
 * @param {Pointer<Integer>} pdwBufferLength An <b>LPDWORD</b> that contains the buffer length in characters. If the buffer length is not sufficient, <b>PrivacyGetZonePreferenceW</b> returns with this parameter set to the number of characters required and with a return value of <b>ERROR_MORE_DATA</b>.
 * @returns {Integer} Returns zero if successful. Otherwise, one of the Error Messages defined in winerr.h is returned.
 * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-privacygetzonepreferencew
 * @since windows5.0
 */
export PrivacyGetZonePreferenceW(dwZone, dwType, pdwTemplate, pszBuffer, pdwBufferLength) {
    pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

    pdwTemplateMarshal := pdwTemplate is VarRef ? "uint*" : "ptr"
    pdwBufferLengthMarshal := pdwBufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\PrivacyGetZonePreferenceW", "uint", dwZone, "uint", dwType, pdwTemplateMarshal, pdwTemplate, "ptr", pszBuffer, pdwBufferLengthMarshal, pdwBufferLength, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pcwszUrl 
 * @param {Pointer<BOOL>} pfIsHsts 
 * @returns {Integer} 
 */
export HttpIsHostHstsEnabled(pcwszUrl, pfIsHsts) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    pfIsHstsMarshal := pfIsHsts is VarRef ? "int*" : "ptr"

    result := DllCall("WININET.dll\HttpIsHostHstsEnabled", "ptr", pcwszUrl, pfIsHstsMarshal, pfIsHsts, UInt32)
    return result
}

/**
 * 
 * @param {ALG_ID} ai 
 * @param {PSTR} lpstr 
 * @param {Pointer<Integer>} lpdwstrLength 
 * @returns {BOOL} 
 */
export InternetAlgIdToStringA(ai, lpstr, lpdwstrLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

    lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetAlgIdToStringA", ALG_ID, ai, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {ALG_ID} ai 
 * @param {PWSTR} lpstr 
 * @param {Pointer<Integer>} lpdwstrLength 
 * @returns {BOOL} 
 */
export InternetAlgIdToStringW(ai, lpstr, lpdwstrLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

    lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetAlgIdToStringW", ALG_ID, ai, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {Integer} dwProtocol 
 * @param {PSTR} lpstr 
 * @param {Pointer<Integer>} lpdwstrLength 
 * @returns {BOOL} 
 */
export InternetSecurityProtocolToStringA(dwProtocol, lpstr, lpdwstrLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

    lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetSecurityProtocolToStringA", "uint", dwProtocol, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {Integer} dwProtocol 
 * @param {PWSTR} lpstr 
 * @param {Pointer<Integer>} lpdwstrLength 
 * @returns {BOOL} 
 */
export InternetSecurityProtocolToStringW(dwProtocol, lpstr, lpdwstrLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

    lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetSecurityProtocolToStringW", "uint", dwProtocol, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} lpszURL 
 * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
 * @param {Pointer<Integer>} pdwSecureFlags 
 * @returns {BOOL} 
 */
export InternetGetSecurityInfoByURLA(lpszURL, ppCertChain, pdwSecureFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
    pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetSecurityInfoByURLA", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpszURL 
 * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
 * @param {Pointer<Integer>} pdwSecureFlags 
 * @returns {BOOL} 
 */
export InternetGetSecurityInfoByURLW(lpszURL, ppCertChain, pdwSecureFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
    pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetSecurityInfoByURLW", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} lpszURL 
 * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
 * @param {Pointer<Integer>} pdwSecureFlags 
 * @returns {BOOL} 
 */
export InternetGetSecurityInfoByURL(lpszURL, ppCertChain, pdwSecureFlags) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
    pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetGetSecurityInfoByURL", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, BOOL)
    return result
}

/**
 * 
 * @param {HWND} hWndParent 
 * @param {Pointer<INTERNET_SECURITY_INFO>} pSecurityInfo 
 * @returns {Integer} 
 */
export ShowSecurityInfo(hWndParent, pSecurityInfo) {
    result := DllCall("WININET.dll\ShowSecurityInfo", HWND, hWndParent, INTERNET_SECURITY_INFO.Ptr, pSecurityInfo, UInt32)
    return result
}

/**
 * 
 * @param {HWND} hWndParent 
 * @param {Integer} lpCert 
 * @param {Integer} cbCert 
 * @returns {Integer} 
 */
export ShowX509EncodedCertificate(hWndParent, lpCert, cbCert) {
    result := DllCall("WININET.dll\ShowX509EncodedCertificate", HWND, hWndParent, "ptr", lpCert, "uint", cbCert, UInt32)
    return result
}

/**
 * 
 * @param {HWND} hWndParent 
 * @returns {Integer} 
 */
export ShowClientAuthCerts(hWndParent) {
    result := DllCall("WININET.dll\ShowClientAuthCerts", HWND, hWndParent, UInt32)
    return result
}

/**
 * 
 * @param {Integer} lpCert 
 * @param {Integer} cbCert 
 * @param {PSTR} lpszListBoxEntry 
 * @param {Pointer<Integer>} lpdwListBoxEntry 
 * @returns {Integer} 
 */
export ParseX509EncodedCertificateForListBoxEntry(lpCert, cbCert, lpszListBoxEntry, lpdwListBoxEntry) {
    lpszListBoxEntry := lpszListBoxEntry is String ? StrPtr(lpszListBoxEntry) : lpszListBoxEntry

    lpdwListBoxEntryMarshal := lpdwListBoxEntry is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\ParseX509EncodedCertificateForListBoxEntry", "ptr", lpCert, "uint", cbCert, "ptr", lpszListBoxEntry, lpdwListBoxEntryMarshal, lpdwListBoxEntry, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} lpszURL 
 * @param {HWND} hwndParent 
 * @returns {BOOL} 
 */
export InternetShowSecurityInfoByURLA(lpszURL, hwndParent) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    result := DllCall("WININET.dll\InternetShowSecurityInfoByURLA", "ptr", lpszURL, HWND, hwndParent, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpszURL 
 * @param {HWND} hwndParent 
 * @returns {BOOL} 
 */
export InternetShowSecurityInfoByURLW(lpszURL, hwndParent) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    result := DllCall("WININET.dll\InternetShowSecurityInfoByURLW", "ptr", lpszURL, HWND, hwndParent, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} lpszURL 
 * @param {HWND} hwndParent 
 * @returns {BOOL} 
 */
export InternetShowSecurityInfoByURL(lpszURL, hwndParent) {
    lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

    result := DllCall("WININET.dll\InternetShowSecurityInfoByURL", "ptr", lpszURL, HWND, hwndParent, BOOL)
    return result
}

/**
 * 
 * @param {Integer} dwCommand 
 * @param {HWND} _hwnd 
 * @returns {BOOL} 
 */
export InternetFortezzaCommand(dwCommand, _hwnd) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    result := DllCall("WININET.dll\InternetFortezzaCommand", "uint", dwCommand, HWND, _hwnd, "ptr", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pdwStatus 
 * @returns {BOOL} 
 */
export InternetQueryFortezzaStatus(pdwStatus) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternetQueryFortezzaStatus", pdwStatusMarshal, pdwStatus, "ptr", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hFile 
 * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersIn 
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext 
 * @returns {BOOL} 
 */
export InternetWriteFileExA(hFile, lpBuffersIn, dwFlags, dwContext) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetWriteFileExA", hFileMarshal, hFile, INTERNET_BUFFERSA.Ptr, lpBuffersIn, "uint", dwFlags, "ptr", dwContext, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hFile 
 * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersIn 
 * @param {Integer} dwFlags 
 * @param {Pointer} dwContext 
 * @returns {BOOL} 
 */
export InternetWriteFileExW(hFile, lpBuffersIn, dwFlags, dwContext) {
    hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetWriteFileExW", hFileMarshal, hFile, INTERNET_BUFFERSW.Ptr, lpBuffersIn, "uint", dwFlags, "ptr", dwContext, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pszSymbol 
 * @returns {Integer} 
 */
export FindP3PPolicySymbol(pszSymbol) {
    pszSymbol := pszSymbol is String ? StrPtr(pszSymbol) : pszSymbol

    result := DllCall("WININET.dll\FindP3PPolicySymbol", "ptr", pszSymbol, Int32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszUrl 
 * @param {Pointer<PWSTR>} ppwszUserName 
 * @param {Pointer<PWSTR>} ppwszPassword 
 * @returns {Integer} 
 */
export HttpGetServerCredentials(pwszUrl, ppwszUserName, ppwszPassword) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    ppwszUserNameMarshal := ppwszUserName is VarRef ? "ptr*" : "ptr"
    ppwszPasswordMarshal := ppwszPassword is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\HttpGetServerCredentials", "ptr", pwszUrl, ppwszUserNameMarshal, ppwszUserName, ppwszPasswordMarshal, ppwszPassword, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hRequest 
 * @param {Pointer<HTTP_PUSH_TRANSPORT_SETTING>} pTransportSetting 
 * @param {Pointer<HTTP_PUSH_WAIT_HANDLE>} phWait 
 * @returns {Integer} 
 */
export HttpPushEnable(hRequest, pTransportSetting, phWait) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpPushEnable", hRequestMarshal, hRequest, HTTP_PUSH_TRANSPORT_SETTING.Ptr, pTransportSetting, HTTP_PUSH_WAIT_HANDLE.Ptr, phWait, UInt32)
    return result
}

/**
 * 
 * @param {HTTP_PUSH_WAIT_HANDLE} hWait 
 * @param {HTTP_PUSH_WAIT_TYPE} eType 
 * @param {Pointer<HTTP_PUSH_NOTIFICATION_STATUS>} pNotificationStatus 
 * @returns {Integer} 
 */
export HttpPushWait(hWait, eType, pNotificationStatus) {
    result := DllCall("WININET.dll\HttpPushWait", HTTP_PUSH_WAIT_HANDLE, hWait, HTTP_PUSH_WAIT_TYPE, eType, HTTP_PUSH_NOTIFICATION_STATUS.Ptr, pNotificationStatus, UInt32)
    return result
}

/**
 * 
 * @param {HTTP_PUSH_WAIT_HANDLE} hWait 
 * @returns {String} Nothing - always returns an empty string
 */
export HttpPushClose(hWait) {
    DllCall("WININET.dll\HttpPushClose", HTTP_PUSH_WAIT_HANDLE, hWait)
}

/**
 * 
 * @param {PSTR} lpszUrl 
 * @param {PSTR} lpszComplianceToken 
 * @param {Pointer<BOOL>} lpfFound 
 * @param {HWND} _hWnd 
 * @param {Pointer<Void>} lpvReserved 
 * @returns {BOOL} 
 */
export HttpCheckDavComplianceA(lpszUrl, lpszComplianceToken, lpfFound, _hWnd, lpvReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszComplianceToken := lpszComplianceToken is String ? StrPtr(lpszComplianceToken) : lpszComplianceToken

    lpfFoundMarshal := lpfFound is VarRef ? "int*" : "ptr"
    lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpCheckDavComplianceA", "ptr", lpszUrl, "ptr", lpszComplianceToken, lpfFoundMarshal, lpfFound, HWND, _hWnd, lpvReservedMarshal, lpvReserved, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpszUrl 
 * @param {PWSTR} lpszComplianceToken 
 * @param {Pointer<BOOL>} lpfFound 
 * @param {HWND} _hWnd 
 * @param {Pointer<Void>} lpvReserved 
 * @returns {BOOL} 
 */
export HttpCheckDavComplianceW(lpszUrl, lpszComplianceToken, lpfFound, _hWnd, lpvReserved) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszComplianceToken := lpszComplianceToken is String ? StrPtr(lpszComplianceToken) : lpszComplianceToken

    lpfFoundMarshal := lpfFound is VarRef ? "int*" : "ptr"
    lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpCheckDavComplianceW", "ptr", lpszUrl, "ptr", lpszComplianceToken, lpfFoundMarshal, lpfFound, HWND, _hWnd, lpvReservedMarshal, lpvReserved, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} lpszUrlName 
 * @param {Integer} dwFlags 
 * @param {Pointer<FILETIME>} pftLastModified 
 * @returns {BOOL} 
 */
export IsUrlCacheEntryExpiredA(lpszUrlName, dwFlags, pftLastModified) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    result := DllCall("WININET.dll\IsUrlCacheEntryExpiredA", "ptr", lpszUrlName, "uint", dwFlags, FILETIME.Ptr, pftLastModified, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpszUrlName 
 * @param {Integer} dwFlags 
 * @param {Pointer<FILETIME>} pftLastModified 
 * @returns {BOOL} 
 */
export IsUrlCacheEntryExpiredW(lpszUrlName, dwFlags, pftLastModified) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

    result := DllCall("WININET.dll\IsUrlCacheEntryExpiredW", "ptr", lpszUrlName, "uint", dwFlags, FILETIME.Ptr, pftLastModified, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} lpszUrlName 
 * @param {Integer} dwExpectedFileSize 
 * @param {PWSTR} lpszFileExtension 
 * @param {PWSTR} lpszFileName 
 * @param {Integer} dwReserved 
 * @param {BOOL} fPreserveIncomingFileName 
 * @returns {BOOL} 
 */
export CreateUrlCacheEntryExW(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved, fPreserveIncomingFileName) {
    lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
    lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    result := DllCall("WININET.dll\CreateUrlCacheEntryExW", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, BOOL, fPreserveIncomingFileName, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pwszUrlName 
 * @param {Pointer<Integer>} dwType 
 * @param {Pointer<FILETIME>} pftExpireTime 
 * @param {Pointer<FILETIME>} pftAccessTime 
 * @param {Pointer<FILETIME>} pftModifiedTime 
 * @param {Pointer<Pointer<Integer>>} ppbBlob 
 * @param {Pointer<Integer>} pcbBlob 
 * @returns {Integer} 
 */
export GetUrlCacheEntryBinaryBlob(pwszUrlName, dwType, pftExpireTime, pftAccessTime, pftModifiedTime, ppbBlob, pcbBlob) {
    pwszUrlName := pwszUrlName is String ? StrPtr(pwszUrlName) : pwszUrlName

    dwTypeMarshal := dwType is VarRef ? "uint*" : "ptr"
    ppbBlobMarshal := ppbBlob is VarRef ? "ptr*" : "ptr"
    pcbBlobMarshal := pcbBlob is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\GetUrlCacheEntryBinaryBlob", "ptr", pwszUrlName, dwTypeMarshal, dwType, FILETIME.Ptr, pftExpireTime, FILETIME.Ptr, pftAccessTime, FILETIME.Ptr, pftModifiedTime, ppbBlobMarshal, ppbBlob, pcbBlobMarshal, pcbBlob, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszUrlName 
 * @param {Integer} dwType 
 * @param {FILETIME} ftExpireTime 
 * @param {FILETIME} ftModifiedTime 
 * @param {Pointer<Integer>} pbBlob 
 * @param {Integer} cbBlob 
 * @returns {Integer} 
 */
export CommitUrlCacheEntryBinaryBlob(pwszUrlName, dwType, ftExpireTime, ftModifiedTime, pbBlob, cbBlob) {
    pwszUrlName := pwszUrlName is String ? StrPtr(pwszUrlName) : pwszUrlName

    pbBlobMarshal := pbBlob is VarRef ? "char*" : "ptr"

    result := DllCall("WININET.dll\CommitUrlCacheEntryBinaryBlob", "ptr", pwszUrlName, "uint", dwType, FILETIME, ftExpireTime, FILETIME, ftModifiedTime, pbBlobMarshal, pbBlob, "uint", cbBlob, UInt32)
    return result
}

/**
 * Creates a cache container in the specified cache path to hold cache entries based on the specified name, cache prefix, and container type. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winineti.h header defines CreateUrlCacheContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} Name The name to give to the cache.
 * @param {PSTR} lpCachePrefix The cache prefix to base the cache on.
 * @param {PSTR} lpszCachePath The cache prefix to create the cache in.
 * @param {Integer} KBCacheLimit The size limit of the cache in whole kilobytes, or 0 for the default size.
 * @param {Integer} dwContainerType The container type to base the cache on.
 * @param {Integer} dwOptions This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-createurlcachecontainera
 * @since windows5.0
 */
export CreateUrlCacheContainerA(Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions) {
    static pvBuffer := 0, cbBuffer := 0 ;Reserved parameters must always be NULL

    Name := Name is String ? StrPtr(Name) : Name
    lpCachePrefix := lpCachePrefix is String ? StrPtr(lpCachePrefix) : lpCachePrefix
    lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

    A_LastError := 0

    result := DllCall("WININET.dll\CreateUrlCacheContainerA", "ptr", Name, "ptr", lpCachePrefix, "ptr", lpszCachePath, "uint", KBCacheLimit, "uint", dwContainerType, "uint", dwOptions, "ptr", pvBuffer, "uint*", cbBuffer, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a cache container in the specified cache path to hold cache entries based on the specified name, cache prefix, and container type. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winineti.h header defines CreateUrlCacheContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} Name The name to give to the cache.
 * @param {PWSTR} lpCachePrefix The cache prefix to base the cache on.
 * @param {PWSTR} lpszCachePath The cache prefix to create the cache in.
 * @param {Integer} KBCacheLimit The size limit of the cache in whole kilobytes, or 0 for the default size.
 * @param {Integer} dwContainerType The container type to base the cache on.
 * @param {Integer} dwOptions This parameter is reserved and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-createurlcachecontainerw
 * @since windows5.0
 */
export CreateUrlCacheContainerW(Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions) {
    static pvBuffer := 0, cbBuffer := 0 ;Reserved parameters must always be NULL

    Name := Name is String ? StrPtr(Name) : Name
    lpCachePrefix := lpCachePrefix is String ? StrPtr(lpCachePrefix) : lpCachePrefix
    lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

    A_LastError := 0

    result := DllCall("WININET.dll\CreateUrlCacheContainerW", "ptr", Name, "ptr", lpCachePrefix, "ptr", lpszCachePath, "uint", KBCacheLimit, "uint", dwContainerType, "uint", dwOptions, "ptr", pvBuffer, "uint*", cbBuffer, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Deletes a cache container (which contains cache entries) based on the specified name. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service nor when impersonating a security context. For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines DeleteUrlCacheContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} Name The name of the cache container to be deleted.
 * @param {Integer} dwOptions This parameter is reserved, and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-deleteurlcachecontainera
 * @since windows5.0
 */
export DeleteUrlCacheContainerA(Name, dwOptions) {
    Name := Name is String ? StrPtr(Name) : Name

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheContainerA", "ptr", Name, "uint", dwOptions, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Deletes a cache container (which contains cache entries) based on the specified name. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service nor when impersonating a security context. For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines DeleteUrlCacheContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} Name The name of the cache container to be deleted.
 * @param {Integer} dwOptions This parameter is reserved, and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-deleteurlcachecontainerw
 * @since windows5.0
 */
export DeleteUrlCacheContainerW(Name, dwOptions) {
    Name := Name is String ? StrPtr(Name) : Name

    A_LastError := 0

    result := DllCall("WININET.dll\DeleteUrlCacheContainerW", "ptr", Name, "uint", dwOptions, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Pointer<Integer>} pdwModified 
 * @param {Integer} lpContainerInfo 
 * @param {Pointer<Integer>} lpcbContainerInfo 
 * @param {Integer} dwOptions 
 * @returns {HANDLE} 
 */
export FindFirstUrlCacheContainerA(pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions) {
    pdwModifiedMarshal := pdwModified is VarRef ? "uint*" : "ptr"
    lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\FindFirstUrlCacheContainerA", pdwModifiedMarshal, pdwModified, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "uint", dwOptions, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pdwModified 
 * @param {Integer} lpContainerInfo 
 * @param {Pointer<Integer>} lpcbContainerInfo 
 * @param {Integer} dwOptions 
 * @returns {HANDLE} 
 */
export FindFirstUrlCacheContainerW(pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions) {
    pdwModifiedMarshal := pdwModified is VarRef ? "uint*" : "ptr"
    lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\FindFirstUrlCacheContainerW", pdwModifiedMarshal, pdwModified, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "uint", dwOptions, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hEnumHandle 
 * @param {Integer} lpContainerInfo 
 * @param {Pointer<Integer>} lpcbContainerInfo 
 * @returns {BOOL} 
 */
export FindNextUrlCacheContainerA(hEnumHandle, lpContainerInfo, lpcbContainerInfo) {
    lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\FindNextUrlCacheContainerA", HANDLE, hEnumHandle, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} hEnumHandle 
 * @param {Integer} lpContainerInfo 
 * @param {Pointer<Integer>} lpcbContainerInfo 
 * @returns {BOOL} 
 */
export FindNextUrlCacheContainerW(hEnumHandle, lpContainerInfo, lpcbContainerInfo) {
    lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\FindNextUrlCacheContainerW", HANDLE, hEnumHandle, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, BOOL)
    return result
}

/**
 * Frees space in the cache. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service nor when impersonating a security context. For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines FreeUrlCacheSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszCachePath The path for the cache.
 * @param {Integer} dwSize The percentage of the cache to free (in the range 1 to 100, inclusive).
 * @param {Integer} dwFilter This parameter is reserved, and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-freeurlcachespacea
 * @since windows5.0
 */
export FreeUrlCacheSpaceA(lpszCachePath, dwSize, dwFilter) {
    lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

    A_LastError := 0

    result := DllCall("WININET.dll\FreeUrlCacheSpaceA", "ptr", lpszCachePath, "uint", dwSize, "uint", dwFilter, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees space in the cache. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service nor when impersonating a security context. For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines FreeUrlCacheSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszCachePath The path for the cache.
 * @param {Integer} dwSize The percentage of the cache to free (in the range 1 to 100, inclusive).
 * @param {Integer} dwFilter This parameter is reserved, and must be 0.
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-freeurlcachespacew
 * @since windows5.0
 */
export FreeUrlCacheSpaceW(lpszCachePath, dwSize, dwFilter) {
    lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

    A_LastError := 0

    result := DllCall("WININET.dll\FreeUrlCacheSpaceW", "ptr", lpszCachePath, "uint", dwSize, "uint", dwFilter, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Integer} ullTargetSize 
 * @param {Integer} dwFilter 
 * @returns {Integer} 
 */
export UrlCacheFreeGlobalSpace(ullTargetSize, dwFilter) {
    result := DllCall("WININET.dll\UrlCacheFreeGlobalSpace", "uint", ullTargetSize, "uint", dwFilter, UInt32)
    return result
}

/**
 * 
 * @param {Integer} dwFilter 
 * @param {Pointer<Integer>} pullSize 
 * @param {Pointer<Integer>} pullLimit 
 * @returns {Integer} 
 */
export UrlCacheGetGlobalCacheSize(dwFilter, pullSize, pullLimit) {
    pullSizeMarshal := pullSize is VarRef ? "uint*" : "ptr"
    pullLimitMarshal := pullLimit is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheGetGlobalCacheSize", "uint", dwFilter, pullSizeMarshal, pullSize, pullLimitMarshal, pullLimit, UInt32)
    return result
}

/**
 * Retrieves information about cache configuration. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines GetUrlCacheConfigInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<INTERNET_CACHE_CONFIG_INFOA>} lpCacheConfigInfo A pointer to an 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
 *        that receives information about the cache configuration. The <b>dwStructSize</b> field of 
 *        the structure should be initialized to the size of 
 *        <b>INTERNET_CACHE_CONFIG_INFO</b>.
 * @param {CACHE_CONFIG} dwFieldControl 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get 
 *        extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-geturlcacheconfiginfoa
 * @since windows5.1.2600
 */
export GetUrlCacheConfigInfoA(lpCacheConfigInfo, dwFieldControl) {
    static lpcbCacheConfigInfo := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheConfigInfoA", INTERNET_CACHE_CONFIG_INFOA.Ptr, lpCacheConfigInfo, "uint*", lpcbCacheConfigInfo, CACHE_CONFIG, dwFieldControl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about cache configuration. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winineti.h header defines GetUrlCacheConfigInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<INTERNET_CACHE_CONFIG_INFOW>} lpCacheConfigInfo A pointer to an 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
 *        that receives information about the cache configuration. The <b>dwStructSize</b> field of 
 *        the structure should be initialized to the size of 
 *        <b>INTERNET_CACHE_CONFIG_INFO</b>.
 * @param {CACHE_CONFIG} dwFieldControl 
 * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get 
 *        extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-geturlcacheconfiginfow
 * @since windows5.1.2600
 */
export GetUrlCacheConfigInfoW(lpCacheConfigInfo, dwFieldControl) {
    static lpcbCacheConfigInfo := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("WININET.dll\GetUrlCacheConfigInfoW", INTERNET_CACHE_CONFIG_INFOW.Ptr, lpCacheConfigInfo, "uint*", lpcbCacheConfigInfo, CACHE_CONFIG, dwFieldControl, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Pointer<INTERNET_CACHE_CONFIG_INFOA>} lpCacheConfigInfo 
 * @param {Integer} dwFieldControl 
 * @returns {BOOL} 
 */
export SetUrlCacheConfigInfoA(lpCacheConfigInfo, dwFieldControl) {
    result := DllCall("WININET.dll\SetUrlCacheConfigInfoA", INTERNET_CACHE_CONFIG_INFOA.Ptr, lpCacheConfigInfo, "uint", dwFieldControl, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<INTERNET_CACHE_CONFIG_INFOW>} lpCacheConfigInfo 
 * @param {Integer} dwFieldControl 
 * @returns {BOOL} 
 */
export SetUrlCacheConfigInfoW(lpCacheConfigInfo, dwFieldControl) {
    result := DllCall("WININET.dll\SetUrlCacheConfigInfoW", INTERNET_CACHE_CONFIG_INFOW.Ptr, lpCacheConfigInfo, "uint", dwFieldControl, BOOL)
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {HINSTANCE} hinst 
 * @param {PSTR} lpszCmd 
 * @param {Integer} nCmdShow 
 * @returns {Integer} 
 */
export RunOnceUrlCache(_hwnd, hinst, lpszCmd, nCmdShow) {
    lpszCmd := lpszCmd is String ? StrPtr(lpszCmd) : lpszCmd

    result := DllCall("WININET.dll\RunOnceUrlCache", HWND, _hwnd, HINSTANCE, hinst, "ptr", lpszCmd, "int", nCmdShow, UInt32)
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {HINSTANCE} hinst 
 * @param {PSTR} lpszCmd 
 * @param {Integer} nCmdShow 
 * @returns {Integer} 
 */
export DeleteIE3Cache(_hwnd, hinst, lpszCmd, nCmdShow) {
    lpszCmd := lpszCmd is String ? StrPtr(lpszCmd) : lpszCmd

    result := DllCall("WININET.dll\DeleteIE3Cache", HWND, _hwnd, HINSTANCE, hinst, "ptr", lpszCmd, "int", nCmdShow, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} szNewPath 
 * @returns {BOOL} 
 */
export UpdateUrlCacheContentPath(szNewPath) {
    szNewPath := szNewPath is String ? StrPtr(szNewPath) : szNewPath

    result := DllCall("WININET.dll\UpdateUrlCacheContentPath", "ptr", szNewPath, BOOL)
    return result
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {Integer} uMsg 
 * @param {Integer} gid 
 * @param {Integer} dwOpsFilter 
 * @param {Integer} dwReserved 
 * @returns {BOOL} 
 */
export RegisterUrlCacheNotification(_hWnd, uMsg, gid, dwOpsFilter, dwReserved) {
    result := DllCall("WININET.dll\RegisterUrlCacheNotification", HWND, _hWnd, "uint", uMsg, "int64", gid, "uint", dwOpsFilter, "uint", dwReserved, BOOL)
    return result
}

/**
 * 
 * @param {Integer} nIdx 
 * @param {Pointer<Integer>} lpdwData 
 * @returns {BOOL} 
 */
export GetUrlCacheHeaderData(nIdx, lpdwData) {
    lpdwDataMarshal := lpdwData is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\GetUrlCacheHeaderData", "uint", nIdx, lpdwDataMarshal, lpdwData, BOOL)
    return result
}

/**
 * 
 * @param {Integer} nIdx 
 * @param {Integer} dwData 
 * @returns {BOOL} 
 */
export SetUrlCacheHeaderData(nIdx, dwData) {
    result := DllCall("WININET.dll\SetUrlCacheHeaderData", "uint", nIdx, "uint", dwData, BOOL)
    return result
}

/**
 * 
 * @param {Integer} nIdx 
 * @param {Pointer<Integer>} lpdwData 
 * @returns {BOOL} 
 */
export IncrementUrlCacheHeaderData(nIdx, lpdwData) {
    lpdwDataMarshal := lpdwData is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\IncrementUrlCacheHeaderData", "uint", nIdx, lpdwDataMarshal, lpdwData, BOOL)
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export LoadUrlCacheContent() {
    result := DllCall("WININET.dll\LoadUrlCacheContent", BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pwszUrl 
 * @param {Integer} dwFlags 
 * @param {Pointer<Pointer<Void>>} phAppCache 
 * @returns {Integer} 
 */
export AppCacheLookup(pwszUrl, dwFlags, phAppCache) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    phAppCacheMarshal := phAppCache is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\AppCacheLookup", "ptr", pwszUrl, "uint", dwFlags, phAppCacheMarshal, phAppCache, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszMasterUrl 
 * @param {PWSTR} pwszManifestUrl 
 * @param {Integer} pbManifestData 
 * @param {Integer} dwManifestDataSize 
 * @param {Integer} pbManifestResponseHeaders 
 * @param {Integer} dwManifestResponseHeadersSize 
 * @param {Pointer<APP_CACHE_STATE>} peState 
 * @param {Pointer<Pointer<Void>>} phNewAppCache 
 * @returns {Integer} 
 */
export AppCacheCheckManifest(pwszMasterUrl, pwszManifestUrl, pbManifestData, dwManifestDataSize, pbManifestResponseHeaders, dwManifestResponseHeadersSize, peState, phNewAppCache) {
    pwszMasterUrl := pwszMasterUrl is String ? StrPtr(pwszMasterUrl) : pwszMasterUrl
    pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

    peStateMarshal := peState is VarRef ? "int*" : "ptr"
    phNewAppCacheMarshal := phNewAppCache is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\AppCacheCheckManifest", "ptr", pwszMasterUrl, "ptr", pwszManifestUrl, "ptr", pbManifestData, "uint", dwManifestDataSize, "ptr", pbManifestResponseHeaders, "uint", dwManifestResponseHeadersSize, peStateMarshal, peState, phNewAppCacheMarshal, phNewAppCache, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {Pointer<APP_CACHE_DOWNLOAD_LIST>} pDownloadList 
 * @returns {Integer} 
 */
export AppCacheGetDownloadList(hAppCache, pDownloadList) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\AppCacheGetDownloadList", hAppCacheMarshal, hAppCache, APP_CACHE_DOWNLOAD_LIST.Ptr, pDownloadList, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<APP_CACHE_DOWNLOAD_LIST>} pDownloadList 
 * @returns {String} Nothing - always returns an empty string
 */
export AppCacheFreeDownloadList(pDownloadList) {
    DllCall("WININET.dll\AppCacheFreeDownloadList", APP_CACHE_DOWNLOAD_LIST.Ptr, pDownloadList)
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {Integer} pbManifestData 
 * @param {Integer} dwManifestDataSize 
 * @param {Pointer<APP_CACHE_FINALIZE_STATE>} peState 
 * @returns {Integer} 
 */
export AppCacheFinalize(hAppCache, pbManifestData, dwManifestDataSize, peState) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    peStateMarshal := peState is VarRef ? "int*" : "ptr"

    result := DllCall("WININET.dll\AppCacheFinalize", hAppCacheMarshal, hAppCache, "ptr", pbManifestData, "uint", dwManifestDataSize, peStateMarshal, peState, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pwszUrl 
 * @param {Pointer<PWSTR>} ppwszFallbackUrl 
 * @returns {Integer} 
 */
export AppCacheGetFallbackUrl(hAppCache, pwszUrl, ppwszFallbackUrl) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    ppwszFallbackUrlMarshal := ppwszFallbackUrl is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\AppCacheGetFallbackUrl", hAppCacheMarshal, hAppCache, "ptr", pwszUrl, ppwszFallbackUrlMarshal, ppwszFallbackUrl, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {Pointer<PWSTR>} ppwszManifestUrl 
 * @returns {Integer} 
 */
export AppCacheGetManifestUrl(hAppCache, ppwszManifestUrl) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    ppwszManifestUrlMarshal := ppwszManifestUrl is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\AppCacheGetManifestUrl", hAppCacheMarshal, hAppCache, ppwszManifestUrlMarshal, ppwszManifestUrl, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {Pointer<Pointer<Void>>} phDuplicatedAppCache 
 * @returns {Integer} 
 */
export AppCacheDuplicateHandle(hAppCache, phDuplicatedAppCache) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    phDuplicatedAppCacheMarshal := phDuplicatedAppCache is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\AppCacheDuplicateHandle", hAppCacheMarshal, hAppCache, phDuplicatedAppCacheMarshal, phDuplicatedAppCache, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @returns {String} Nothing - always returns an empty string
 */
export AppCacheCloseHandle(hAppCache) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    DllCall("WININET.dll\AppCacheCloseHandle", hAppCacheMarshal, hAppCache)
}

/**
 * 
 * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
 * @returns {String} Nothing - always returns an empty string
 */
export AppCacheFreeGroupList(pAppCacheGroupList) {
    DllCall("WININET.dll\AppCacheFreeGroupList", APP_CACHE_GROUP_LIST.Ptr, pAppCacheGroupList)
}

/**
 * 
 * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
 * @returns {Integer} 
 */
export AppCacheGetGroupList(pAppCacheGroupList) {
    result := DllCall("WININET.dll\AppCacheGetGroupList", APP_CACHE_GROUP_LIST.Ptr, pAppCacheGroupList, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {Pointer<APP_CACHE_GROUP_INFO>} pAppCacheInfo 
 * @returns {Integer} 
 */
export AppCacheGetInfo(hAppCache, pAppCacheInfo) {
    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\AppCacheGetInfo", hAppCacheMarshal, hAppCache, APP_CACHE_GROUP_INFO.Ptr, pAppCacheInfo, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszManifestUrl 
 * @returns {Integer} 
 */
export AppCacheDeleteGroup(pwszManifestUrl) {
    pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

    result := DllCall("WININET.dll\AppCacheDeleteGroup", "ptr", pwszManifestUrl, UInt32)
    return result
}

/**
 * 
 * @param {FILETIME} ftCutOff 
 * @returns {Integer} 
 */
export AppCacheFreeSpace(ftCutOff) {
    result := DllCall("WININET.dll\AppCacheFreeSpace", FILETIME, ftCutOff, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
 * @returns {Integer} 
 */
export AppCacheGetIEGroupList(pAppCacheGroupList) {
    result := DllCall("WININET.dll\AppCacheGetIEGroupList", APP_CACHE_GROUP_LIST.Ptr, pAppCacheGroupList, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszManifestUrl 
 * @returns {Integer} 
 */
export AppCacheDeleteIEGroup(pwszManifestUrl) {
    pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

    result := DllCall("WININET.dll\AppCacheDeleteIEGroup", "ptr", pwszManifestUrl, UInt32)
    return result
}

/**
 * 
 * @param {FILETIME} ftCutOff 
 * @returns {Integer} 
 */
export AppCacheFreeIESpace(ftCutOff) {
    result := DllCall("WININET.dll\AppCacheFreeIESpace", FILETIME, ftCutOff, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pwszSourceFilePath 
 * @param {PWSTR} pwszUrl 
 * @param {Integer} pbResponseHeaders 
 * @param {Integer} dwResponseHeadersSize 
 * @returns {Integer} 
 */
export AppCacheCreateAndCommitFile(hAppCache, pwszSourceFilePath, pwszUrl, pbResponseHeaders, dwResponseHeadersSize) {
    pwszSourceFilePath := pwszSourceFilePath is String ? StrPtr(pwszSourceFilePath) : pwszSourceFilePath
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\AppCacheCreateAndCommitFile", hAppCacheMarshal, hAppCache, "ptr", pwszSourceFilePath, "ptr", pwszUrl, "ptr", pbResponseHeaders, "uint", dwResponseHeadersSize, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hRequestHandle 
 * @param {BOOL} fBackground 
 * @param {Pointer<Pointer<Void>>} phDependencyHandle 
 * @returns {Integer} 
 */
export HttpOpenDependencyHandle(hRequestHandle, fBackground, phDependencyHandle) {
    hRequestHandleMarshal := hRequestHandle is VarRef ? "ptr" : "ptr"
    phDependencyHandleMarshal := phDependencyHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\HttpOpenDependencyHandle", hRequestHandleMarshal, hRequestHandle, BOOL, fBackground, phDependencyHandleMarshal, phDependencyHandle, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hDependencyHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export HttpCloseDependencyHandle(hDependencyHandle) {
    hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"

    DllCall("WININET.dll\HttpCloseDependencyHandle", hDependencyHandleMarshal, hDependencyHandle)
}

/**
 * 
 * @param {Pointer<Void>} hDependencyHandle 
 * @param {Pointer<Pointer<Void>>} phDuplicatedDependencyHandle 
 * @returns {Integer} 
 */
export HttpDuplicateDependencyHandle(hDependencyHandle, phDuplicatedDependencyHandle) {
    hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"
    phDuplicatedDependencyHandleMarshal := phDuplicatedDependencyHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\HttpDuplicateDependencyHandle", hDependencyHandleMarshal, hDependencyHandle, phDuplicatedDependencyHandleMarshal, phDuplicatedDependencyHandle, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hDependencyHandle 
 * @returns {Integer} 
 */
export HttpIndicatePageLoadComplete(hDependencyHandle) {
    hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpIndicatePageLoadComplete", hDependencyHandleMarshal, hDependencyHandle, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @returns {String} Nothing - always returns an empty string
 */
export UrlCacheFreeEntryInfo(pCacheEntryInfo) {
    DllCall("WININET.dll\UrlCacheFreeEntryInfo", URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo)
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pcwszUrl 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @returns {Integer} 
 */
export UrlCacheGetEntryInfo(hAppCache, pcwszUrl, pCacheEntryInfo) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\UrlCacheGetEntryInfo", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hEntryFile 
 * @returns {String} Nothing - always returns an empty string
 */
export UrlCacheCloseEntryHandle(hEntryFile) {
    hEntryFileMarshal := hEntryFile is VarRef ? "ptr" : "ptr"

    DllCall("WININET.dll\UrlCacheCloseEntryHandle", hEntryFileMarshal, hEntryFile)
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pcwszUrl 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @param {Pointer<Pointer<Void>>} phEntryFile 
 * @returns {Integer} 
 */
export UrlCacheRetrieveEntryFile(hAppCache, pcwszUrl, pCacheEntryInfo, phEntryFile) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    phEntryFileMarshal := phEntryFile is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheRetrieveEntryFile", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo, phEntryFileMarshal, phEntryFile, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hUrlCacheStream 
 * @param {Integer} ullLocation 
 * @param {Pointer<Void>} pBuffer 
 * @param {Integer} dwBufferLen 
 * @param {Pointer<Integer>} pdwBufferLen 
 * @returns {Integer} 
 */
export UrlCacheReadEntryStream(hUrlCacheStream, ullLocation, pBuffer, dwBufferLen, pdwBufferLen) {
    hUrlCacheStreamMarshal := hUrlCacheStream is VarRef ? "ptr" : "ptr"
    pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
    pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheReadEntryStream", hUrlCacheStreamMarshal, hUrlCacheStream, "uint", ullLocation, pBufferMarshal, pBuffer, "uint", dwBufferLen, pdwBufferLenMarshal, pdwBufferLen, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pcwszUrl 
 * @param {BOOL} fRandomRead 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @param {Pointer<Pointer<Void>>} phEntryStream 
 * @returns {Integer} 
 */
export UrlCacheRetrieveEntryStream(hAppCache, pcwszUrl, fRandomRead, pCacheEntryInfo, phEntryStream) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
    phEntryStreamMarshal := phEntryStream is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheRetrieveEntryStream", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, BOOL, fRandomRead, URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo, phEntryStreamMarshal, phEntryStream, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hAppCache 
 * @param {PWSTR} pcwszUrl 
 * @param {Integer} pbExtraData 
 * @param {Integer} cbExtraData 
 * @returns {Integer} 
 */
export UrlCacheUpdateEntryExtraData(hAppCache, pcwszUrl, pbExtraData, cbExtraData) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\UrlCacheUpdateEntryExtraData", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, "ptr", pbExtraData, "uint", cbExtraData, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszName 
 * @param {PWSTR} pwszPrefix 
 * @param {PWSTR} pwszDirectory 
 * @param {Integer} ullLimit 
 * @param {Integer} dwOptions 
 * @returns {Integer} 
 */
export UrlCacheCreateContainer(pwszName, pwszPrefix, pwszDirectory, ullLimit, dwOptions) {
    pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
    pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix
    pwszDirectory := pwszDirectory is String ? StrPtr(pwszDirectory) : pwszDirectory

    result := DllCall("WININET.dll\UrlCacheCreateContainer", "ptr", pwszName, "ptr", pwszPrefix, "ptr", pwszDirectory, "uint", ullLimit, "uint", dwOptions, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<PWSTR>} rgpwszUrls 
 * @param {Integer} cEntries 
 * @param {Pointer<BOOL>} rgfExist 
 * @returns {Integer} 
 */
export UrlCacheCheckEntriesExist(rgpwszUrls, cEntries, rgfExist) {
    rgpwszUrlsMarshal := rgpwszUrls is VarRef ? "ptr*" : "ptr"
    rgfExistMarshal := rgfExist is VarRef ? "int*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheCheckEntriesExist", rgpwszUrlsMarshal, rgpwszUrls, "uint", cEntries, rgfExistMarshal, rgfExist, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<PWSTR>>} pppwszDirectories 
 * @param {Pointer<Integer>} pcDirectories 
 * @returns {Integer} 
 */
export UrlCacheGetContentPaths(pppwszDirectories, pcDirectories) {
    pppwszDirectoriesMarshal := pppwszDirectories is VarRef ? "ptr*" : "ptr"
    pcDirectoriesMarshal := pcDirectories is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheGetContentPaths", pppwszDirectoriesMarshal, pppwszDirectories, pcDirectoriesMarshal, pcDirectories, UInt32)
    return result
}

/**
 * 
 * @param {URL_CACHE_LIMIT_TYPE} limitType 
 * @param {Pointer<Integer>} pullLimit 
 * @returns {Integer} 
 */
export UrlCacheGetGlobalLimit(limitType, pullLimit) {
    pullLimitMarshal := pullLimit is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\UrlCacheGetGlobalLimit", URL_CACHE_LIMIT_TYPE, limitType, pullLimitMarshal, pullLimit, UInt32)
    return result
}

/**
 * 
 * @param {URL_CACHE_LIMIT_TYPE} limitType 
 * @param {Integer} ullLimit 
 * @returns {Integer} 
 */
export UrlCacheSetGlobalLimit(limitType, ullLimit) {
    result := DllCall("WININET.dll\UrlCacheSetGlobalLimit", URL_CACHE_LIMIT_TYPE, limitType, "uint", ullLimit, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export UrlCacheReloadSettings() {
    result := DllCall("WININET.dll\UrlCacheReloadSettings", UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszPrefix 
 * @param {Integer} dwEntryMaxAge 
 * @returns {Integer} 
 */
export UrlCacheContainerSetEntryMaximumAge(pwszPrefix, dwEntryMaxAge) {
    pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix

    result := DllCall("WININET.dll\UrlCacheContainerSetEntryMaximumAge", "ptr", pwszPrefix, "uint", dwEntryMaxAge, UInt32)
    return result
}

/**
 * 
 * @param {PWSTR} pwszPrefix 
 * @param {Integer} dwFlags 
 * @param {Integer} dwFilter 
 * @param {Integer} GroupId 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @param {Pointer<HANDLE>} phFind 
 * @returns {Integer} 
 */
export UrlCacheFindFirstEntry(pwszPrefix, dwFlags, dwFilter, GroupId, pCacheEntryInfo, phFind) {
    pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix

    result := DllCall("WININET.dll\UrlCacheFindFirstEntry", "ptr", pwszPrefix, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo, HANDLE.Ptr, phFind, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} hFind 
 * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
 * @returns {Integer} 
 */
export UrlCacheFindNextEntry(hFind, pCacheEntryInfo) {
    result := DllCall("WININET.dll\UrlCacheFindNextEntry", HANDLE, hFind, URLCACHE_ENTRY_INFO.Ptr, pCacheEntryInfo, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export UrlCacheServer() {
    result := DllCall("WININET.dll\UrlCacheServer", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pcNetworks 
 * @param {Pointer<Pointer<PWSTR>>} pppwszNetworkGuids 
 * @param {Pointer<Pointer<BSTR>>} pppbstrNetworkNames 
 * @param {Pointer<Pointer<PWSTR>>} pppwszGWMacs 
 * @param {Pointer<Integer>} pcGatewayMacs 
 * @param {Pointer<Integer>} pdwFlags 
 * @returns {BOOL} 
 */
export ReadGuidsForConnectedNetworks(pcNetworks, pppwszNetworkGuids, pppbstrNetworkNames, pppwszGWMacs, pcGatewayMacs, pdwFlags) {
    pcNetworksMarshal := pcNetworks is VarRef ? "uint*" : "ptr"
    pppwszNetworkGuidsMarshal := pppwszNetworkGuids is VarRef ? "ptr*" : "ptr"
    pppbstrNetworkNamesMarshal := pppbstrNetworkNames is VarRef ? "ptr*" : "ptr"
    pppwszGWMacsMarshal := pppwszGWMacs is VarRef ? "ptr*" : "ptr"
    pcGatewayMacsMarshal := pcGatewayMacs is VarRef ? "uint*" : "ptr"
    pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\ReadGuidsForConnectedNetworks", pcNetworksMarshal, pcNetworks, pppwszNetworkGuidsMarshal, pppwszNetworkGuids, pppbstrNetworkNamesMarshal, pppbstrNetworkNames, pppwszGWMacsMarshal, pppwszGWMacs, pcGatewayMacsMarshal, pcGatewayMacs, pdwFlagsMarshal, pdwFlags, BOOL)
    return result
}

/**
 * 
 * @param {INTERNET_SCHEME} tScheme 
 * @param {PSTR} lpszHost 
 * @param {Integer} cchHost 
 * @returns {BOOL} 
 */
export IsHostInProxyBypassList(tScheme, lpszHost, cchHost) {
    lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost

    result := DllCall("WININET.dll\IsHostInProxyBypassList", INTERNET_SCHEME, tScheme, "ptr", lpszHost, "uint", cchHost, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<WININET_PROXY_INFO_LIST>} pProxyInfoList 
 * @returns {String} Nothing - always returns an empty string
 */
export InternetFreeProxyInfoList(pProxyInfoList) {
    DllCall("WININET.dll\InternetFreeProxyInfoList", WININET_PROXY_INFO_LIST.Ptr, pProxyInfoList)
}

/**
 * 
 * @param {Pointer<Void>} hInternet 
 * @param {PWSTR} pcwszUrl 
 * @param {Pointer<WININET_PROXY_INFO_LIST>} pProxyInfoList 
 * @returns {Integer} 
 */
export InternetGetProxyForUrl(hInternet, pcwszUrl, pProxyInfoList) {
    pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

    hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\InternetGetProxyForUrl", hInternetMarshal, hInternet, "ptr", pcwszUrl, WININET_PROXY_INFO_LIST.Ptr, pProxyInfoList, UInt32)
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export DoConnectoidsExist() {
    result := DllCall("WININET.dll\DoConnectoidsExist", BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pszPath 
 * @param {Pointer<Integer>} pdwClusterSize 
 * @param {Pointer<Integer>} pdlAvail 
 * @param {Pointer<Integer>} pdlTotal 
 * @returns {BOOL} 
 */
export GetDiskInfoA(pszPath, pdwClusterSize, pdlAvail, pdlTotal) {
    pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

    pdwClusterSizeMarshal := pdwClusterSize is VarRef ? "uint*" : "ptr"
    pdlAvailMarshal := pdlAvail is VarRef ? "uint*" : "ptr"
    pdlTotalMarshal := pdlTotal is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\GetDiskInfoA", "ptr", pszPath, pdwClusterSizeMarshal, pdwClusterSize, pdlAvailMarshal, pdlAvail, pdlTotalMarshal, pdlTotal, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pszUrlSearchPattern 
 * @param {Integer} dwFlags 
 * @param {Integer} dwFilter 
 * @param {Integer} GroupId 
 * @param {Pointer<CACHE_OPERATOR>} op 
 * @param {Pointer<Void>} pOperatorData 
 * @returns {BOOL} 
 */
export PerformOperationOverUrlCacheA(pszUrlSearchPattern, dwFlags, dwFilter, GroupId, op, pOperatorData) {
    static pReserved1 := 0, pdwReserved2 := 0, pReserved3 := 0 ;Reserved parameters must always be NULL

    pszUrlSearchPattern := pszUrlSearchPattern is String ? StrPtr(pszUrlSearchPattern) : pszUrlSearchPattern

    pOperatorDataMarshal := pOperatorData is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\PerformOperationOverUrlCacheA", "ptr", pszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", pReserved1, "uint*", pdwReserved2, "ptr", pReserved3, "ptr", op, pOperatorDataMarshal, pOperatorData, BOOL)
    return result
}

/**
 * 
 * @returns {BOOL} 
 */
export IsProfilesEnabled() {
    result := DllCall("WININET.dll\IsProfilesEnabled", BOOL)
    return result
}

/**
 * 
 * @param {PSTR} lpszUrl 
 * @param {PSTR} lpszCookieData 
 * @param {Pointer<Integer>} lpdwDataSize 
 * @returns {Integer} 
 */
export InternalInternetGetCookie(lpszUrl, lpszCookieData, lpdwDataSize) {
    lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
    lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

    lpdwDataSizeMarshal := lpdwDataSize is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\InternalInternetGetCookie", "ptr", lpszUrl, "ptr", lpszCookieData, lpdwDataSizeMarshal, lpdwDataSize, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} szFilename 
 * @returns {BOOL} 
 */
export ImportCookieFileA(szFilename) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

    result := DllCall("WININET.dll\ImportCookieFileA", "ptr", szFilename, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} szFilename 
 * @returns {BOOL} 
 */
export ImportCookieFileW(szFilename) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

    result := DllCall("WININET.dll\ImportCookieFileW", "ptr", szFilename, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} szFilename 
 * @param {BOOL} fAppend 
 * @returns {BOOL} 
 */
export ExportCookieFileA(szFilename, fAppend) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

    result := DllCall("WININET.dll\ExportCookieFileA", "ptr", szFilename, BOOL, fAppend, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} szFilename 
 * @param {BOOL} fAppend 
 * @returns {BOOL} 
 */
export ExportCookieFileW(szFilename, fAppend) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

    result := DllCall("WININET.dll\ExportCookieFileW", "ptr", szFilename, BOOL, fAppend, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pchDomain 
 * @param {PSTR} pchFullDomain 
 * @returns {BOOL} 
 */
export IsDomainLegalCookieDomainA(pchDomain, pchFullDomain) {
    pchDomain := pchDomain is String ? StrPtr(pchDomain) : pchDomain
    pchFullDomain := pchFullDomain is String ? StrPtr(pchFullDomain) : pchFullDomain

    result := DllCall("WININET.dll\IsDomainLegalCookieDomainA", "ptr", pchDomain, "ptr", pchFullDomain, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pchDomain 
 * @param {PWSTR} pchFullDomain 
 * @returns {BOOL} 
 */
export IsDomainLegalCookieDomainW(pchDomain, pchFullDomain) {
    pchDomain := pchDomain is String ? StrPtr(pchDomain) : pchDomain
    pchFullDomain := pchFullDomain is String ? StrPtr(pchFullDomain) : pchFullDomain

    result := DllCall("WININET.dll\IsDomainLegalCookieDomainW", "ptr", pchDomain, "ptr", pchFullDomain, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hRequest 
 * @param {Pointer} dwContext 
 * @returns {Pointer<Void>} 
 */
export HttpWebSocketCompleteUpgrade(hRequest, dwContext) {
    hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketCompleteUpgrade", hRequestMarshal, hRequest, "ptr", dwContext, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hWebSocket 
 * @param {HTTP_WEB_SOCKET_BUFFER_TYPE} BufferType 
 * @param {Integer} pvBuffer 
 * @param {Integer} dwBufferLength 
 * @returns {BOOL} 
 */
export HttpWebSocketSend(hWebSocket, BufferType, pvBuffer, dwBufferLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketSend", hWebSocketMarshal, hWebSocket, HTTP_WEB_SOCKET_BUFFER_TYPE, BufferType, "ptr", pvBuffer, "uint", dwBufferLength, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hWebSocket 
 * @param {Integer} pvBuffer 
 * @param {Integer} dwBufferLength 
 * @param {Pointer<Integer>} pdwBytesRead 
 * @param {Pointer<HTTP_WEB_SOCKET_BUFFER_TYPE>} pBufferType 
 * @returns {BOOL} 
 */
export HttpWebSocketReceive(hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, pBufferType) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
    pdwBytesReadMarshal := pdwBytesRead is VarRef ? "uint*" : "ptr"
    pBufferTypeMarshal := pBufferType is VarRef ? "int*" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketReceive", hWebSocketMarshal, hWebSocket, "ptr", pvBuffer, "uint", dwBufferLength, pdwBytesReadMarshal, pdwBytesRead, pBufferTypeMarshal, pBufferType, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hWebSocket 
 * @param {Integer} usStatus 
 * @param {Integer} pvReason 
 * @param {Integer} dwReasonLength 
 * @returns {BOOL} 
 */
export HttpWebSocketClose(hWebSocket, usStatus, pvReason, dwReasonLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketClose", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hWebSocket 
 * @param {Integer} usStatus 
 * @param {Integer} pvReason 
 * @param {Integer} dwReasonLength 
 * @returns {BOOL} 
 */
export HttpWebSocketShutdown(hWebSocket, usStatus, pvReason, dwReasonLength) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketShutdown", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hWebSocket 
 * @param {Pointer<Integer>} pusStatus 
 * @param {Integer} pvReason 
 * @param {Integer} dwReasonLength 
 * @param {Pointer<Integer>} pdwReasonLengthConsumed 
 * @returns {BOOL} 
 */
export HttpWebSocketQueryCloseStatus(hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed) {
    hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
    pusStatusMarshal := pusStatus is VarRef ? "ushort*" : "ptr"
    pdwReasonLengthConsumedMarshal := pdwReasonLengthConsumed is VarRef ? "uint*" : "ptr"

    result := DllCall("WININET.dll\HttpWebSocketQueryCloseStatus", hWebSocketMarshal, hWebSocket, pusStatusMarshal, pusStatus, "ptr", pvReason, "uint", dwReasonLength, pdwReasonLengthConsumedMarshal, pdwReasonLengthConsumed, BOOL)
    return result
}

/**
 * 
 * @param {PSTR} pcszUrl 
 * @param {Integer} cchUrl 
 * @param {PWSTR} pcwszBaseUrl 
 * @param {Integer} dwCodePageHost 
 * @param {Integer} dwCodePagePath 
 * @param {BOOL} fEncodePathExtra 
 * @param {Integer} dwCodePageExtra 
 * @param {Pointer<PWSTR>} ppwszConvertedUrl 
 * @returns {Integer} 
 */
export InternetConvertUrlFromWireToWideChar(pcszUrl, cchUrl, pcwszBaseUrl, dwCodePageHost, dwCodePagePath, fEncodePathExtra, dwCodePageExtra, ppwszConvertedUrl) {
    pcszUrl := pcszUrl is String ? StrPtr(pcszUrl) : pcszUrl
    pcwszBaseUrl := pcwszBaseUrl is String ? StrPtr(pcwszBaseUrl) : pcwszBaseUrl

    ppwszConvertedUrlMarshal := ppwszConvertedUrl is VarRef ? "ptr*" : "ptr"

    result := DllCall("WININET.dll\InternetConvertUrlFromWireToWideChar", "ptr", pcszUrl, "uint", cchUrl, "ptr", pcwszBaseUrl, "uint", dwCodePageHost, "uint", dwCodePagePath, BOOL, fEncodePathExtra, "uint", dwCodePageExtra, ppwszConvertedUrlMarshal, ppwszConvertedUrl, UInt32)
    return result
}

;@endregion Functions
