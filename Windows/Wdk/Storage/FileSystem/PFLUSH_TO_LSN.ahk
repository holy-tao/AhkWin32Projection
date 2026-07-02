#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFLUSH_TO_LSN {
    value : IntPtr

    __value {
        set {
            if (value is PFLUSH_TO_LSN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @param {Integer} Lsn 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(LogHandle, Lsn) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, LogHandleMarshal, LogHandle, Int64, Lsn)
    }

    /**
     * A PFLUSH_TO_LSN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLUSH_TO_LSN {
        /**
         * Creates a PFLUSH_TO_LSN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
