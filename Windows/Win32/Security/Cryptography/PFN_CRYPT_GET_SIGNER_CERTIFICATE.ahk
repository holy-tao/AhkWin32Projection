#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CERT_INFO.ahk" { CERT_INFO }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * The CryptGetSignerCertificateCallback user supplied callback function is used with the CRYPT_VERIFY_MESSAGE_PARA structure to get and verify a message signer's certificate.
 * @remarks
 * If the message does not contain content or signers, the function is called with <i>pSignerId</i> set to <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_get_signer_certificate
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_GET_SIGNER_CERTIFICATE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_GET_SIGNER_CERTIFICATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvGetArg A pointer to user-defined data passed on to the verification function as specified in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_verify_message_para">CRYPT_VERIFY_MESSAGE_PARA</a> structure.
     * @param {CERT_QUERY_ENCODING_TYPE} dwCertEncodingType Specifies the type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @param {Pointer<CERT_INFO>} pSignerId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure containing the issuer and serial number. Can be <b>NULL</b> if there is no content or signer.
     * @param {HCERTSTORE} hMsgCertStore A handle to the certificate store containing all the certificates and CRLs in the signed message.
     * @returns {Pointer<CERT_CONTEXT>} If a signer certificate is found, the function returns a pointer to a read-only <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a>. The returned <b>CERT_CONTEXT</b> was obtained either from a certificate store or was created using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecertificatecontext">CertCreateCertificateContext</a>. In either case, it must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a>. If this function fails, the return value is <b>NULL</b>.
     */
    Call(pvGetArg, dwCertEncodingType, pSignerId, hMsgCertStore) {
        pvGetArgMarshal := pvGetArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvGetArgMarshal, pvGetArg, CERT_QUERY_ENCODING_TYPE, dwCertEncodingType, CERT_INFO.Ptr, pSignerId, HCERTSTORE, hMsgCertStore, CERT_CONTEXT.Ptr)
        return result
    }

    /**
     * A PFN_CRYPT_GET_SIGNER_CERTIFICATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_GET_SIGNER_CERTIFICATE {
        /**
         * Creates a PFN_CRYPT_GET_SIGNER_CERTIFICATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CERT_QUERY_ENCODING_TYPE, CERT_INFO, HCERTSTORE) => CERT_CONTEXT.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CERT_QUERY_ENCODING_TYPE, CERT_INFO.Ptr, HCERTSTORE, CERT_CONTEXT.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
