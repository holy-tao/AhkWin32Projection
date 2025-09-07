#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class WINHTTP_CERTIFICATE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate expires.
     * @type {FILETIME}
     */
    ftExpiry{
        get {
            if(!this.HasProp("__ftExpiry"))
                this.__ftExpiry := FILETIME(this.ptr + 0)
            return this.__ftExpiry
        }
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate becomes valid.
     * @type {FILETIME}
     */
    ftStart{
        get {
            if(!this.HasProp("__ftStart"))
                this.__ftStart := FILETIME(this.ptr + 8)
            return this.__ftStart
        }
    }

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server for which the certificate was issued.
     * @type {PWSTR}
     */
    lpszSubjectInfo{
        get {
            if(!this.HasProp("__lpszSubjectInfo"))
                this.__lpszSubjectInfo := PWSTR(this.ptr + 16)
            return this.__lpszSubjectInfo
        }
    }

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server that issued the certificate.
     * @type {PWSTR}
     */
    lpszIssuerInfo{
        get {
            if(!this.HasProp("__lpszIssuerInfo"))
                this.__lpszIssuerInfo := PWSTR(this.ptr + 24)
            return this.__lpszIssuerInfo
        }
    }

    /**
     * A pointer to a buffer that contains the name of the protocol used to provide the secure connection. This member is not current used.
     * @type {PWSTR}
     */
    lpszProtocolName{
        get {
            if(!this.HasProp("__lpszProtocolName"))
                this.__lpszProtocolName := PWSTR(this.ptr + 32)
            return this.__lpszProtocolName
        }
    }

    /**
     * A pointer to a buffer that contains the name of the algorithm used to sign the certificate. This member is not current used.
     * @type {PWSTR}
     */
    lpszSignatureAlgName{
        get {
            if(!this.HasProp("__lpszSignatureAlgName"))
                this.__lpszSignatureAlgName := PWSTR(this.ptr + 40)
            return this.__lpszSignatureAlgName
        }
    }

    /**
     * A pointer to a buffer that contains the name of the algorithm used to perform encryption over the secure channel (SSL/TLS) connection. This member is not current used.
     * @type {PWSTR}
     */
    lpszEncryptionAlgName{
        get {
            if(!this.HasProp("__lpszEncryptionAlgName"))
                this.__lpszEncryptionAlgName := PWSTR(this.ptr + 48)
            return this.__lpszEncryptionAlgName
        }
    }

    /**
     * The size, in bytes, of the key.
     * @type {Integer}
     */
    dwKeySize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
