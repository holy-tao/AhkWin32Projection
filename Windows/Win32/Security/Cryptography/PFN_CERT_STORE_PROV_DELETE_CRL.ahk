#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * An application-defined callback function that is called by CertDeleteCRLFromStore before deleting the CRL from the store.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_delete_crl
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_DELETE_CRL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_DELETE_CRL) {
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
     * @param {Pointer<CRL_CONTEXT>} pCrlContext A pointer to the CRL context to be deleted.
     * @param {Integer} dwFlags Reserved for future use and is set to zero.
     * @returns {BOOL} Returns <b>TRUE</b> if it is okay to delete from the store. Otherwise, returns <b>FALSE</b>.
     */
    Call(hStoreProv, pCrlContext, dwFlags) {
        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CRL_CONTEXT.Ptr, pCrlContext, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_DELETE_CRL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_DELETE_CRL {
        /**
         * Creates a PFN_CERT_STORE_PROV_DELETE_CRL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CRL_CONTEXT, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CRL_CONTEXT.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
