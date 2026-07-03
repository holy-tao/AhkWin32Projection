#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPFNDISMISS {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDISMISS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<Void>} lpvContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ulUIParam, lpvContext) {
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IntPtr, ulUIParam, lpvContextMarshal, lpvContext)
    }

    /**
     * A LPFNDISMISS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDISMISS {
        /**
         * Creates a LPFNDISMISS pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
