#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RDR_CALLOUT_STATE.ahk" { RDR_CALLOUT_STATE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcFreeCalloutStateFn {
    value : IntPtr

    __value {
        set {
            if (value is I_RpcFreeCalloutStateFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RDR_CALLOUT_STATE>} CallOutState 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallOutState) {
        DllCall(this.value, RDR_CALLOUT_STATE.Ptr, CallOutState)
    }

    /**
     * A I_RpcFreeCalloutStateFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends I_RpcFreeCalloutStateFn {
        /**
         * Creates a I_RpcFreeCalloutStateFn pointer that invokes the given AHK function when called.
         * @param {Func(RDR_CALLOUT_STATE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RDR_CALLOUT_STATE.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
