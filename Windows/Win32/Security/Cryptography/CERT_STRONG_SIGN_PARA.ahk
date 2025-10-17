#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters used to check for strong signatures on certificates, certificate revocation lists (CRLs), online certificate status protocol (OCSP) responses, and PKCS
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_strong_sign_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STRONG_SIGN_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwInfoChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CERT_STRONG_SIGN_SERIALIZED_INFO>}
     */
    pSerializedInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pszOID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
