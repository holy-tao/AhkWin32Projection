#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RADIUS_ACTION.ahk" { RADIUS_ACTION }
#Import ".\RADIUS_ATTRIBUTE.ahk" { RADIUS_ATTRIBUTE }

/**
 * The RadiusExtensionProcessEx function is an application-defined function and is called by NPS for each authentication or accounting packet that NPS receives from the network access server (NAS).
 * @remarks
 * If the return value is anything other than <b>NO_ERROR</b>, NPS discards the request.
 * 
 * NPS supports multiple Extension DLLs. NPS calls 
 * <i>RadiusExtensionProcessEx</i> for each of the DLLs listed in the registry. For more information see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-setting-up-the-extension-and-authorization-dlls">Setting Up the Extension DLLs</a>.
 * 
 * NPS calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_free_attributes">RadiusExtensionFreeAttributes</a> to free the memory occupied by the array of attributes returned by 
 * <i>RadiusExtensionProcessEx</i>. For this reason, if you implement 
 * <i>RadiusExtensionProcessEx</i>, you must also implement 
 * <b>RadiusExtensionFreeAttributes</b>.
 * 
 * For more information on the use of this function, see <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-authentication-and-authorization-process">NPS Extensions Process</a>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_process_ex
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_PROCESS_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_PROCESS_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RADIUS_ATTRIBUTE>} pInAttrs Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">attributes</a> from the request. The array is terminated by an attribute with <b>dwAttrType</b> set to <b>ratMinimum</b>. These attributes should be treated as read-only; they should not be modified by 
     * <i>RadiusExtensionProcessEx</i>. Also, these attributes should not be referenced in any way after 
     * <i>RadiusExtensionProcessEx</i> returns.
     * @param {Pointer<Pointer<RADIUS_ATTRIBUTE>>} pOutAttrs Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute">attributes</a> provided by the NPS Extension DLL. The array is terminated by an attribute with <b>dwAttrType</b> set to <b>ratMinimum</b>. NPS  adds these attributes to the authentication response.
     * 
     * The NPS Extension DLL allocates the memory for the array of attributes. NPS calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_free_attributes">RadiusExtensionFreeAttributes</a> to free the memory occupied by the array of attributes.
     * @param {Pointer<RADIUS_ACTION>} pfAction Pointer to a value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_action">RADIUS_ACTION</a>, initially set to <b>raContinue</b>. This parameter specifies the action that NPS should take in response to an Access-Request.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value should be an appropriate error code from WinError.h.
     */
    Call(pInAttrs, pOutAttrs, pfAction) {
        pOutAttrsMarshal := pOutAttrs is VarRef ? "ptr*" : "ptr"
        pfActionMarshal := pfAction is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, RADIUS_ATTRIBUTE.Ptr, pInAttrs, pOutAttrsMarshal, pOutAttrs, pfActionMarshal, pfAction, UInt32)
        return result
    }

    /**
     * A PRADIUS_EXTENSION_PROCESS_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_PROCESS_EX {
        /**
         * Creates a PRADIUS_EXTENSION_PROCESS_EX pointer that invokes the given AHK function when called.
         * @param {Func(RADIUS_ATTRIBUTE, "ptr*", "int*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RADIUS_ATTRIBUTE.Ptr, "ptr*", "int*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
