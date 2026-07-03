#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PFN_WdsTransportClientSessionStart callback is called at the start of a multicast session to indicate file size and other server side information about the file to the consumer. (PFN_WdsTransportClientSessionStart)
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstart
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientSessionStart {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientSessionStart) {
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
     * @param {Pointer<Void>} pCallerData Pointer to the caller specific data for this session.  This data was specified in the call to WdsTransportClientStartSession.
     * @param {Pointer<Integer>} ullFileSize 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, ullFileSize) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"
        ullFileSizeMarshal := ullFileSize is VarRef ? "uint*" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, ullFileSizeMarshal, ullFileSize)
    }

    /**
     * A PFN_WdsTransportClientSessionStart that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientSessionStart {
        /**
         * Creates a PFN_WdsTransportClientSessionStart pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
