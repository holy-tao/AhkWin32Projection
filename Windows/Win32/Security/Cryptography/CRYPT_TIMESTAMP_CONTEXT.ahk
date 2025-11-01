#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains both the encoded and decoded representations of a time stamp token.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_timestamp_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbEncoded</b> member.
     * @type {Integer}
     */
    cbEncoded {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer that contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoded content information sequence. This value should be stored for future time stamp validations on the signature. Applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> function  with the <b>CERT_STORE_PROV_PKCS7</b> flag to find additional certificates or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) related to the TSA time stamp signature.
     * @type {Pointer<Integer>}
     */
    pbEncoded {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_info">CRYPT_TIMESTAMP_INFO</a> structure that contains a signed data content type in Cryptographic Message Syntax (CMS) format.
     * @type {Pointer<CRYPT_TIMESTAMP_INFO>}
     */
    pTimeStamp {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
