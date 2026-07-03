#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_PRE_ASSOCIATE_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_PRE_ASSOCIATE_COMPLETION) {
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
     * @param {Integer} dwReasonCode 
     * @param {Integer} dwWin32Error 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, hConnectSession, dwReasonCode, dwWin32Error) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, HANDLE, hConnectSession, UInt32, dwReasonCode, UInt32, dwWin32Error, UInt32)
        return result
    }

    /**
     * A DOT11EXT_PRE_ASSOCIATE_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_PRE_ASSOCIATE_COMPLETION {
        /**
         * Creates a DOT11EXT_PRE_ASSOCIATE_COMPLETION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
