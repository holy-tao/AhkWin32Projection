#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalSetPciErrorHandlerCallback {
    value : IntPtr

    __value {
        set {
            if (value is pHalSetPciErrorHandlerCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PCI_ERROR_HANDLER_CALLBACK>} Callback 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Callback) {
        DllCall(this.value, "ptr", Callback)
    }

    /**
     * A pHalSetPciErrorHandlerCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalSetPciErrorHandlerCallback {
        /**
         * Creates a pHalSetPciErrorHandlerCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
