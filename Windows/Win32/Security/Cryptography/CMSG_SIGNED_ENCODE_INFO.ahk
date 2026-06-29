#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CMSG_SIGNER_ENCODE_INFO.ahk" { CMSG_SIGNER_ENCODE_INFO }

/**
 * Contains information to be passed to CryptMsgOpenToEncode if dwMsgType is CMSG_SIGNED.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_signed_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_SIGNED_ENCODE_INFO {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Number of elements in the <b>rgSigners</b> array.
     */
    cSigners : UInt32

    /**
     * Array of pointers to 
     * 			   <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info">CMSG_SIGNER_ENCODE_INFO</a> structures each holding signer information.
     */
    rgSigners : CMSG_SIGNER_ENCODE_INFO.Ptr

    /**
     * Number of elements in the <b>rgCertEncoded</b> array.
     */
    cCertEncoded : UInt32

    /**
     * Array of pointers to 
     *               <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> 
     * 				  structures, each containing an encoded certificate.
     */
    rgCertEncoded : CRYPT_INTEGER_BLOB.Ptr

    /**
     * Number of elements in the <b>rgCrlEncoded</b> array.
     */
    cCrlEncoded : UInt32

    /**
     * Array of pointers to 
     *                 <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRL_BLOB</a> structures, each containing an encoded CRL.
     */
    rgCrlEncoded : CRYPT_INTEGER_BLOB.Ptr

}
