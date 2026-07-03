#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The LOG_UNPINNED_CALLBACK function is an application-defined callback function that receives notification that the log has become unpinned.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nc-clfsmgmtw32-plog_unpinned_callback
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PLOG_UNPINNED_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLOG_UNPINNED_CALLBACK) {
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
     * @param {Pointer<Void>} pvClientContext A pointer to the client context. This is the same context specified when registering the client, which is a member of <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/ns-clfsmgmtw32-log_management_callbacks">LOG_MANAGEMENT_CALLBACKS</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hLogFile, pvClientContext) {
        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hLogFile, pvClientContextMarshal, pvClientContext)
    }

    /**
     * A PLOG_UNPINNED_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOG_UNPINNED_CALLBACK {
        /**
         * Creates a PLOG_UNPINNED_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
