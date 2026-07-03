#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSAPI_REASON_HANDLER.ahk" { CLUSAPI_REASON_HANDLER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_REASON_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_REASON_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CLUSAPI_REASON_HANDLER>} lpHandler 
     * @returns {Pointer<CLUSAPI_REASON_HANDLER>} 
     */
    Call(lpHandler) {
        result := DllCall(this.value, CLUSAPI_REASON_HANDLER.Ptr, lpHandler, CLUSAPI_REASON_HANDLER.Ptr)
        return result
    }

    /**
     * A PCLUSAPI_SET_REASON_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_REASON_HANDLER {
        /**
         * Creates a PCLUSAPI_SET_REASON_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(CLUSAPI_REASON_HANDLER) => CLUSAPI_REASON_HANDLER.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUSAPI_REASON_HANDLER.Ptr, CLUSAPI_REASON_HANDLER.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
