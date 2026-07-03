#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_FREE_ENVIRONMENT {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_FREE_ENVIRONMENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpEnvironment 
     * @returns {Integer} 
     */
    Call(lpEnvironment) {
        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, lpEnvironmentMarshal, lpEnvironment, UInt32)
        return result
    }

    /**
     * A PRESUTIL_FREE_ENVIRONMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_FREE_ENVIRONMENT {
        /**
         * Creates a PRESUTIL_FREE_ENVIRONMENT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
