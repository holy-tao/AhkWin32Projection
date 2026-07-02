#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }

/**
 * Called by CryptExportPublicKeyInfoEx to export a public key BLOB and encode it.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC</td>
 * <td>"CryptDllExportPublicKeyInfoEx2"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_export_public_key_info_ex2_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_KEY_HANDLE} hNCryptKey A handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) to use when exporting the public key information. This handle must be an <b>NCRYPT_KEY_HANDLE</b> handle that has been created by using the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptopenkey">NCryptOpenKey</a> function.
     * @param {CERT_QUERY_ENCODING_TYPE} dwCertEncodingType A value that specifies the encoding type used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @param {PSTR} pszPublicKeyObjId A pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key algorithm</a>.
     * @param {Integer} dwFlags A value that indicates how the public key information  is exported. This can be zero.
     * @param {Pointer<Void>} pvAuxInfo This parameter is reserved for future use and  must be set to <b>NULL</b>.
     * @param {Integer} pInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a>  structure to receive the public key information to be exported.
     * 
     * This parameter can be <b>NULL</b> to set the size of this information for memory allocation purposes. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/retrieving-data-of-unknown-length">Retrieving Data of Unknown Length</a>.
     * @param {Pointer<Integer>} pcbInfo A pointer to a <b>DWORD</b> that contains the size, in bytes, of the buffer pointed to by the <i>pInfo</i> parameter. When the function returns, the <b>DWORD</b> contains the number of bytes stored in the buffer.
     * 
     * <div class="alert"><b>Note</b>  When processing the data returned in the buffer, applications need to use the actual size of the data returned. The actual size can be slightly smaller than the size of the buffer specified on input. (On input, buffer sizes are usually specified large enough to ensure that the largest possible output data will fit in the buffer.) On output, the variable pointed to by this parameter is updated to reflect the actual size of the data copied to the buffer.</div>
     * <div> </div>
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If this callback function does not support the signature algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>ERROR_NOT_SUPPORTED</b>.
     */
    Call(hNCryptKey, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo) {
        pszPublicKeyObjId := pszPublicKeyObjId is String ? StrPtr(pszPublicKeyObjId) : pszPublicKeyObjId

        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"
        pcbInfoMarshal := pcbInfo is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, NCRYPT_KEY_HANDLE, hNCryptKey, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, "ptr", pszPublicKeyObjId, UInt32, dwFlags, pvAuxInfoMarshal, pvAuxInfo, IntPtr, pInfo, pcbInfoMarshal, pcbInfo, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC {
        /**
         * Creates a PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, UInt32, "ptr", IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_KEY_HANDLE, CERT_QUERY_ENCODING_TYPE, PSTR, UInt32, "ptr", IntPtr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
