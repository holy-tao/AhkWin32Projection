#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * The CERT_SIGNED_CONTENT_INFO structure contains encoded content to be signed and a BLOB to hold the signature. The ToBeSigned member is an encoded CERT_INFO, CRL_INFO, CTL_INFO or CERT_REQUEST_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_signed_content_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SIGNED_CONTENT_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A BLOB that has been encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) and that is to be signed.
     * @type {CRYPT_INTEGER_BLOB}
     */
    ToBeSigned{
        get {
            if(!this.HasProp("__ToBeSigned"))
                this.__ToBeSigned := CRYPT_INTEGER_BLOB(this.ptr + 0)
            return this.__ToBeSigned
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature algorithm type and any associated additional parameters.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SignatureAlgorithm{
        get {
            if(!this.HasProp("__SignatureAlgorithm"))
                this.__SignatureAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 16)
            return this.__SignatureAlgorithm
        }
    }

    /**
     * BLOB containing a signed <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the encoded data.
     * @type {CRYPT_BIT_BLOB}
     */
    Signature{
        get {
            if(!this.HasProp("__Signature"))
                this.__Signature := CRYPT_BIT_BLOB(this.ptr + 40)
            return this.__Signature
        }
    }
}
