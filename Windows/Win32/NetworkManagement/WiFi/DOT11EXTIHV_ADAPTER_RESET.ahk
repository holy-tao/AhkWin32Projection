#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_ADAPTER_RESET {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_ADAPTER_RESET) {
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
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter) {
        result := DllCall(this.value, HANDLE, hIhvExtAdapter, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_ADAPTER_RESET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_ADAPTER_RESET {
        /**
         * Creates a DOT11EXTIHV_ADAPTER_RESET pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
