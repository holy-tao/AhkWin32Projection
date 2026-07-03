#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RM_WRITE_STATUS_CALLBACK function can be implemented by the user interface that controls the Restart Manager.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/nc-restartmanager-rm_write_status_callback
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_WRITE_STATUS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is RM_WRITE_STATUS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} nPercentComplete An integer value between 0 and 100 that indicates the percentage of the total number of applications that have either been shut down or restarted.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(nPercentComplete) {
        DllCall(this.value, UInt32, nPercentComplete)
    }

    /**
     * A RM_WRITE_STATUS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RM_WRITE_STATUS_CALLBACK {
        /**
         * Creates a RM_WRITE_STATUS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
