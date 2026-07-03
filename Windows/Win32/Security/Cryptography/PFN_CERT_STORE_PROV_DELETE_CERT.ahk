#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that is called by CertDeleteCertificateFromStore before deleting a certificate from the store.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_delete_cert
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_DELETE_CERT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_DELETE_CERT) {
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
     * @param {Pointer<CERT_CONTEXT>} pCertContext A pointer to the certificate context to be deleted.
     * @param {Integer} dwFlags Reserved for future use and is set to zero.
     * @returns {BOOL} Returns <b>TRUE</b> if it is okay to delete the certificate from the store. Otherwise, returns <b>FALSE</b>.
     */
    Call(hStoreProv, pCertContext, dwFlags) {
        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CERT_CONTEXT.Ptr, pCertContext, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_DELETE_CERT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_DELETE_CERT {
        /**
         * Creates a PFN_CERT_STORE_PROV_DELETE_CERT pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CERT_CONTEXT, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CERT_CONTEXT.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
