#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PQUERY_LOG_USAGE {
    value : IntPtr

    __value {
        set {
            if (value is PQUERY_LOG_USAGE) {
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
     * @param {Pointer<Integer>} PercentageFull 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(LogHandle, PercentageFull) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"
        PercentageFullMarshal := PercentageFull is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, LogHandleMarshal, LogHandle, PercentageFullMarshal, PercentageFull)
    }

    /**
     * A PQUERY_LOG_USAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PQUERY_LOG_USAGE {
        /**
         * Creates a PQUERY_LOG_USAGE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ushort*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ushort*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
