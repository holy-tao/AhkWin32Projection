#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Applications implement this callback if they call the SetThreadpoolCallbackCleanupGroup function to specify the callback to use when CloseThreadpoolCleanupGroup is called.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nc-winnt-ptp_cleanup_group_cancel_callback
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_CLEANUP_GROUP_CANCEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PTP_CLEANUP_GROUP_CANCEL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _ObjectContext Optional application-defined data specified during creation of the object.
     * @param {Pointer<Void>} CleanupContext Optional application-defined data specified using <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers">CloseThreadpoolCleanupGroupMembers</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_ObjectContext, CleanupContext) {
        _ObjectContextMarshal := _ObjectContext is VarRef ? "ptr" : "ptr"
        CleanupContextMarshal := CleanupContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ObjectContextMarshal, _ObjectContext, CleanupContextMarshal, CleanupContext)
    }

    /**
     * A PTP_CLEANUP_GROUP_CANCEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTP_CLEANUP_GROUP_CANCEL_CALLBACK {
        /**
         * Creates a PTP_CLEANUP_GROUP_CANCEL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
