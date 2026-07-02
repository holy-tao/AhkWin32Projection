#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_CIPHER_KEY_MAPPING_KEY_VALUE.ahk" { DOT11_CIPHER_KEY_MAPPING_KEY_VALUE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_KEY_MAPPING_KEY {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_KEY_MAPPING_KEY) {
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
     * @param {Pointer<DOT11_CIPHER_KEY_MAPPING_KEY_VALUE>} pKey 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pKey) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, DOT11_CIPHER_KEY_MAPPING_KEY_VALUE.Ptr, pKey, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_KEY_MAPPING_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_KEY_MAPPING_KEY {
        /**
         * Creates a DOT11EXT_SET_KEY_MAPPING_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11_CIPHER_KEY_MAPPING_KEY_VALUE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11_CIPHER_KEY_MAPPING_KEY_VALUE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
