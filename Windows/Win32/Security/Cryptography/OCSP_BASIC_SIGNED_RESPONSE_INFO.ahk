#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\OCSP_SIGNATURE_INFO.ahk

/**
 * Contains a basic online certificate status protocol (OCSP) response with a signature.
 * @remarks
 * In an OCSP responder service, this structure receives an encoded <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_info">OCSP_BASIC_RESPONSE_INFO</a> structure as its <b>ToBeSigned</b> member. The signature  of the <b>ToBeSigned</b>  member is stored in the <b>SignatureInfo</b> member. The encoded <b>OCSP_BASIC_SIGNED_RESPONSE_INFO</b> structure is stored in an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_response_info">OCSP_RESPONSE_INFO</a> structure.
 * 
 * On the receiving end, an OCSP client application must decode the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_response_info">OCSP_RESPONSE_INFO</a> <b>Value</b> member to obtain this structure and subsequently decode the <b>OCSP_BASIC_SIGNED_RESPONSE_INFO</b> <b>ToBeSigned</b> member to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_info">OCSP_BASIC_RESPONSE_INFO</a> structure.
 * 
 * OCSP applications can encode or decode this structure by using <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_signed_response_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_BASIC_SIGNED_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that has been encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) and that contains an encoded <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_info">OCSP_BASIC_RESPONSE_INFO</a> structure.
     * @type {CRYPT_INTEGER_BLOB}
     */
    ToBeSigned{
        get {
            if(!this.HasProp("__ToBeSigned"))
                this.__ToBeSigned := CRYPT_INTEGER_BLOB(0, this)
            return this.__ToBeSigned
        }
    }

    /**
     * A pointer to signature information for the <b>ToBeSigned</b> data.
     * @type {OCSP_SIGNATURE_INFO}
     */
    SignatureInfo{
        get {
            if(!this.HasProp("__SignatureInfo"))
                this.__SignatureInfo := OCSP_SIGNATURE_INFO(16, this)
            return this.__SignatureInfo
        }
    }
}
