#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The CERT_PRIVATE_KEY_VALIDITY structure indicates a valid time span for the private key corresponding to a certificate's public key.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_private_key_validity
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_PRIVATE_KEY_VALIDITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Date and time before which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded UTC-time in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized-time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotBefore</b> time is only precise to seconds.
     * @type {FILETIME}
     */
    NotBefore{
        get {
            if(!this.HasProp("__NotBefore"))
                this.__NotBefore := FILETIME(this.ptr + 0)
            return this.__NotBefore
        }
    }

    /**
     * Date and time after which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded UTC-time in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotAfter</b> time is only precise to seconds.
     * @type {FILETIME}
     */
    NotAfter{
        get {
            if(!this.HasProp("__NotAfter"))
                this.__NotAfter := FILETIME(this.ptr + 8)
            return this.__NotAfter
        }
    }
}
