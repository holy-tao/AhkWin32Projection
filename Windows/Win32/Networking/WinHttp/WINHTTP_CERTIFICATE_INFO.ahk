#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The WINHTTP_CERTIFICATE_INFO structure contains certificate information returned from the server. This structure is used by the WinHttpQueryOption function.
 * @remarks
 * The <b>WINHTTP_CERTIFICATE_INFO</b> structure contains information on the certificate returned by the server when the connection uses SSL/TLS. The <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> function returns the <b>WINHTTP_CERTIFICATE_INFO</b> structure when the <i>dwOption</i> parameter passed to the <b>WinHttpQueryOption</b> function is set to <b>WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> function does not set  the <b>lpszProtocolName</b>, <b>lpszSignatureAlgName</b>, and <b>lpszEncryptionAlgName</b> members of the <b>WINHTTP_CERTIFICATE_INFO</b> structure, so these member are always returned as <b>NULL</b>.
 * 
 * Once the application no longer needs the returned <b>WINHTTP_CERTIFICATE_INFO</b> structure, the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function should be called to free any pointers returned in the structure. The structure members containing pointers that are not NULL and need to be freed are <b>lpszSubjectInfo</b> and <b>lpszIssuerInfo</b>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Windows HTTP Services</a> start page.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_certificate_info
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_CERTIFICATE_INFO {
    #StructPack 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate expires.
     */
    ftExpiry : FILETIME

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate becomes valid.
     */
    ftStart : FILETIME

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server for which the certificate was issued.
     */
    lpszSubjectInfo : PWSTR

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server that issued the certificate.
     */
    lpszIssuerInfo : PWSTR

    /**
     * A pointer to a buffer that contains the name of the protocol used to provide the secure connection. This member is not current used.
     */
    lpszProtocolName : PWSTR

    /**
     * A pointer to a buffer that contains the name of the algorithm used to sign the certificate. This member is not current used.
     */
    lpszSignatureAlgName : PWSTR

    /**
     * A pointer to a buffer that contains the name of the algorithm used to perform encryption over the secure channel (SSL/TLS) connection. This member is not current used.
     */
    lpszEncryptionAlgName : PWSTR

    /**
     * The size, in bytes, of the key.
     */
    dwKeySize : UInt32

}
