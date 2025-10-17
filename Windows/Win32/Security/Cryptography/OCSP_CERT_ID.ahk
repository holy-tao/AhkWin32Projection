#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains information to identify a certificate in an online certificate status protocol (OCSP) request or response.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ocsp_cert_id
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_CERT_ID extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to create <i>IssuerNameHash</i> and <i>IssuerKeyHash</i>.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> that contains a hash of the certificate issuer subject name.
     * @type {CRYPT_INTEGER_BLOB}
     */
    IssuerNameHash{
        get {
            if(!this.HasProp("__IssuerNameHash"))
                this.__IssuerNameHash := CRYPT_INTEGER_BLOB(24, this)
            return this.__IssuerNameHash
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> that contains a hash of the certificate issuer public key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    IssuerKeyHash{
        get {
            if(!this.HasProp("__IssuerKeyHash"))
                this.__IssuerKeyHash := CRYPT_INTEGER_BLOB(40, this)
            return this.__IssuerKeyHash
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of the certificate. For more information, see the <b>SerialNumber</b> member description for <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(56, this)
            return this.__SerialNumber
        }
    }
}
