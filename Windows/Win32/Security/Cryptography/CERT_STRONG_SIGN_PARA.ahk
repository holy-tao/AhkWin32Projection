#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_STRONG_SIGN_SERIALIZED_INFO.ahk" { CERT_STRONG_SIGN_SERIALIZED_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains parameters used to check for strong signatures on certificates, certificate revocation lists (CRLs), online certificate status protocol (OCSP) responses, and PKCS
 * @remarks
 * The parameters needed to check for a strong signature include the following:
 * 
 * <ul>
 * <li>Name of the public (asymmetric) algorithm</li>
 * <li>Size, in bits, of the public key</li>
 * <li>Name of the signature algorithm</li>
 * <li>Name of the hashing algorithm</li>
 * </ul>
 * The value you specify for the <b>dwInfoChoice</b> member   of this structure chooses whether the parameters are transmitted as serialized strings or are predefined by using an object identifier.
 * 
 * The <b>CERT_STRONG_SIGN_PARA</b> structure is directly referenced by the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certisstronghashtosign">CertIsStrongHashToSign</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgverifycountersignatureencodedex">CryptMsgVerifyCountersignatureEncodedEx</a>
 * </li>
 * </ul>
 * The <b>CERT_STRONG_SIGN_PARA</b> structure is also directly referenced by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_verify_message_para">CRYPT_VERIFY_MESSAGE_PARA</a> structure and is therefore available for use by the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecodemessage">CryptDecodeMessage</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecryptandverifymessagesignature">CryptDecryptAndVerifyMessageSignature</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifydetachedmessagesignature">CryptVerifyDetachedMessageSignature</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifymessagesignature">CryptVerifyMessageSignature</a>
 * </li>
 * </ul>
 * Finally, the <b>CERT_STRONG_SIGN_PARA</b> structure is directly referenced by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_para">CERT_CHAIN_PARA</a> structure and is therefore available for use by the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_strong_sign_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_STRONG_SIGN_PARA {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    dwInfoChoice : UInt32

    pvInfo : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pSerializedInfo', { type: CERT_STRONG_SIGN_SERIALIZED_INFO.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pszOID', { type: PSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
