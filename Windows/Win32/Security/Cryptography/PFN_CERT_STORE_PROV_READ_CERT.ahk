#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that reads the provider's copy of the certificate context.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_cert
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_READ_CERT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_READ_CERT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv Provider-specific value returned in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_store_prov_info">CERT_STORE_PROV_INFO</a> by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_dll_open_store_prov_func">CertDllOpenStoreProv</a>.
     * @param {Pointer<CERT_CONTEXT>} pStoreCertContext A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> of the certificate to be read.
     * @param {Integer} dwFlags Reserved for future use and is set to zero.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppProvCertContext A pointer to a pointer to provider's copy of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate context</a>. The context will be freed by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the certificate was successfully read.
     */
    Call(hStoreProv, pStoreCertContext, dwFlags, ppProvCertContext) {
        ppProvCertContextMarshal := ppProvCertContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CERT_CONTEXT.Ptr, pStoreCertContext, UInt32, dwFlags, ppProvCertContextMarshal, ppProvCertContext, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_READ_CERT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_READ_CERT {
        /**
         * Creates a PFN_CERT_STORE_PROV_READ_CERT pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CERT_CONTEXT, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CERT_CONTEXT.Ptr, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
