#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_DELETE_CTL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_DELETE_CTL) {
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
     * @param {Pointer<CTL_CONTEXT>} pCtlContext 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    Call(hStoreProv, pCtlContext, dwFlags) {
        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CTL_CONTEXT.Ptr, pCtlContext, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_DELETE_CTL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_DELETE_CTL {
        /**
         * Creates a PFN_CERT_STORE_PROV_DELETE_CTL pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CTL_CONTEXT, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CTL_CONTEXT.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
