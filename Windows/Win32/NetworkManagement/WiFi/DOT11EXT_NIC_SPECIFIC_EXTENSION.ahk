#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_NIC_SPECIFIC_EXTENSION {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_NIC_SPECIFIC_EXTENSION) {
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
     * @param {Integer} dwInBufferSize 
     * @param {Integer} pvInBuffer 
     * @param {Pointer<Integer>} pdwOutBufferSize 
     * @param {Integer} pvOutBuffer 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, dwInBufferSize, pvInBuffer, pdwOutBufferSize, pvOutBuffer) {
        pdwOutBufferSizeMarshal := pdwOutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hDot11SvcHandle, UInt32, dwInBufferSize, IntPtr, pvInBuffer, pdwOutBufferSizeMarshal, pdwOutBufferSize, IntPtr, pvOutBuffer, UInt32)
        return result
    }

    /**
     * A DOT11EXT_NIC_SPECIFIC_EXTENSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_NIC_SPECIFIC_EXTENSION {
        /**
         * Creates a DOT11EXT_NIC_SPECIFIC_EXTENSION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, IntPtr, "uint*", IntPtr) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr, "uint*", IntPtr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
