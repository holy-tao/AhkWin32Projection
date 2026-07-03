#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RADIUS_EXTENSION_CONTROL_BLOCK.ahk" { RADIUS_EXTENSION_CONTROL_BLOCK }

/**
 * An application defined-function and is called by NPS for each authentication or accounting packet that NPS receives.
 * @remarks
 * If the return value is anything other than <b>NO_ERROR</b>, NPS discards the request.
 * 
 * The following attributes are read-only. Extension DLLs that implement <i>RadiusExtensionProcess2</i> cannot add, modify, or remove  these attributes within a request or response contained in a <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_extension_control_block">RADIUS_EXTENSION_CONTROL_BLOCK</a>.
 * 
 * <ul>
 * <li><b>ratCode</b></li>
 * <li><b>ratIdentifier</b></li>
 * <li><b>ratAuthenticator</b></li>
 * <li><b>ratSrcIPAddress</b></li>
 * <li><b>ratSrcPort</b></li>
 * <li><b>ratProvider</b></li>
 * <li><b>ratUniqueId</b></li>
 * <li><b>ratSrcIPv6Address</b></li>
 * </ul>
 * NPS supports multiple Extension DLLs. NPS calls 
 * <i>RadiusExtensionProcess2</i> for each of the DLLs listed in the registry. For more information see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-setting-up-the-extension-and-authorization-dlls">Setting Up the Extension  DLLs</a>.
 * 
 * NPS Extension DLLs that export 
 * <i>RadiusExtensionProcess2</i> do not need to export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_free_attributes">RadiusExtensionFreeAttributes</a>.
 * 
 * For more information on the use of this function, see <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-authentication-and-authorization-process">NPS Extensions Process</a>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_process_2
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_PROCESS_2 {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_PROCESS_2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RADIUS_EXTENSION_CONTROL_BLOCK>} pECB Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_extension_control_block">RADIUS_EXTENSION_CONTROL_BLOCK</a> structure. The members of this structure contain values and function pointers that enable the NPS Extension DLL to process the RADIUS packet.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value should be an appropriate error code from WinError.h.
     */
    Call(pECB) {
        result := DllCall(this.value, RADIUS_EXTENSION_CONTROL_BLOCK.Ptr, pECB, UInt32)
        return result
    }

    /**
     * A PRADIUS_EXTENSION_PROCESS_2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_PROCESS_2 {
        /**
         * Creates a PRADIUS_EXTENSION_PROCESS_2 pointer that invokes the given AHK function when called.
         * @param {Func(RADIUS_EXTENSION_CONTROL_BLOCK) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RADIUS_EXTENSION_CONTROL_BLOCK.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
