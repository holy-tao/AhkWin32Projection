#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_TIMESTAMP_INFO.ahk" { CRYPT_TIMESTAMP_INFO }

/**
 * Contains both the encoded and decoded representations of a time stamp token.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_CONTEXT {
    #StructPack 8

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbEncoded</b> member.
     */
    cbEncoded : UInt32

    /**
     * A pointer to a buffer that contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoded content information sequence. This value should be stored for future time stamp validations on the signature. Applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> function  with the <b>CERT_STORE_PROV_PKCS7</b> flag to find additional certificates or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) related to the TSA time stamp signature.
     */
    pbEncoded : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_timestamp_info">CRYPT_TIMESTAMP_INFO</a> structure that contains a signed data content type in Cryptographic Message Syntax (CMS) format.
     */
    pTimeStamp : CRYPT_TIMESTAMP_INFO.Ptr

}
