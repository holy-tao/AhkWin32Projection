#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA) {
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
     * @param {HANDLE} hConnectSession 
     * @param {Integer} dwSessionID 
     * @param {Integer} dwDataSize 
     * @param {Integer} pvData 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, hConnectSession, dwSessionID, dwDataSize, pvData) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, HANDLE, hConnectSession, UInt32, dwSessionID, UInt32, dwDataSize, IntPtr, pvData, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA {
        /**
         * Creates a DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, UInt32, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, UInt32, IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
