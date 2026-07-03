#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\TRANSPORTCLIENT_SESSION_INFO.ahk" { TRANSPORTCLIENT_SESSION_INFO }

/**
 * The PFN_WdsTransportClientSessionStart callback is called at the start of a multicast session to indicate file size and other server side information about the file to the consumer. (PFN_WdsTransportClientSessionStartEx)
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstartex
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientSessionStartEx {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientSessionStartEx) {
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
     * @param {Pointer<TRANSPORTCLIENT_SESSION_INFO>} Info This parameter receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ns-wdstci-transportclient_session_info">TRANSPORTCLIENT_SESSION_INFO</a> structure.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, Info) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, TRANSPORTCLIENT_SESSION_INFO.Ptr, Info)
    }

    /**
     * A PFN_WdsTransportClientSessionStartEx that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientSessionStartEx {
        /**
         * Creates a PFN_WdsTransportClientSessionStartEx pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", TRANSPORTCLIENT_SESSION_INFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", TRANSPORTCLIENT_SESSION_INFO.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
