#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IKEEXT_TRAFFIC0.ahk" { IKEEXT_TRAFFIC0 }

/**
 * Indicates whether the Trusted Intermediary Agent (TIA) will dictate the keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister</a> to register this function pointer.
 * 
 * If the TIA wants to dictate the keys, and its weight is higher than that of any peers, IPsec will subsequently call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0">IPSEC_KEY_MANAGER_DICTATE_KEY0</a>.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 {
    value : IntPtr

    __value {
        set {
            if (value is IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IKEEXT_TRAFFIC0>} ikeTraffic Type: [IKEEXT_TRAFFIC0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_traffic0)*</b>
     * 
     * Specifies the traffic for which keys should be set or retrieved.
     * @param {Pointer<BOOL>} willDictateKey Type: <b>BOOL*</b>
     * 
     * True if the TIA will dictate the keys; otherwise, false.
     * @param {Pointer<Integer>} weight Type: <b>UINT32*</b>
     * 
     * Specifies the weight that this TIA should be given compared to any peers.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ikeTraffic, willDictateKey, weight) {
        willDictateKeyMarshal := willDictateKey is VarRef ? "int*" : "ptr"
        weightMarshal := weight is VarRef ? "uint*" : "ptr"

        DllCall(this.value, IKEEXT_TRAFFIC0.Ptr, ikeTraffic, willDictateKeyMarshal, willDictateKey, weightMarshal, weight)
    }

    /**
     * A IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 {
        /**
         * Creates a IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 pointer that invokes the given AHK function when called.
         * @param {Func(IKEEXT_TRAFFIC0, BOOL, "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IKEEXT_TRAFFIC0.Ptr, BOOL.Ptr, "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
