#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Acts as a unique identifier of a certificate containing the issuer and issuer's serial number for a certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_issuer_serial_number
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ISSUER_SERIAL_NUMBER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> structure that contains the name of the issuer.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Issuer{
        get {
            if(!this.HasProp("__Issuer"))
                this.__Issuer := CRYPT_INTEGER_BLOB(this.ptr + 0)
            return this.__Issuer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate. The combination of the issuer name and the serial number is a unique identifier of a certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__SerialNumber
        }
    }
}
