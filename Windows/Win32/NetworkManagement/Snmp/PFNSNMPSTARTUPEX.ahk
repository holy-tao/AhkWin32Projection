#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPSTARTUPEX {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPSTARTUPEX) {
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
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4, UInt32)
        return result
    }

    /**
     * A PFNSNMPSTARTUPEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPSTARTUPEX {
        /**
         * Creates a PFNSNMPSTARTUPEX pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "uint*", "uint*", "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "uint*", "uint*", "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
