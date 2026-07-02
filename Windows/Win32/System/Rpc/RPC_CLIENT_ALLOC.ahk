#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_CLIENT_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is RPC_CLIENT_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} _Size 
     * @returns {Pointer<Void>} 
     */
    Call(_Size) {
        result := DllCall(this.value, IntPtr, _Size, IntPtr)
        return result
    }

    /**
     * A RPC_CLIENT_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_CLIENT_ALLOC {
        /**
         * Creates a RPC_CLIENT_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
