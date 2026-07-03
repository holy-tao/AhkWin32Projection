#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_SDEV_IDENTIFIER {
    value : IntPtr

    __value {
        set {
            if (value is GET_SDEV_IDENTIFIER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} InterfaceContext 
     * @returns {Integer} 
     */
    Call(InterfaceContext) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, Int64)
        return result
    }

    /**
     * A GET_SDEV_IDENTIFIER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_SDEV_IDENTIFIER {
        /**
         * Creates a GET_SDEV_IDENTIFIER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64])
        }

        __Delete() => CallbackFree(this.value)
    }
}
