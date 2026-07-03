#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_PROCESS_UI_RESPONSE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_PROCESS_UI_RESPONSE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} guidUIRequest 
     * @param {Integer} dwByteCount 
     * @param {Integer} pvResponseBuffer 
     * @returns {Integer} 
     */
    Call(guidUIRequest, dwByteCount, pvResponseBuffer) {
        result := DllCall(this.value, Guid, guidUIRequest, UInt32, dwByteCount, IntPtr, pvResponseBuffer, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_PROCESS_UI_RESPONSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_PROCESS_UI_RESPONSE {
        /**
         * Creates a DOT11EXTIHV_PROCESS_UI_RESPONSE pointer that invokes the given AHK function when called.
         * @param {Func(Guid, UInt32, IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, UInt32, IntPtr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
