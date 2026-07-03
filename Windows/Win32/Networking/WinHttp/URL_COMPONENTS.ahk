#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINHTTP_INTERNET_SCHEME.ahk" { WINHTTP_INTERNET_SCHEME }

/**
 * The URL_COMPONENTS structure contains the constituent parts of a URL. This structure is used with the WinHttpCrackUrl and WinHttpCreateUrl functions.
 * @remarks
 * For the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcrackurl">WinHttpCrackUrl</a> function, if a pointer member and its corresponding length member are both zero, that component of the URL is not returned. If the pointer member is <b>NULL</b> but the length member is not zero, both the pointer and length members are returned. If both pointer and corresponding length members are nonzero, the pointer member points to a buffer where the component is copied. All escape sequences can be removed from a component, depending on the 
 * <i>dwFlags</i> parameter of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcrackurl">WinHttpCrackUrl</a>.
 * 
 * For the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateurl">WinHttpCreateUrl</a> function, the pointer members should be <b>NULL</b> if the component of the URL is not required. If the corresponding length member is zero, the pointer member is the pointer to a zero-terminated string. If the length member is not zero, it is the string length of the corresponding pointer member.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components
 * @namespace Windows.Win32.Networking.WinHttp
 * @charset ANSI
 */
export default struct URL_COMPONENTS {
    #StructPack 8

    /**
     * Size of this structure, in bytes. Used for version checking. The size of this structure must be set to initialize this structure properly.
     */
    dwStructSize : UInt32

    /**
     * Pointer to a string value that contains the scheme name.
     */
    lpszScheme : PWSTR

    /**
     * Length of the scheme name, in characters.
     */
    dwSchemeLength : UInt32

    nScheme : WINHTTP_INTERNET_SCHEME

    /**
     * Pointer to a string value that contains the host name.
     */
    lpszHostName : PWSTR

    /**
     * Length of the host name, in characters.
     */
    dwHostNameLength : UInt32

    /**
     * Port number.
     */
    nPort : UInt16

    /**
     * Pointer to a string  that contains the user name.
     */
    lpszUserName : PWSTR

    /**
     * Length of the user name, in characters.
     */
    dwUserNameLength : UInt32

    /**
     * Pointer to a string  that contains the password.
     */
    lpszPassword : PWSTR

    /**
     * Length of the password, in characters.
     */
    dwPasswordLength : UInt32

    /**
     * Pointer to a string  that contains the URL path.
     */
    lpszUrlPath : PWSTR

    /**
     * Length of the URL path, in characters.
     */
    dwUrlPathLength : UInt32

    /**
     * Pointer to a string value that contains the extra information, for example, ?something or #something.
     */
    lpszExtraInfo : PWSTR

    /**
     * Unsigned long integer value that contains the length of the extra information, in characters.
     */
    dwExtraInfoLength : UInt32

}
