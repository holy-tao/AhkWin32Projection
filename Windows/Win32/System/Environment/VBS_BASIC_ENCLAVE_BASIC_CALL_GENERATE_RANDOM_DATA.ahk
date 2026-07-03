#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Buffer 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Integer>} Generation 
     * @returns {Integer} 
     */
    Call(_Buffer, NumberOfBytes, Generation) {
        GenerationMarshal := Generation is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, _Buffer, UInt32, NumberOfBytes, GenerationMarshal, Generation, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_RANDOM_DATA pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "uint*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
