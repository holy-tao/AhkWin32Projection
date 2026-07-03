#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_FREEING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is USER_MARSHAL_FREEING_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0, param1Marshal, param1)
    }

    /**
     * A USER_MARSHAL_FREEING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends USER_MARSHAL_FREEING_ROUTINE {
        /**
         * Creates a USER_MARSHAL_FREEING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
