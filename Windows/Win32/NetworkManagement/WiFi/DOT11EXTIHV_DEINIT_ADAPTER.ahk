#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_DEINIT_ADAPTER {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_DEINIT_ADAPTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hIhvExtAdapter) {
        DllCall(this.value, HANDLE, hIhvExtAdapter)
    }

    /**
     * A DOT11EXTIHV_DEINIT_ADAPTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_DEINIT_ADAPTER {
        /**
         * Creates a DOT11EXTIHV_DEINIT_ADAPTER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
