#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WORKERFUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is WORKERFUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0)
    }

    /**
     * A WORKERFUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WORKERFUNCTION {
        /**
         * Creates a WORKERFUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
