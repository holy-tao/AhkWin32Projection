#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPCLT_PDU_FILTER_FUNC.ahk" { RPCLT_PDU_FILTER_FUNC }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_SETFILTER_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is RPC_SETFILTER_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RPCLT_PDU_FILTER_FUNC>} pfnFilter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pfnFilter) {
        DllCall(this.value, RPCLT_PDU_FILTER_FUNC, pfnFilter)
    }

    /**
     * A RPC_SETFILTER_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_SETFILTER_FUNC {
        /**
         * Creates a RPC_SETFILTER_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(RPCLT_PDU_FILTER_FUNC) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [RPCLT_PDU_FILTER_FUNC, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
