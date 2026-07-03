#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {Integer} dwUnicastCipherAlgo 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, dwUnicastCipherAlgo) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, UInt32, dwUnicastCipherAlgo, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM {
        /**
         * Creates a DOT11EXT_SET_UNICAST_CIPHER_ALGORITHM pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
