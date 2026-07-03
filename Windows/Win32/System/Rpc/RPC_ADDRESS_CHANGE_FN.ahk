#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_ADDRESS_CHANGE_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_ADDRESS_CHANGE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} arg 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(arg) {
        argMarshal := arg is VarRef ? "ptr" : "ptr"

        DllCall(this.value, argMarshal, arg)
    }

    /**
     * A RPC_ADDRESS_CHANGE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_ADDRESS_CHANGE_FN {
        /**
         * Creates a RPC_ADDRESS_CHANGE_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
