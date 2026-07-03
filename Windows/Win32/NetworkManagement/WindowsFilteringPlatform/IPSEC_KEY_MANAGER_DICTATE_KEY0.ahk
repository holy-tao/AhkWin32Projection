#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPSEC_SA_DETAILS1.ahk" { IPSEC_SA_DETAILS1 }

/**
 * Used by the Trusted Intermediary Agent (TIA) to dictate keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister0</a> to invoke this function pointer. If the weight specified in <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0">IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0</a> for a TIA is higher than that of any peer, <b>IPSEC_KEY_MANAGER_DICTATE_KEY0</b> will be invoked.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEY_MANAGER_DICTATE_KEY0 {
    value : IntPtr

    __value {
        set {
            if (value is IPSEC_KEY_MANAGER_DICTATE_KEY0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IPSEC_SA_DETAILS1>} inboundSaDetails Type: [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1)*</b>
     * 
     * Information about the inbound SA.
     * @param {Pointer<IPSEC_SA_DETAILS1>} outboundSaDetails Type: [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1)*</b>
     * 
     * Information about the outbound SA.
     * @param {Pointer<BOOL>} keyingModuleGenKey Type: <b>BOOL*</b>
     * 
     * True if the keying module should randomly generate keys in the event that the TIA is unable to supply keys; otherwise, false.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The keys were successfully dictated
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FWP_E_* error code</b></dt>
     * <dt>0x80320001—0x80320039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_* error code</b></dt>
     * <dt>0x80010001—0x80010122</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure to communicate with the remote or local firewall engine.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(inboundSaDetails, outboundSaDetails, keyingModuleGenKey) {
        keyingModuleGenKeyMarshal := keyingModuleGenKey is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, IPSEC_SA_DETAILS1.Ptr, inboundSaDetails, IPSEC_SA_DETAILS1.Ptr, outboundSaDetails, keyingModuleGenKeyMarshal, keyingModuleGenKey, UInt32)
        return result
    }

    /**
     * A IPSEC_KEY_MANAGER_DICTATE_KEY0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IPSEC_KEY_MANAGER_DICTATE_KEY0 {
        /**
         * Creates a IPSEC_KEY_MANAGER_DICTATE_KEY0 pointer that invokes the given AHK function when called.
         * @param {Func(IPSEC_SA_DETAILS1, IPSEC_SA_DETAILS1, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IPSEC_SA_DETAILS1.Ptr, IPSEC_SA_DETAILS1.Ptr, BOOL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
