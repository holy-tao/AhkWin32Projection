#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} offset 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} lpcbBytesWritten 
     * @returns {Integer} 
     */
    Call(offset, lpBuffer, cb, lpcbBytesWritten) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpcbBytesWrittenMarshal := lpcbBytesWritten is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, offset, lpBufferMarshal, lpBuffer, UInt32, cb, lpcbBytesWrittenMarshal, lpcbBytesWritten, UInt32)
        return result
    }

    /**
     * A PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE {
        /**
         * Creates a PWINDBG_WRITE_PROCESS_MEMORY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
