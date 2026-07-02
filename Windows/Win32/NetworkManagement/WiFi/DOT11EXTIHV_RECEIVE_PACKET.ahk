#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_RECEIVE_PACKET {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_RECEIVE_PACKET) {
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
     * @param {Integer} dwInBufferSize 
     * @param {Integer} pvInBuffer 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, dwInBufferSize, pvInBuffer) {
        result := DllCall(this.value, HANDLE, hIhvExtAdapter, UInt32, dwInBufferSize, IntPtr, pvInBuffer, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_RECEIVE_PACKET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_RECEIVE_PACKET {
        /**
         * Creates a DOT11EXTIHV_RECEIVE_PACKET pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
