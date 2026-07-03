#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_CONTROL) {
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
     * @param {Integer} pInBuffer 
     * @param {Integer} dwOutBufferSize 
     * @param {Integer} pOutBuffer 
     * @param {Pointer<Integer>} pdwBytesReturned 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, dwInBufferSize, pInBuffer, dwOutBufferSize, pOutBuffer, pdwBytesReturned) {
        pdwBytesReturnedMarshal := pdwBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hIhvExtAdapter, UInt32, dwInBufferSize, IntPtr, pInBuffer, UInt32, dwOutBufferSize, IntPtr, pOutBuffer, pdwBytesReturnedMarshal, pdwBytesReturned, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_CONTROL {
        /**
         * Creates a DOT11EXTIHV_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, IntPtr, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
