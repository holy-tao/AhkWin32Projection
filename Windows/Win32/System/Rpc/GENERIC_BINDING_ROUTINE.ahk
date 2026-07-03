#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct GENERIC_BINDING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is GENERIC_BINDING_ROUTINE) {
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
     * @returns {Pointer<Void>} 
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, IntPtr)
        return result
    }

    /**
     * A GENERIC_BINDING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GENERIC_BINDING_ROUTINE {
        /**
         * Creates a GENERIC_BINDING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
