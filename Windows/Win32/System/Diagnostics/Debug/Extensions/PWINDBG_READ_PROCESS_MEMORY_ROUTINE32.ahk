#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_READ_PROCESS_MEMORY_ROUTINE32) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} lpcbBytesRead 
     * @returns {Integer} 
     */
    Call(offset, lpBuffer, cb, lpcbBytesRead) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpcbBytesReadMarshal := lpcbBytesRead is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, offset, lpBufferMarshal, lpBuffer, UInt32, cb, lpcbBytesReadMarshal, lpcbBytesRead, UInt32)
        return result
    }

    /**
     * A PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 {
        /**
         * Creates a PWINDBG_READ_PROCESS_MEMORY_ROUTINE32 pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
