#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_SIZING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is USER_MARSHAL_SIZING_ROUTINE) {
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
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, UInt32, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A USER_MARSHAL_SIZING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends USER_MARSHAL_SIZING_ROUTINE {
        /**
         * Creates a USER_MARSHAL_SIZING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("uint*", UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
