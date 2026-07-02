#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_REQUEST_VIRTUAL_STATION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_REQUEST_VIRTUAL_STATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11PrimaryHandle 
     * @returns {Integer} 
     */
    Call(hDot11PrimaryHandle) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, HANDLE, hDot11PrimaryHandle, "ptr", pvReserved, UInt32)
        return result
    }

    /**
     * A DOT11EXT_REQUEST_VIRTUAL_STATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_REQUEST_VIRTUAL_STATION {
        /**
         * Creates a DOT11EXT_REQUEST_VIRTUAL_STATION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
