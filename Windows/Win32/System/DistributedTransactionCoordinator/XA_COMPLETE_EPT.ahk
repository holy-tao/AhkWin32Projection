#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XA_COMPLETE_EPT {
    value : IntPtr

    __value {
        set {
            if (value is XA_COMPLETE_EPT) {
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
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, Int32, param2, Int32, param3, Int32)
        return result
    }

    /**
     * A XA_COMPLETE_EPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends XA_COMPLETE_EPT {
        /**
         * Creates a XA_COMPLETE_EPT pointer that invokes the given AHK function when called.
         * @param {Func("int*", "int*", Int32, Int32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["int*", "int*", Int32, Int32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
