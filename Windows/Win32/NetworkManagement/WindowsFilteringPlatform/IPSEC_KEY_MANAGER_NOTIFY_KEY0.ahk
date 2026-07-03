#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_DETAILS1.ahk" { IPSEC_SA_DETAILS1 }

/**
 * Is used to notify Trusted Intermediary Agents (TIAs) of the keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister</a> to register this function pointer.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-ipsec_key_manager_notify_key0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEY_MANAGER_NOTIFY_KEY0 {
    value : IntPtr

    __value {
        set {
            if (value is IPSEC_KEY_MANAGER_NOTIFY_KEY0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IPSEC_SA_DETAILS1>} inboundSa Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1">IPSEC_SA_DETAILS1</a>*</b>
     * 
     * Information about the inbound SA.
     * @param {Pointer<IPSEC_SA_DETAILS1>} outboundSa Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1">IPSEC_SA_DETAILS1</a>*</b>
     * 
     * Information about the outbound SA.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(inboundSa, outboundSa) {
        DllCall(this.value, IPSEC_SA_DETAILS1.Ptr, inboundSa, IPSEC_SA_DETAILS1.Ptr, outboundSa)
    }

    /**
     * A IPSEC_KEY_MANAGER_NOTIFY_KEY0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IPSEC_KEY_MANAGER_NOTIFY_KEY0 {
        /**
         * Creates a IPSEC_KEY_MANAGER_NOTIFY_KEY0 pointer that invokes the given AHK function when called.
         * @param {Func(IPSEC_SA_DETAILS1, IPSEC_SA_DETAILS1) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IPSEC_SA_DETAILS1.Ptr, IPSEC_SA_DETAILS1.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
