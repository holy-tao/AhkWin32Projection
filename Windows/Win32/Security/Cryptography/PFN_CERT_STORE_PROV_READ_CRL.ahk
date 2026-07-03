#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that reads the provider's copy of the CRL context.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_crl
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_READ_CRL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_READ_CRL) {
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
     * @param {Pointer<CRL_CONTEXT>} pStoreCrlContext A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_context">CRL_CONTEXT</a> of the CRL to be read.
     * @param {Integer} dwFlags Reserved for future use and is set to zero.
     * @param {Pointer<Pointer<CRL_CONTEXT>>} ppProvCrlContext A pointer to a pointer to provider's copy of the CRL context. The context will be freed by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecrlcontext">CertFreeCRLContext</a>.
     * @returns {BOOL} Returns TRUE if the CRL was successfully read.
     */
    Call(hStoreProv, pStoreCrlContext, dwFlags, ppProvCrlContext) {
        ppProvCrlContextMarshal := ppProvCrlContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CRL_CONTEXT.Ptr, pStoreCrlContext, UInt32, dwFlags, ppProvCrlContextMarshal, ppProvCrlContext, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_READ_CRL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_READ_CRL {
        /**
         * Creates a PFN_CERT_STORE_PROV_READ_CRL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CRL_CONTEXT, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CRL_CONTEXT.Ptr, UInt32, "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
