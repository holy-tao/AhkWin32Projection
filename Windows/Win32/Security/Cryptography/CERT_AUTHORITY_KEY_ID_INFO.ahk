#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Identifies the key used to sign a certificate or certificate revocation list (CRL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_authority_key_id_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_AUTHORITY_KEY_ID_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a unique identifier of a public key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyId"))
                this.__KeyId := CRYPT_INTEGER_BLOB(0, this)
            return this.__KeyId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the encoded distinguished name of the certification authority that issued the certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    CertIssuer{
        get {
            if(!this.HasProp("__CertIssuer"))
                this.__CertIssuer := CRYPT_INTEGER_BLOB(16, this)
            return this.__CertIssuer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate associated with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> used to sign this certificate. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    CertSerialNumber{
        get {
            if(!this.HasProp("__CertSerialNumber"))
                this.__CertSerialNumber := CRYPT_INTEGER_BLOB(32, this)
            return this.__CertSerialNumber
        }
    }
}
