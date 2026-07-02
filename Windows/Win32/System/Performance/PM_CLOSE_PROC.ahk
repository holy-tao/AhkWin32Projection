#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Performs the cleanup required by your performance DLL.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/nc-winperf-pm_close_proc
 * @namespace Windows.Win32.System.Performance
 */
export default struct PM_CLOSE_PROC {
    value : IntPtr

    __value {
        set {
            if (value is PM_CLOSE_PROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} This function should return ERROR_SUCCESS.
     */
    Call() {
        result := DllCall(this.value, UInt32)
        return result
    }

    /**
     * A PM_CLOSE_PROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PM_CLOSE_PROC {
        /**
         * Creates a PM_CLOSE_PROC pointer that invokes the given AHK function when called.
         * @param {Func() => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
