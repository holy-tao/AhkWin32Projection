#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_STORE_PROV_FIND_INFO.ahk" { CERT_STORE_PROV_FIND_INFO }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_FIND_CTL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_FIND_CTL) {
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
     * @param {Pointer<CTL_CONTEXT>} pPrevCtlContext 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Void>>} ppvStoreProvFindInfo 
     * @param {Pointer<Pointer<CTL_CONTEXT>>} ppProvCtlContext 
     * @returns {BOOL} 
     */
    Call(hStoreProv, pFindInfo, pPrevCtlContext, dwFlags, ppvStoreProvFindInfo, ppProvCtlContext) {
        ppvStoreProvFindInfoMarshal := ppvStoreProvFindInfo is VarRef ? "ptr*" : "ptr"
        ppProvCtlContextMarshal := ppProvCtlContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CERT_STORE_PROV_FIND_INFO.Ptr, pFindInfo, CTL_CONTEXT.Ptr, pPrevCtlContext, UInt32, dwFlags, ppvStoreProvFindInfoMarshal, ppvStoreProvFindInfo, ppProvCtlContextMarshal, ppProvCtlContext, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_FIND_CTL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_FIND_CTL {
        /**
         * Creates a PFN_CERT_STORE_PROV_FIND_CTL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO, CTL_CONTEXT, UInt32, "ptr*", "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CERT_STORE_PROV_FIND_INFO.Ptr, CTL_CONTEXT.Ptr, UInt32, "ptr*", "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
