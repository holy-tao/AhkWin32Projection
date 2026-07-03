#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that is called by CertCloseStore when the store's reference count is decremented to zero.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_close
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_CLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_CLOSE) {
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
     * @param {Integer} dwFlags Copy of the <i>dwFlags</i> passed as a parameter to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certclosestore">CertCloseStore</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hStoreProv, dwFlags) {
        DllCall(this.value, HCERTSTOREPROV, hStoreProv, UInt32, dwFlags)
    }

    /**
     * A PFN_CERT_STORE_PROV_CLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_CLOSE {
        /**
         * Creates a PFN_CERT_STORE_PROV_CLOSE pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
