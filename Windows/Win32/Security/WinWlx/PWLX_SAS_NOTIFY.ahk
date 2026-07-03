#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by GINA to notify Winlogon of a secure attention sequence (SAS) event.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_sas_notify
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SAS_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SAS_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the Winlogon handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {Integer} dwSasType Specifies the type of SAS that occurred. 
     * 
     * 
     * 
     * 
     * Values from zero to WLX_SAS_TYPE_MAX_MSFT_VALUE are reserved to define standard Microsoft SAS types. GINA developers can use values greater than WLX_SAS_TYPE_MAX_MSFT_VALUE to define additional SAS types.
     * 
     * The following values are predefined.
     * 
     * This value will be delivered to one of the GINA SAS service routines called by Winlogon (<a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedoutsas">WlxLoggedOutSAS</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedonsas">WlxLoggedOnSAS</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxwkstalockedsas">WlxWkstaLockedSAS</a>).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLX_SAS_TYPE_CTRL_ALT_DEL"></a><a id="wlx_sas_type_ctrl_alt_del"></a><dl>
     * <dt><b>WLX_SAS_TYPE_CTRL_ALT_DEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the user has typed the CTRL+ALT+DEL SAS.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hWlx, dwSasType) {
        DllCall(this.value, HANDLE, hWlx, UInt32, dwSasType)
    }

    /**
     * A PWLX_SAS_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SAS_NOTIFY {
        /**
         * Creates a PWLX_SAS_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
