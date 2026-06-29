#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The CERT_PRIVATE_KEY_VALIDITY structure indicates a valid time span for the private key corresponding to a certificate's public key.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_private_key_validity
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_PRIVATE_KEY_VALIDITY {
    #StructPack 4

    /**
     * Date and time before which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded UTC-time in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized-time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotBefore</b> time is only precise to seconds.
     */
    NotBefore : FILETIME

    /**
     * Date and time after which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded UTC-time in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotAfter</b> time is only precise to seconds.
     */
    NotAfter : FILETIME

}
