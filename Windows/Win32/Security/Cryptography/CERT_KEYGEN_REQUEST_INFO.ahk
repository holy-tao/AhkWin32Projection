#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_PUBLIC_KEY_INFO.ahk

/**
 * Contains information stored in the Netscape key generation request. The subject and subject public key BLOBs are encoded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_keygen_request_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_KEYGEN_REQUEST_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The version number of the certificate. <b>CERT_KEYGEN_REQUEST_V1</b> (0) is the only defined version number.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a>.
     * @type {CERT_PUBLIC_KEY_INFO}
     */
    SubjectPublicKeyInfo{
        get {
            if(!this.HasProp("__SubjectPublicKeyInfo"))
                this.__SubjectPublicKeyInfo := CERT_PUBLIC_KEY_INFO(this.ptr + 8)
            return this.__SubjectPublicKeyInfo
        }
    }

    /**
     * A random printable string. This string is used by the server to ensure that the key that it is certifying matches the client on the page.
     * @type {Pointer<Ptr>}
     */
    pwszChallengeString {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
