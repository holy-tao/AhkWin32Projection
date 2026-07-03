#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * Called to decrypt an encoded signature and compare it to a computed hash.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_VERIFY_ENCODED_SIGNATURE_FUNC</td>
 * <td>"CryptDllVerifyEncodedSignature"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_verify_encoded_signature_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {CERT_QUERY_ENCODING_TYPE} dwCertEncodingType Specifies the type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pPubKeyInfo The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> to use to verify the signature. You can use this with <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptimportpublickeyinfoex2">CryptImportPublicKeyInfoEx2</a> to get a <b>BCRYPT_KEY_HANDLE</b>.
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pSignatureAlgorithm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and its optional encoded parameters.
     * @param {Pointer<Void>} pvDecodedSignPara An optional pointer to the decoded signature parameters data structure previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_extract_encoded_signature_parameters_func">PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC</a>  function.
     * @param {PWSTR} pwszCNGPubKeyAlgid A Unicode string that contains the Cryptography API: Next Generation (CNG) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a> identifier that corresponds to <i>pSignatureAlgorithm</i>-&gt;<b>pszObjId</b>.
     * @param {PWSTR} pwszCNGHashAlgid A Unicode string that contains the CNG <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a> identifier that corresponds to <i>pSignatureAlgorithm</i>-&gt;<b>pszObjId</b> or to a hash algorithm identifier in <i>pvDecodedSignPara</i>.
     * @param {Integer} pbComputedHash A pointer to the computed hash bytes returned by the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptfinishhash">BCryptFinishHash</a> function that corresponds to <i>pwszCNGHashAlgid</i>.
     * @param {Integer} cbComputedHash A value that represents the length, in bytes, of the computed hash.
     * @param {Integer} pbSignature A pointer to the encoded signature bytes.
     * @param {Integer} cbSignature A value that represents the length, in bytes, of the encoded signature.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * If the function fails, it returns zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If this callback function does not support the signature algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>ERROR_NOT_SUPPORTED</b>.
     */
    Call(dwCertEncodingType, pPubKeyInfo, pSignatureAlgorithm, pvDecodedSignPara, pwszCNGPubKeyAlgid, pwszCNGHashAlgid, pbComputedHash, cbComputedHash, pbSignature, cbSignature) {
        pwszCNGPubKeyAlgid := pwszCNGPubKeyAlgid is String ? StrPtr(pwszCNGPubKeyAlgid) : pwszCNGPubKeyAlgid
        pwszCNGHashAlgid := pwszCNGHashAlgid is String ? StrPtr(pwszCNGHashAlgid) : pwszCNGHashAlgid

        pvDecodedSignParaMarshal := pvDecodedSignPara is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, CERT_PUBLIC_KEY_INFO.Ptr, pPubKeyInfo, CRYPT_ALGORITHM_IDENTIFIER.Ptr, pSignatureAlgorithm, pvDecodedSignParaMarshal, pvDecodedSignPara, "ptr", pwszCNGPubKeyAlgid, "ptr", pwszCNGHashAlgid, IntPtr, pbComputedHash, UInt32, cbComputedHash, IntPtr, pbSignature, UInt32, cbSignature, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC {
        /**
         * Creates a PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO, CRYPT_ALGORITHM_IDENTIFIER, "ptr", PWSTR, PWSTR, IntPtr, UInt32, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO.Ptr, CRYPT_ALGORITHM_IDENTIFIER.Ptr, "ptr", PWSTR, PWSTR, IntPtr, UInt32, IntPtr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
