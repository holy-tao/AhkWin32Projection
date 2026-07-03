#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_ALLOCATE_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_ALLOCATE_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwByteCount 
     * @param {Pointer<Pointer<Void>>} ppvBuffer 
     * @returns {Integer} 
     */
    Call(dwByteCount, ppvBuffer) {
        ppvBufferMarshal := ppvBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, dwByteCount, ppvBufferMarshal, ppvBuffer, UInt32)
        return result
    }

    /**
     * A DOT11EXT_ALLOCATE_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_ALLOCATE_BUFFER {
        /**
         * Creates a DOT11EXT_ALLOCATE_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
