#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Contains a signature for an online certificate status protocol (OCSP) request or response.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ocsp_signature_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_SIGNATURE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to create the <b>Signature</b>.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SignatureAlgorithm{
        get {
            if(!this.HasProp("__SignatureAlgorithm"))
                this.__SignatureAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__SignatureAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains a signed hash of an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_info">OCSP_REQUEST_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_info">OCSP_BASIC_RESPONSE_INFO</a> structure.
     * @type {CRYPT_BIT_BLOB}
     */
    Signature{
        get {
            if(!this.HasProp("__Signature"))
                this.__Signature := CRYPT_BIT_BLOB(24, this)
            return this.__Signature
        }
    }

    /**
     * The number of elements in the <b>rgCertEncoded</b> array.
     * @type {Integer}
     */
    cCertEncoded {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structures, each of which contains an encoded signature certificate.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgCertEncoded {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
