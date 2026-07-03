#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_STORE_PROV_FIND_INFO.ahk" { CERT_STORE_PROV_FIND_INFO }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_FIND_CRL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_FIND_CRL) {
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
     * @param {Pointer<CERT_STORE_PROV_FIND_INFO>} pFindInfo 
     * @param {Pointer<CRL_CONTEXT>} pPrevCrlContext 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Void>>} ppvStoreProvFindInfo 
     * @param {Pointer<Pointer<CRL_CONTEXT>>} ppProvCrlContext 
     * @returns {BOOL} 
     */
    Call(hStoreProv, pFindInfo, pPrevCrlContext, dwFlags, ppvStoreProvFindInfo, ppProvCrlContext) {
        ppvStoreProvFindInfoMarshal := ppvStoreProvFindInfo is VarRef ? "ptr*" : "ptr"
        ppProvCrlContextMarshal := ppProvCrlContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CERT_STORE_PROV_FIND_INFO.Ptr, pFindInfo, CRL_CONTEXT.Ptr, pPrevCrlContext, UInt32, dwFlags, ppvStoreProvFindInfoMarshal, ppvStoreProvFindInfo, ppProvCrlContextMarshal, ppProvCrlContext, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_FIND_CRL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_FIND_CRL {
        /**
         * Creates a PFN_CERT_STORE_PROV_FIND_CRL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO, CRL_CONTEXT, UInt32, "ptr*", "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO.Ptr, CRL_CONTEXT.Ptr, UInt32, "ptr*", "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
