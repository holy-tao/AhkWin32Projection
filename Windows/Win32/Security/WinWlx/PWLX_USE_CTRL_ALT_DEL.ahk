#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by GINA to tell Winlogon to use the standard CTRL+ALT+DEL key combination as a secure attention sequence (SAS).
 * @remarks
 * If GINA uses this function, it is not required to use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> function. However, if GINA is monitoring for other SASs in addition to CTRL+ALT+DEL, it must use <b>WlxSasNotify</b> to deliver the additional SAS event notifications.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_use_ctrl_alt_del
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_USE_CTRL_ALT_DEL {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_USE_CTRL_ALT_DEL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx [in] Winlogon handle provided to GINA in the <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hWlx) {
        DllCall(this.value, HANDLE, hWlx)
    }

    /**
     * A PWLX_USE_CTRL_ALT_DEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_USE_CTRL_ALT_DEL {
        /**
         * Creates a PWLX_USE_CTRL_ALT_DEL pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
