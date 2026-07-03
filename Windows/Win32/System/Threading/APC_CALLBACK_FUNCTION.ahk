#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct APC_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is APC_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, param0, param1Marshal, param1, param2Marshal, param2)
    }

    /**
     * A APC_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends APC_CALLBACK_FUNCTION {
        /**
         * Creates a APC_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
