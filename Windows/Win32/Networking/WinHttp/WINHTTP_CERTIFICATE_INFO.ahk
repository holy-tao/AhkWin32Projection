#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The WINHTTP_CERTIFICATE_INFO structure contains certificate information returned from the server. This structure is used by the WinHttpQueryOption function.
 * @remarks
 * 
 * The <b>WINHTTP_CERTIFICATE_INFO</b> structure contains information on the certificate returned by the server when the connection uses SSL/TLS. The <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> function returns the <b>WINHTTP_CERTIFICATE_INFO</b> structure when the <i>dwOption</i> parameter passed to the <b>WinHttpQueryOption</b> function is set to <b>WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> function does not set  the <b>lpszProtocolName</b>, <b>lpszSignatureAlgName</b>, and <b>lpszEncryptionAlgName</b> members of the <b>WINHTTP_CERTIFICATE_INFO</b> structure, so these member are always returned as <b>NULL</b>.
 * 
 * Once the application no longer needs the returned <b>WINHTTP_CERTIFICATE_INFO</b> structure, the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function should be called to free any pointers returned in the structure. The structure members containing pointers that are not NULL and need to be freed are <b>lpszSubjectInfo</b> and <b>lpszIssuerInfo</b>.
 * 
 * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Windows HTTP Services</a> start page.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_certificate_info
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
                this.__ftExpiry := FILETIME(0, this)
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
                this.__ftStart := FILETIME(8, this)
            return this.__ftStart
        }
    }

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server for which the certificate was issued.
     * @type {PWSTR}
     */
    lpszSubjectInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a buffer that contains the name of the organization, site, and server that issued the certificate.
     * @type {PWSTR}
     */
    lpszIssuerInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a buffer that contains the name of the protocol used to provide the secure connection. This member is not current used.
     * @type {PWSTR}
     */
    lpszProtocolName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a buffer that contains the name of the algorithm used to sign the certificate. This member is not current used.
     * @type {PWSTR}
     */
    lpszSignatureAlgName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a buffer that contains the name of the algorithm used to perform encryption over the secure channel (SSL/TLS) connection. This member is not current used.
     * @type {PWSTR}
     */
    lpszEncryptionAlgName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
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
