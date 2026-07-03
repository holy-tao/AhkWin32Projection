#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_QUERY_RAW_RESULT.ahk" { DNS_QUERY_RAW_RESULT }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_RAW_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is DNS_QUERY_RAW_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _queryContext 
     * @param {Pointer<DNS_QUERY_RAW_RESULT>} queryResults 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_queryContext, queryResults) {
        _queryContextMarshal := _queryContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _queryContextMarshal, _queryContext, DNS_QUERY_RAW_RESULT.Ptr, queryResults)
    }

    /**
     * A DNS_QUERY_RAW_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DNS_QUERY_RAW_COMPLETION_ROUTINE {
        /**
         * Creates a DNS_QUERY_RAW_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DNS_QUERY_RAW_RESULT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DNS_QUERY_RAW_RESULT.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
