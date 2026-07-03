#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Applications implement the CounterPathCallBack function to process the counter path strings returned by the Browse dialog box.
 * @remarks
 * The following members of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG</a> structure are used to communicate with the callback function:
 * @see https://learn.microsoft.com/windows/win32/api/pdh/nc-pdh-counterpathcallback
 * @namespace Windows.Win32.System.Performance
 */
export default struct CounterPathCallBack {
    value : IntPtr

    __value {
        set {
            if (value is CounterPathCallBack) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 User-defined value passed to the callback function by the <b>Browse</b> dialog box. You set this value in the <b>dwCallBackArg</b> member of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG</a> structure.
     * @returns {Integer} Return ERROR_SUCCESS if the function succeeds. 
     * 
     * If the function fails due to a transient error, you can return PDH_RETRY and PDH will call your callback immediately.
     * 
     * Otherwise, return an appropriate error code. The error code is passed back to the caller of <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbrowsecountersa">PdhBrowseCounters</a>.
     */
    Call(param0) {
        result := DllCall(this.value, IntPtr, param0, Int32)
        return result
    }

    /**
     * A CounterPathCallBack that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CounterPathCallBack {
        /**
         * Creates a CounterPathCallBack pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
