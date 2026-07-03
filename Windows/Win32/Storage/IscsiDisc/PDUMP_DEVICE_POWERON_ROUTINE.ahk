#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct PDUMP_DEVICE_POWERON_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PDUMP_DEVICE_POWERON_ROUTINE) {
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
     * @returns {Integer} 
     */
    Call(_Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Int32)
        return result
    }

    /**
     * A PDUMP_DEVICE_POWERON_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDUMP_DEVICE_POWERON_ROUTINE {
        /**
         * Creates a PDUMP_DEVICE_POWERON_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
