#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\CERT_REVOCATION_STATUS_REASON.ahk

/**
 * Contains the reason a certificate was revoked.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_revoked_info
 * @namespace Windows.Win32.Security.Cryptography
 */
class OCSP_BASIC_REVOKED_INFO extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * Date that the certificate was revoked. For more information, see the <b>RevocationDate</b> member description for <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_entry">CRL_ENTRY</a>.
     * @type {FILETIME}
     */
    RevocationDate {
        get {
            if(!this.HasProp("__RevocationDate"))
                this.__RevocationDate := FILETIME(0, this)
            return this.__RevocationDate
        }
    }

    /**
     * @type {CERT_REVOCATION_STATUS_REASON}
     */
    dwCrlReasonCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
