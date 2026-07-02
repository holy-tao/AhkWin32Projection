#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PFN_WdsTransportClientSessionCompete callback is used by the client to indicate that no more callbacks will be sent to the consumer and that the session either completed successfully or encountered a non-recoverable error.
 * @remarks
 * This will be the last callback a consumer receives.  The consumer will always receive this callback, even if the session is canceled.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientSessionComplete {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientSessionComplete) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hSessionKey The handle belonging to the session that is being started.
     * @param {Pointer<Void>} pCallerData Pointer to the caller specific data for this session.  This data was specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientstartsession">WdsTransportClientStartSession</a> function.
     * @param {Integer} dwError The overall status of the file transfer.  If the session succeeded, this value will be set to <b>ERROR_SUCCESS</b>.  If the session did not succeed, the error code for the session will be set.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, dwError) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, UInt32, dwError)
    }

    /**
     * A PFN_WdsTransportClientSessionComplete that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientSessionComplete {
        /**
         * Creates a PFN_WdsTransportClientSessionComplete pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
