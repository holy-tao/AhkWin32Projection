#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WLX_DESKTOP.ahk" { WLX_DESKTOP }

/**
 * Called by GINA to specify the alternate application desktop that Winlogon will switch to when the current secure attention sequence (SAS) event processing function is complete.
 * @remarks
 * <b>WlxSetReturnDesktop</b> can be called only within 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedonsas">WlxLoggedOnSAS</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxwkstalockedsas">WlxWkstaLockedSAS</a> routines. Attempts to call this function at other times will fail.
 * 
 * If a handle to the desktop is provided, Winlogon will duplicate the handle. If no handle is provided, Winlogon will attempt to open the desktop named in the <i>pDesktop</i> parameter. If the provided desktop is not valid or is the Winlogon or screen saver desktop, the call will fail.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_set_return_desktop
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SET_RETURN_DESKTOP {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SET_RETURN_DESKTOP) {
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
     * @param {Pointer<WLX_DESKTOP>} pDesktop Pointer to desktop information about the alternate desktop. This desktop is created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_create_user_desktop">WlxCreateUserDesktop</a> function.
     * @returns {BOOL} The <b>WlxSetReturnDesktop</b> function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function call was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function call failed to set the return desktop.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, pDesktop) {
        result := DllCall(this.value, HANDLE, hWlx, WLX_DESKTOP.Ptr, pDesktop, BOOL)
        return result
    }

    /**
     * A PWLX_SET_RETURN_DESKTOP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SET_RETURN_DESKTOP {
        /**
         * Creates a PWLX_SET_RETURN_DESKTOP pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, WLX_DESKTOP) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, WLX_DESKTOP.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
