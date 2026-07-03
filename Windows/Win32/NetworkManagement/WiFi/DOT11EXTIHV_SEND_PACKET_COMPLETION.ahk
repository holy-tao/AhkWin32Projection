#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_SEND_PACKET_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_SEND_PACKET_COMPLETION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hSendCompletion 
     * @returns {Integer} 
     */
    Call(hSendCompletion) {
        result := DllCall(this.value, HANDLE, hSendCompletion, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_SEND_PACKET_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_SEND_PACKET_COMPLETION {
        /**
         * Creates a DOT11EXTIHV_SEND_PACKET_COMPLETION pointer that invokes the given AHK function when called.
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
