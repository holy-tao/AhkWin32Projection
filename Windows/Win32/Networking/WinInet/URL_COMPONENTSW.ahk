#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INTERNET_SCHEME.ahk" { INTERNET_SCHEME }

/**
 * Contains the constituent parts of a URL. This structure is used with the InternetCrackUrl and InternetCreateUrl functions. (Unicode)
 * @remarks
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcrackurla">InternetCrackUrl</a>, if a pointer member and its corresponding length member are both zero, that component is not returned. If the pointer member is <b>NULL</b> but the length member is not zero, both the pointer and length members are returned. If both pointer and corresponding length members are nonzero, the pointer member points to a buffer where the component is copied. The component can be un-escaped, depending on the 
 * <i>dwFlags</i> parameter of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcrackurla">InternetCrackUrl</a>.
 * 
 * For 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetcreateurla">InternetCreateUrl</a>, the pointer members should be <b>NULL</b> if the component is not required. If the corresponding length member is zero, the pointer member is the address of a zero-terminated string. If the length member is not zero, it is the string length of the corresponding pointer member.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wininet.h header defines URL_COMPONENTS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-url_componentsw
 * @namespace Windows.Win32.Networking.WinInet
 * @charset Unicode
 */
export default struct URL_COMPONENTSW {
    #StructPack 8

    /**
     * Size of this structure, in bytes.
     */
    dwStructSize : UInt32

    /**
     * Pointer to a string that contains the scheme name.
     */
    lpszScheme : PWSTR

    /**
     * Size of the scheme name, in <b>TCHARs</b>.
     */
    dwSchemeLength : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ne-wininet-internet_scheme">INTERNET_SCHEME</a> value that indicates the Internet protocol scheme.
     */
    nScheme : INTERNET_SCHEME

    /**
     * Pointer to a string that contains the host name.
     */
    lpszHostName : PWSTR

    /**
     * Size of the host name, in <b>TCHARs</b>.
     */
    dwHostNameLength : UInt32

    /**
     * Converted port number.
     */
    nPort : UInt16

    /**
     * Pointer to a string value that contains the user name.
     */
    lpszUserName : PWSTR

    /**
     * Size of the user name, in <b>TCHARs</b>.
     */
    dwUserNameLength : UInt32

    /**
     * Pointer to a string that contains the password.
     */
    lpszPassword : PWSTR

    /**
     * Size of the password, in <b>TCHARs</b>.
     */
    dwPasswordLength : UInt32

    /**
     * Pointer to a string that contains the URL path.
     */
    lpszUrlPath : PWSTR

    /**
     * Size of the URL path, in <b>TCHARs</b>.
     */
    dwUrlPathLength : UInt32

    /**
     * Pointer to a string that contains the extra information (for example, ?something or #something).
     */
    lpszExtraInfo : PWSTR

    /**
     * Size of the extra information, in <b>TCHARs</b>.
     */
    dwExtraInfoLength : UInt32

}
