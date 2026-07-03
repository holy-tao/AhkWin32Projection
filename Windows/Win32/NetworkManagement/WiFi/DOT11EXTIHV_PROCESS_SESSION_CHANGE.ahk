#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\RemoteDesktop\WTSSESSION_NOTIFICATION.ahk" { WTSSESSION_NOTIFICATION }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_PROCESS_SESSION_CHANGE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_PROCESS_SESSION_CHANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} uEventType 
     * @param {Pointer<WTSSESSION_NOTIFICATION>} pSessionNotification 
     * @returns {Integer} 
     */
    Call(uEventType, pSessionNotification) {
        result := DllCall(this.value, UInt32, uEventType, WTSSESSION_NOTIFICATION.Ptr, pSessionNotification, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_PROCESS_SESSION_CHANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_PROCESS_SESSION_CHANGE {
        /**
         * Creates a DOT11EXTIHV_PROCESS_SESSION_CHANGE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, WTSSESSION_NOTIFICATION) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, WTSSESSION_NOTIFICATION.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
