#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_SDEV_IDENTIFIER {
    value : IntPtr

    __value {
        set {
            if (value is PGET_SDEV_IDENTIFIER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} 
     */
    Call() {
        result := DllCall(this.value, Int64)
        return result
    }

    /**
     * A PGET_SDEV_IDENTIFIER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_SDEV_IDENTIFIER {
        /**
         * Creates a PGET_SDEV_IDENTIFIER pointer that invokes the given AHK function when called.
         * @param {Func() => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
