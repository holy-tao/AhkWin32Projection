#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PDEVICE_NOTIFY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDEVICE_NOTIFY_CALLBACK) {
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
     * @param {Integer} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0, UInt32, param1)
    }

    /**
     * A PDEVICE_NOTIFY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEVICE_NOTIFY_CALLBACK {
        /**
         * Creates a PDEVICE_NOTIFY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
