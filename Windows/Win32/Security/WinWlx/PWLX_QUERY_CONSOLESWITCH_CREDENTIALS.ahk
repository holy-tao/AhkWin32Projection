#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0.ahk" { WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0 }

/**
 * Called by GINA to read the credentials transferred from the Winlogon of the temporary session to the Winlogon of the destination session.
 * @remarks
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_4">WLX_DISPATCH_VERSION_1_4</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_query_consoleswitch_credentials
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_QUERY_CONSOLESWITCH_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_QUERY_CONSOLESWITCH_CREDENTIALS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0>} pCred Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_consoleswitch_credentials_info_v1_0">WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0</a> structure to be filled with credentials information.
     * @returns {Integer} Returns <b>TRUE</b> if credentials were transferred and <b>FALSE</b> if the transfer failed.
     */
    Call(pCred) {
        result := DllCall(this.value, WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0.Ptr, pCred, UInt32)
        return result
    }

    /**
     * A PWLX_QUERY_CONSOLESWITCH_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_QUERY_CONSOLESWITCH_CREDENTIALS {
        /**
         * Creates a PWLX_QUERY_CONSOLESWITCH_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func(WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WLX_CONSOLESWITCH_CREDENTIALS_INFO_V1_0.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
