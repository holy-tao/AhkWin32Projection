#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_QUERY_RESULT.ahk" { DNS_QUERY_RESULT }
#Import ".\MDNS_QUERY_HANDLE.ahk" { MDNS_QUERY_HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct PMDNS_QUERY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMDNS_QUERY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pQueryContext 
     * @param {Pointer<MDNS_QUERY_HANDLE>} pQueryHandle 
     * @param {Pointer<DNS_QUERY_RESULT>} pQueryResults 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pQueryContext, pQueryHandle, pQueryResults) {
        pQueryContextMarshal := pQueryContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pQueryContextMarshal, pQueryContext, MDNS_QUERY_HANDLE.Ptr, pQueryHandle, DNS_QUERY_RESULT.Ptr, pQueryResults)
    }

    /**
     * A PMDNS_QUERY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMDNS_QUERY_CALLBACK {
        /**
         * Creates a PMDNS_QUERY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MDNS_QUERY_HANDLE, DNS_QUERY_RESULT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MDNS_QUERY_HANDLE.Ptr, DNS_QUERY_RESULT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
