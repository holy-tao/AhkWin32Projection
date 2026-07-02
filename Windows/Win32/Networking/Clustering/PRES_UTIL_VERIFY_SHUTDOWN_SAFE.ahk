#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRES_UTIL_VERIFY_SHUTDOWN_SAFE {
    value : IntPtr

    __value {
        set {
            if (value is PRES_UTIL_VERIFY_SHUTDOWN_SAFE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} reason 
     * @param {Pointer<Integer>} pResult 
     * @returns {Integer} 
     */
    Call(flags, reason, pResult) {
        pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, flags, UInt32, reason, pResultMarshal, pResult, UInt32)
        return result
    }

    /**
     * A PRES_UTIL_VERIFY_SHUTDOWN_SAFE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRES_UTIL_VERIFY_SHUTDOWN_SAFE {
        /**
         * Creates a PRES_UTIL_VERIFY_SHUTDOWN_SAFE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
