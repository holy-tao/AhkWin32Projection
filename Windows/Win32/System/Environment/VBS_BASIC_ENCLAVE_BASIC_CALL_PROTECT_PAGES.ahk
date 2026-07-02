#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EnclaveAddress 
     * @param {Pointer} NumberOfytes 
     * @param {Integer} PageProtection 
     * @returns {Integer} 
     */
    Call(EnclaveAddress, NumberOfytes, PageProtection) {
        EnclaveAddressMarshal := EnclaveAddress is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EnclaveAddressMarshal, EnclaveAddress, IntPtr, NumberOfytes, UInt32, PageProtection, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_PROTECT_PAGES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
