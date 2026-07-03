#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * The CertStoreProvReadCTL callback function is called to read the provider's copy of the CTL context and, if it exists, to create a new CTL context.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_ctl
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_READ_CTL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_READ_CTL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv <b>HCERTSTOREPROV</b> handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a>.
     * @param {Pointer<CTL_CONTEXT>} pStoreCtlContext A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> structure.
     * @param {Integer} dwFlags Any needed flag values.
     * @param {Pointer<Pointer<CTL_CONTEXT>>} ppProvCtlContext A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> structure to be returned by the function. The context will be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreectlcontext">CertFreeCTLContext</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds or <b>FALSE</b> if it fails.
     */
    Call(hStoreProv, pStoreCtlContext, dwFlags, ppProvCtlContext) {
        ppProvCtlContextMarshal := ppProvCtlContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CTL_CONTEXT.Ptr, pStoreCtlContext, UInt32, dwFlags, ppProvCtlContextMarshal, ppProvCtlContext, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_READ_CTL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_READ_CTL {
        /**
         * Creates a PFN_CERT_STORE_PROV_READ_CTL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CTL_CONTEXT, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CTL_CONTEXT.Ptr, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
