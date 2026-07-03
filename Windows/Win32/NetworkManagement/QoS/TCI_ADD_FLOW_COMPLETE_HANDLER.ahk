#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The ClAddFlowComplete function is used by traffic control to notify the client of the completion of its previous call to the TcAddFlow function.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nc-traffic-tci_add_flow_complete_handler
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TCI_ADD_FLOW_COMPLETE_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is TCI_ADD_FLOW_COMPLETE_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ClFlowCtx Client provided–flow context handle. This can be the container used to hold an arbitrary client-defined context for this instance of the client. This value will be the same as the value provided by the client during its corresponding call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a>.
     * @param {Integer} _Status Completion status for the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> request. This value may be any of the return values possible for the 
     * <b>TcAddFlow</b> function, with the exception of ERROR_SIGNAL_PENDING. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>ClAddFlowComplete</b> function requires administrative privilege.</div>
     * <div> </div>
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ClFlowCtx, _Status) {
        DllCall(this.value, HANDLE, ClFlowCtx, UInt32, _Status)
    }

    /**
     * A TCI_ADD_FLOW_COMPLETE_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TCI_ADD_FLOW_COMPLETE_HANDLER {
        /**
         * Creates a TCI_ADD_FLOW_COMPLETE_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
