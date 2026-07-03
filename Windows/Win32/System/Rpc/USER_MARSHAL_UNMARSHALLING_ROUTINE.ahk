#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_UNMARSHALLING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is USER_MARSHAL_UNMARSHALLING_ROUTINE) {
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
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Pointer<Integer>} 
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, IntPtr)
        return result
    }

    /**
     * A USER_MARSHAL_UNMARSHALLING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends USER_MARSHAL_UNMARSHALLING_ROUTINE {
        /**
         * Creates a USER_MARSHAL_UNMARSHALLING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "char*", "ptr") => "char*"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "char*", "ptr", "char*"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
