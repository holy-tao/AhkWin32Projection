#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryTrueTypeTable {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryTrueTypeTable) {
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
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Pointer<Pointer<Integer>>} param6 
     * @param {Pointer<Integer>} param7 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param5Marshal := param5 is VarRef ? "char*" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr*" : "ptr"
        param7Marshal := param7 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, param0, UInt32, param1, UInt32, param2, Int32, param3, UInt32, param4, param5Marshal, param5, param6Marshal, param6, param7Marshal, param7, Int32)
        return result
    }

    /**
     * A PFN_DrvQueryTrueTypeTable that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryTrueTypeTable {
        /**
         * Creates a PFN_DrvQueryTrueTypeTable pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, UInt32, Int32, UInt32, "char*", "ptr*", "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32, Int32, UInt32, "char*", "ptr*", "uint*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
