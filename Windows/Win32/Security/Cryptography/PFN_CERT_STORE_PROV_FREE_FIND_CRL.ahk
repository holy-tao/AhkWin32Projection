#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_FREE_FIND_CRL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_FREE_FIND_CRL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCERTSTOREPROV} hStoreProv 
     * @param {Pointer<CRL_CONTEXT>} pCrlContext 
     * @param {Pointer<Void>} pvStoreProvFindInfo 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    Call(hStoreProv, pCrlContext, pvStoreProvFindInfo, dwFlags) {
        pvStoreProvFindInfoMarshal := pvStoreProvFindInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CRL_CONTEXT.Ptr, pCrlContext, pvStoreProvFindInfoMarshal, pvStoreProvFindInfo, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_FREE_FIND_CRL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_FREE_FIND_CRL {
        /**
         * Creates a PFN_CERT_STORE_PROV_FREE_FIND_CRL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CRL_CONTEXT, "ptr", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CRL_CONTEXT.Ptr, "ptr", UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
