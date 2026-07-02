#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_MESSAGE.ahk" { RPC_MESSAGE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_DISPATCH_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is RPC_DISPATCH_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RPC_MESSAGE>} Message 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Message) {
        DllCall(this.value, RPC_MESSAGE.Ptr, Message)
    }

    /**
     * A RPC_DISPATCH_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_DISPATCH_FUNCTION {
        /**
         * Creates a RPC_DISPATCH_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(RPC_MESSAGE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RPC_MESSAGE.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
