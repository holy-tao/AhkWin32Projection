#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FH_OVERLAPPED.ahk" { FH_OVERLAPPED }
#Import ".\FIO_CONTEXT.ahk" { FIO_CONTEXT }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PFN_IO_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IO_COMPLETION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FIO_CONTEXT>} pContext 
     * @param {Pointer<FH_OVERLAPPED>} lpo 
     * @param {Integer} cb 
     * @param {Integer} dwCompletionStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pContext, lpo, cb, dwCompletionStatus) {
        DllCall(this.value, FIO_CONTEXT.Ptr, pContext, FH_OVERLAPPED.Ptr, lpo, UInt32, cb, UInt32, dwCompletionStatus)
    }

    /**
     * A PFN_IO_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IO_COMPLETION {
        /**
         * Creates a PFN_IO_COMPLETION pointer that invokes the given AHK function when called.
         * @param {Func(FIO_CONTEXT, FH_OVERLAPPED, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FIO_CONTEXT.Ptr, FH_OVERLAPPED.Ptr, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
