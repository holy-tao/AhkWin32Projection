#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
        DllCall(this.value, "ptr", pfnFilter)
    }

    /**
     * A RPC_SETFILTER_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_SETFILTER_FUNC {
        /**
         * Creates a RPC_SETFILTER_FUNC pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
