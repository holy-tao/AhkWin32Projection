#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_VIRTUAL_DEVICE_RESOURCES {
    value : IntPtr

    __value {
        set {
            if (value is GET_VIRTUAL_DEVICE_RESOURCES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Integer>} CapturedBusNumbers 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, CapturedBusNumbers) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        CapturedBusNumbersMarshal := CapturedBusNumbers is VarRef ? "char*" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, CapturedBusNumbersMarshal, CapturedBusNumbers)
    }

    /**
     * A GET_VIRTUAL_DEVICE_RESOURCES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_VIRTUAL_DEVICE_RESOURCES {
        /**
         * Creates a GET_VIRTUAL_DEVICE_RESOURCES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
