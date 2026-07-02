#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PKIPI_BROADCAST_WORKER {
    value : IntPtr

    __value {
        set {
            if (value is PKIPI_BROADCAST_WORKER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer} 
     */
    Call() {
        result := DllCall(this.value, IntPtr)
        return result
    }

    /**
     * A PKIPI_BROADCAST_WORKER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKIPI_BROADCAST_WORKER {
        /**
         * Creates a PKIPI_BROADCAST_WORKER pointer that invokes the given AHK function when called.
         * @param {Func() => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
