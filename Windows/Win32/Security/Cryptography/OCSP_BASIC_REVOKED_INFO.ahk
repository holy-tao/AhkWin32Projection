#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains the reason a certificate was revoked.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ocsp_basic_revoked_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_BASIC_REVOKED_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Date that the certificate was revoked. For more information, see the <b>RevocationDate</b> member description for <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_entry">CRL_ENTRY</a>.
     * @type {FILETIME}
     */
    RevocationDate{
        get {
            if(!this.HasProp("__RevocationDate"))
                this.__RevocationDate := FILETIME(this.ptr + 0)
            return this.__RevocationDate
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwCrlReasonCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
