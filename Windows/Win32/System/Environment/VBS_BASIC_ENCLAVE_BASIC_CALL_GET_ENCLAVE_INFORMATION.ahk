#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCLAVE_INFORMATION.ahk" { ENCLAVE_INFORMATION }

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<ENCLAVE_INFORMATION>} EnclaveInfo 
     * @returns {Integer} 
     */
    Call(EnclaveInfo) {
        result := DllCall(this.value, ENCLAVE_INFORMATION.Ptr, EnclaveInfo, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_GET_ENCLAVE_INFORMATION pointer that invokes the given AHK function when called.
         * @param {Func(ENCLAVE_INFORMATION) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [ENCLAVE_INFORMATION.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
