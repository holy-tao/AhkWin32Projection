#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information about a single revoked certificate. It is a member of a CRL_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">revoked certificate</a>. 
     * 
     * 
     * 
     * 
     * Leading 0x00 or 0xFF bytes are removed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcompareintegerblob">CertCompareIntegerBlob</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(0, this)
            return this.__SerialNumber
        }
    }

    /**
     * Date that the certificate was revoked. Time is UTC-time encoded as an eight-byte date/time precise to seconds with a two digit year (that is, YYMMDDHHMMSS plus 2 bytes). The date is interpreted as a date between the years 1968 and 2067.
     * @type {FILETIME}
     */
    RevocationDate{
        get {
            if(!this.HasProp("__RevocationDate"))
                this.__RevocationDate := FILETIME(16, this)
            return this.__RevocationDate
        }
    }

    /**
     * Number of elements in the <b>rgExtension</b> member array of extensions.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each providing information about the revoked certificate.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
