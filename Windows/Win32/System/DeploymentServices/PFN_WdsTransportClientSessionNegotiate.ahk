#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\TRANSPORTCLIENT_SESSION_INFO.ahk" { TRANSPORTCLIENT_SESSION_INFO }

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientSessionNegotiate {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientSessionNegotiate) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hSessionKey 
     * @param {Pointer<Void>} pCallerData 
     * @param {Pointer<TRANSPORTCLIENT_SESSION_INFO>} pInfo 
     * @param {HANDLE} hNegotiateKey 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, pInfo, hNegotiateKey) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, TRANSPORTCLIENT_SESSION_INFO.Ptr, pInfo, HANDLE, hNegotiateKey)
    }

    /**
     * A PFN_WdsTransportClientSessionNegotiate that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientSessionNegotiate {
        /**
         * Creates a PFN_WdsTransportClientSessionNegotiate pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", TRANSPORTCLIENT_SESSION_INFO, HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", TRANSPORTCLIENT_SESSION_INFO.Ptr, HANDLE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
