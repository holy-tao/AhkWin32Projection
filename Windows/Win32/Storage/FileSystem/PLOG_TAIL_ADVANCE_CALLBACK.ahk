#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CLS_LSN.ahk" { CLS_LSN }

/**
 * The LOG_TAIL_ADVANCE_CALLBACK function is an application-defined callback function that advances the log tail. The callback is invoked in the context of an asynchronous procedure call (APC) on the thread that registers for log management.
 * @remarks
 * This callback can be invoked at any time. This callback function should advance the base LSN of the log to greater than or equal to the value of <i>lsnTarget</i>.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nc-clfsmgmtw32-plog_tail_advance_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PLOG_TAIL_ADVANCE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLOG_TAIL_ADVANCE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hLogFile The handle to the log.
     * @param {CLS_LSN} lsnTarget Specifies the log sequence number (LSN) to which the client is advised to advance to or beyond. The <i>lsnTarget</i> may not refer to an actual record in the log.
     * @param {Pointer<Void>} pvClientContext A pointer to the client context.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hLogFile, lsnTarget, pvClientContext) {
        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hLogFile, CLS_LSN, lsnTarget, pvClientContextMarshal, pvClientContext)
    }

    /**
     * A PLOG_TAIL_ADVANCE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOG_TAIL_ADVANCE_CALLBACK {
        /**
         * Creates a PLOG_TAIL_ADVANCE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, CLS_LSN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, CLS_LSN, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
