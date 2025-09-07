#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the signature algorithm/hash algorithm and public key algorithm/bit length pairs that can be used for strong signing.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure which is directly referenced by the following functions:
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
  * Also, <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> is indirectly referenced by the following:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecodemessage">CryptDecodeMessage</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecryptandverifymessagesignature">CryptDecryptAndVerifyMessageSignature</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifydetachedmessagesignature">CryptVerifyDetachedMessageSignature</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifymessagesignature">CryptVerifyMessageSignature</a>
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_strong_sign_serialized_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STRONG_SIGN_SERIALIZED_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains a set of <i>signature algorithm</i>/<i>hash algorithm</i> pairs. A Unicode semicolon (L";") separates the pairs. This is shown by the following example.
     * 
     * <c>L"RSA/SHA256;RSA/SHA384;ECDSA/SHA256;ECDSA/SHA384"</c>
     * 
     * The following signature algorithms are supported:<ul>
     * <li>L"RSA" (BCRYPT_RSA_ALGORITHM)</li>
     * <li>L"DSA" (BCRYPT_DSA_ALGORITHM)</li>
     * <li>L"ECDSA" (SSL_ECDSA_ALGORITHM)</li>
     * </ul>
     * 
     * 
     * The following signature algorithms are not supported:<ul>
     * <li>L"ECDSA_P256" (BCRYPT_ECDSA_P256_ALGORITHM)</li>
     * <li>L"ECDSA_P384" (BCRYPT_ECDSA_P384_ALGORITHM)</li>
     * <li>L"ECDSA_P521" (BCRYPT_ECDSA_P521_ALGORITHM)</li>
     * </ul>
     * 
     * 
     * The following hash algorithms are supported:<ul>
     * <li>L"MD5" (BCRYPT_MD5_ALGORITHM)</li>
     * <li>L"SHA1" (BCRYPT_SHA1_ALGORITHM)</li>
     * <li>L"SHA256" (BCRYPT_SHA256_ALGORITHM)</li>
     * <li>L"SHA256" (BCRYPT_SHA256_ALGORITHM)</li>
     * <li>L"SHA512" (BCRYPT_SHA512_ALGORITHM)</li>
     * </ul>
     * @type {PWSTR}
     */
    pwszCNGSignHashAlgids{
        get {
            if(!this.HasProp("__pwszCNGSignHashAlgids"))
                this.__pwszCNGSignHashAlgids := PWSTR(this.ptr + 8)
            return this.__pwszCNGSignHashAlgids
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains a set of <i>public key algorithm</i>/<i>bit length</i> pairs. A Unicode semicolon (L";") separates the pairs. This is shown by the following example.
     * 
     * <c>L”RSA/2048;ECDSA/256”</c>
     * 
     * The following public key algorithms are supported:<ul>
     * <li>L"RSA" (BCRYPT_RSA_ALGORITHM)</li>
     * <li>L"DSA" (BCRYPT_DSA_ALGORITHM)</li>
     * <li>L"ECDSA" (SSL_ECDSA_ALGORITHM)</li>
     * </ul>
     * @type {PWSTR}
     */
    pwszCNGPubKeyMinBitLengths{
        get {
            if(!this.HasProp("__pwszCNGPubKeyMinBitLengths"))
                this.__pwszCNGPubKeyMinBitLengths := PWSTR(this.ptr + 16)
            return this.__pwszCNGPubKeyMinBitLengths
        }
    }
}
