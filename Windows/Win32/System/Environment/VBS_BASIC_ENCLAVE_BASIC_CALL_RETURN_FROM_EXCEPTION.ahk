#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBS_BASIC_ENCLAVE_EXCEPTION_AMD64.ahk" { VBS_BASIC_ENCLAVE_EXCEPTION_AMD64 }

/**
 * @namespace Windows.Win32.System.Environment
 * @architecture X64
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<VBS_BASIC_ENCLAVE_EXCEPTION_AMD64>} ExceptionRecord 
     * @returns {Integer} 
     */
    Call(ExceptionRecord) {
        result := DllCall(this.value, VBS_BASIC_ENCLAVE_EXCEPTION_AMD64.Ptr, ExceptionRecord, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_EXCEPTION pointer that invokes the given AHK function when called.
         * @param {Func(VBS_BASIC_ENCLAVE_EXCEPTION_AMD64) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [VBS_BASIC_ENCLAVE_EXCEPTION_AMD64.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
