#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_CIPHER_DEFAULT_KEY_VALUE.ahk" { DOT11_CIPHER_DEFAULT_KEY_VALUE }
#Import ".\DOT11_DIRECTION.ahk" { DOT11_DIRECTION }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_DEFAULT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_DEFAULT_KEY) {
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
     * @param {Pointer<DOT11_CIPHER_DEFAULT_KEY_VALUE>} pKey 
     * @param {DOT11_DIRECTION} dot11Direction 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pKey, dot11Direction) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, DOT11_CIPHER_DEFAULT_KEY_VALUE.Ptr, pKey, DOT11_DIRECTION, dot11Direction, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_DEFAULT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_DEFAULT_KEY {
        /**
         * Creates a DOT11EXT_SET_DEFAULT_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11_CIPHER_DEFAULT_KEY_VALUE, DOT11_DIRECTION) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11_CIPHER_DEFAULT_KEY_VALUE.Ptr, DOT11_DIRECTION, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
