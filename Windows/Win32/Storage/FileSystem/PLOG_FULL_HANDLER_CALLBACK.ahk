#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The LOG_FULL_HANDLER_CALLBACK function is an application-defined callback function that receives notification that the call to HandleLogFull is complete.
 * @remarks
 * The client application determines which actions this callback function performs.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nc-clfsmgmtw32-plog_full_handler_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PLOG_FULL_HANDLER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLOG_FULL_HANDLER_CALLBACK) {
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
     * @param {Integer} dwError The status of the operation.
     * @param {BOOL} fLogIsPinned Specifies if the log is considered "pinned". If <i>fLogIsPinned</i> is <b>TRUE</b> and the log is then unpinned, the <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_unpinned_callback">LOG_UNPINNED_CALLBACK</a> is invoked.
     * @param {Pointer<Void>} pvClientContext A pointer to the client context.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hLogFile, dwError, fLogIsPinned, pvClientContext) {
        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hLogFile, UInt32, dwError, BOOL, fLogIsPinned, pvClientContextMarshal, pvClientContext)
    }

    /**
     * A PLOG_FULL_HANDLER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOG_FULL_HANDLER_CALLBACK {
        /**
         * Creates a PLOG_FULL_HANDLER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, BOOL, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, BOOL, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
