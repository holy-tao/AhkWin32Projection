#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RADIUS_ATTRIBUTE.ahk" { RADIUS_ATTRIBUTE }
#Import ".\RADIUS_ACTION.ahk" { RADIUS_ACTION }

/**
 * The RadiusExtensionProcess function is an application-defined function and is called by NPS for each authentication or accounting packet that NPS receives from the network access server (NAS).
 * @remarks
 * If the return value is anything other than <b>NO_ERROR</b>, NPS discards the request.
 * 
 * NPS supports multiple Extension DLLs. NPS calls 
 * <b>RadiusExtensionProcess</b> for each of the DLLs listed in the registry. For more information see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-setting-up-the-extension-and-authorization-dlls">Setting Up the Extension DLLs</a>.
 * 
 * The Extension DLL may export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a> instead of 
 * <b>RadiusExtensionProcess</b>. The Extension DLL may export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a>.
 * 
 * For more information on the use of this function, see <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-authentication-and-authorization-process">NPS Extensions Process</a>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_process
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_PROCESS {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_PROCESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RADIUS_ATTRIBUTE>} pAttrs Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">attributes</a> from the request. The array is terminated by an attribute with <b>dwAttrType</b> set to <b>ratMinimum</b>. These attributes should be treated as read-only; they should not be modified by 
     * <b>RadiusExtensionProcess</b>. Also, these attributes should not be referenced in any way after 
     * <b>RadiusExtensionProcess</b> returns.
     * @param {Pointer<RADIUS_ACTION>} pfAction Pointer to a value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_action">RADIUS_ACTION</a>, initially set to <b>raContinue</b>. This parameter specifies the action that NPS should take in response to an Access-Request.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value should be an appropriate error code from Winerror.h.
     */
    Call(pAttrs, pfAction) {
        pfActionMarshal := pfAction is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, RADIUS_ATTRIBUTE.Ptr, pAttrs, pfActionMarshal, pfAction, UInt32)
        return result
    }

    /**
     * A PRADIUS_EXTENSION_PROCESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_PROCESS {
        /**
         * Creates a PRADIUS_EXTENSION_PROCESS pointer that invokes the given AHK function when called.
         * @param {Func(RADIUS_ATTRIBUTE, "int*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RADIUS_ATTRIBUTE.Ptr, "int*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
