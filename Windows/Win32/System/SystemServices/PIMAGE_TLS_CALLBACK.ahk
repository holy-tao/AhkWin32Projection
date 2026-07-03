#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PIMAGE_TLS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PIMAGE_TLS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} DllHandle 
     * @param {Integer} Reason 
     * @param {Pointer<Void>} Reserved 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DllHandle, Reason, Reserved) {
        DllHandleMarshal := DllHandle is VarRef ? "ptr" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DllHandleMarshal, DllHandle, UInt32, Reason, ReservedMarshal, Reserved)
    }

    /**
     * A PIMAGE_TLS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIMAGE_TLS_CALLBACK {
        /**
         * Creates a PIMAGE_TLS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
