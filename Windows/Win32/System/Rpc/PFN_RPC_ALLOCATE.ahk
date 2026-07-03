#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct PFN_RPC_ALLOCATE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_RPC_ALLOCATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @returns {Pointer<Void>} 
     */
    Call(param0) {
        result := DllCall(this.value, IntPtr, param0, IntPtr)
        return result
    }

    /**
     * A PFN_RPC_ALLOCATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_RPC_ALLOCATE {
        /**
         * Creates a PFN_RPC_ALLOCATE pointer that invokes the given AHK function when called.
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
