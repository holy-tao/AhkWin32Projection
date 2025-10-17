#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ALT_NAME_INFO.ahk

/**
 * The CERT_AUTHORITY_KEY_ID2_INFO structure identifies the key used to sign a certificate or CRL.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_authority_key_id2_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_AUTHORITY_KEY_ID2_INFO extends Win32Struct
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> that includes the encoded name of the CA that issued the certificate. The <b>cAltEntry</b> member of the structure may be set to zero if the name is not to be used to identify the CA.
     * @type {CERT_ALT_NAME_INFO}
     */
    AuthorityCertIssuer{
        get {
            if(!this.HasProp("__AuthorityCertIssuer"))
                this.__AuthorityCertIssuer := CERT_ALT_NAME_INFO(16, this)
            return this.__AuthorityCertIssuer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that includes the serial number of the certificate associated with the private key used to sign this certificate. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    AuthorityCertSerialNumber{
        get {
            if(!this.HasProp("__AuthorityCertSerialNumber"))
                this.__AuthorityCertSerialNumber := CRYPT_INTEGER_BLOB(32, this)
            return this.__AuthorityCertSerialNumber
        }
    }
}
