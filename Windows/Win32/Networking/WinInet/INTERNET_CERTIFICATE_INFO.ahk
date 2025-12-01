#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

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
 * @version v4.0.30319
 */
class INTERNET_CERTIFICATE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate expires.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the date the certificate becomes valid.
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
     * Pointer to a buffer that contains the name of the organization, site, and server for which the certificate was issued. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     * @type {Pointer<Integer>}
     */
    lpszSubjectInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a buffer that contains the name of the organization, site, and server that issued the certificate. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     * @type {Pointer<Integer>}
     */
    lpszIssuerInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a buffer that contains the name of the protocol used to provide the secure connection. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     * @type {Pointer<Integer>}
     */
    lpszProtocolName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a buffer that contains the name of the algorithm used for signing the certificate. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     * @type {Pointer<Integer>}
     */
    lpszSignatureAlgName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a buffer that contains the name of the algorithm used for doing encryption over the secure channel (SSL/PCT) connection. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to release the resources allocated for this parameter.
     * @type {Pointer<Integer>}
     */
    lpszEncryptionAlgName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Size, in <b>TCHAR</b>s, of the key.
     * @type {Integer}
     */
    dwKeySize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
