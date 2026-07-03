#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct GENERIC_UNBIND_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is GENERIC_UNBIND_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"

        DllCall(this.value, param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * A GENERIC_UNBIND_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GENERIC_UNBIND_ROUTINE {
        /**
         * Creates a GENERIC_UNBIND_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
