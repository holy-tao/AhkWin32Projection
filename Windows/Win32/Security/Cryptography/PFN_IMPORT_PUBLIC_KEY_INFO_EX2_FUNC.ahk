#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }

/**
 * Called by CryptImportPublicKeyInfoEx2 to decode the public key algorithm identifier, load the algorithm provider, and import the key pair.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC</td>
 * <td>"CryptDllImportPublicKeyInfoEx2"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_import_public_key_info_ex2_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {CERT_QUERY_ENCODING_TYPE} dwCertEncodingType The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate encoding type</a> that was used to encrypt the subject. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding type</a> identifier, contained in the high <b>WORD</b> of this value, is ignored by this function.
     * 
     * 
     * This parameter can be the following currently defined certificate encoding type.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509_ASN_ENCODING"></a><a id="x509_asn_encoding"></a><dl>
     * <dt><b>X509_ASN_ENCODING</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> certificate encoding.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<CERT_PUBLIC_KEY_INFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> information to import into the provider.
     * @param {Integer} dwFlags A set of flags that modify the behavior of this function. This can be zero.
     * @param {Pointer<Void>} pvAuxInfo This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phKey A pointer to a <b>BCRYPT_KEY_HANDLE</b> variable that receives the handle of the imported key.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * If the function fails, it returns zero (<b>FALSE</b>). For extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(dwCertEncodingType, pInfo, dwFlags, pvAuxInfo, phKey) {
        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, CERT_PUBLIC_KEY_INFO.Ptr, pInfo, UInt32, dwFlags, pvAuxInfoMarshal, pvAuxInfo, BCRYPT_KEY_HANDLE.Ptr, phKey, BOOL)
        return result
    }

    /**
     * A PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC {
        /**
         * Creates a PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO, UInt32, "ptr", BCRYPT_KEY_HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_QUERY_ENCODING_TYPE, CERT_PUBLIC_KEY_INFO.Ptr, UInt32, "ptr", BCRYPT_KEY_HANDLE.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
