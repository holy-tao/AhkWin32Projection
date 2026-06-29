#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains certificate information returned from the server. This structure is used by the InternetQueryOption function.
 * @remarks
 * Despite what the header indicates, the implementation of <b>INTERNET_CERTIFICATE_INFO</b> is not Unicode-aware.  All of the string members are filled as ANSI strings regardless of whether Unicode is enabled.  Consequently, when reading these values, the caller must cast them to LPSTR if Unicode is enabled.
 * 
 * Applications requesting this information must free pointers that are allocated and placed in the returned structure.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_certificate_info
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CERTIFICATE_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate expires.
     */
    ftExpiry : FILETIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate becomes valid.
     */
    ftStart : FILETIME

    /**
     * Pointer to a buffer that contains the name of the organization, site, and server for which the certificate was issued. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     */
    lpszSubjectInfo : IntPtr

    /**
     * Pointer to a buffer that contains the name of the organization, site, and server that issued the certificate. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     */
    lpszIssuerInfo : IntPtr

    /**
     * Pointer to a buffer that contains the name of the protocol used to provide the secure connection. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     */
    lpszProtocolName : IntPtr

    /**
     * Pointer to a buffer that contains the name of the algorithm used for signing the certificate. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     */
    lpszSignatureAlgName : IntPtr

    /**
     * Pointer to a buffer that contains the name of the algorithm used for doing encryption over the secure channel (SSL/PCT) connection. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     */
    lpszEncryptionAlgName : IntPtr

    /**
     * Size, in <b>TCHAR</b>s, of the key.
     */
    dwKeySize : UInt32

}
