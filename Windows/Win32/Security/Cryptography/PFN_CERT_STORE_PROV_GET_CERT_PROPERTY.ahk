#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\HCERTSTOREPROV.ahk" { HCERTSTOREPROV }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_STORE_PROV_GET_CERT_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_STORE_PROV_GET_CERT_PROPERTY) {
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
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {Integer} dwPropId 
     * @param {Integer} dwFlags 
     * @param {Integer} pvData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {BOOL} 
     */
    Call(hStoreProv, pCertContext, dwPropId, dwFlags, pvData, pcbData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCERTSTOREPROV, hStoreProv, CERT_CONTEXT.Ptr, pCertContext, UInt32, dwPropId, UInt32, dwFlags, IntPtr, pvData, pcbDataMarshal, pcbData, BOOL)
        return result
    }

    /**
     * A PFN_CERT_STORE_PROV_GET_CERT_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_STORE_PROV_GET_CERT_PROPERTY {
        /**
         * Creates a PFN_CERT_STORE_PROV_GET_CERT_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(HCERTSTOREPROV, CERT_CONTEXT, UInt32, UInt32, IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCERTSTOREPROV, CERT_CONTEXT.Ptr, UInt32, UInt32, IntPtr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
