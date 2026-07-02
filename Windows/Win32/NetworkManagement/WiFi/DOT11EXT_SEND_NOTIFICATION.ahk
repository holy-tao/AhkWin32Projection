#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\L2_NOTIFICATION_DATA.ahk" { L2_NOTIFICATION_DATA }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SEND_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SEND_NOTIFICATION) {
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
     * @param {Pointer<L2_NOTIFICATION_DATA>} pNotificationData 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, pNotificationData) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, L2_NOTIFICATION_DATA.Ptr, pNotificationData, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SEND_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SEND_NOTIFICATION {
        /**
         * Creates a DOT11EXT_SEND_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, L2_NOTIFICATION_DATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, L2_NOTIFICATION_DATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
