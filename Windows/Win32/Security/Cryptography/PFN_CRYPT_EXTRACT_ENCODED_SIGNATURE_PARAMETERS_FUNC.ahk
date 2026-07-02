#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }

/**
 * Called to decode and return the hash algorithm identifier and optionally the signature parameters.
 * @remarks
 * Memory for the <i>ppvDecodedSignPara</i> and <i>ppwszCNGHashAlgid</i> parameters must be allocated by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function.
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC</td>
 * <td>"CryptDllExtractEncodedSignatureParameters"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_extract_encoded_signature_parameters_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC) {
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
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pSignatureAlgorithm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and its optional encoded parameters.
     * @param {Pointer<Pointer<Void>>} ppvDecodedSignPara A pointer to an address for the decoded and allocated signature parameters data structure. Returning the decoded buffer is optional.
     * @param {Pointer<PWSTR>} ppwszCNGHashAlgid A pointer to an address for the allocated Unicode string that represents the CNG hash algorithm identifier extracted from the encoded signature parameters. If this function returns <b>TRUE</b>, a non-<b>NULL</b> pointer must be returned.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * If the function fails, it returns zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If this callback function does not support the signature algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>ERROR_NOT_SUPPORTED</b>.
     */
    Call(dwCertEncodingType, pSignatureAlgorithm, ppvDecodedSignPara, ppwszCNGHashAlgid) {
        ppvDecodedSignParaMarshal := ppvDecodedSignPara is VarRef ? "ptr*" : "ptr"
        ppwszCNGHashAlgidMarshal := ppwszCNGHashAlgid is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, CRYPT_ALGORITHM_IDENTIFIER.Ptr, pSignatureAlgorithm, ppvDecodedSignParaMarshal, ppvDecodedSignPara, ppwszCNGHashAlgidMarshal, ppwszCNGHashAlgid, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC {
        /**
         * Creates a PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER, "ptr*", PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER.Ptr, "ptr*", PWSTR.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
