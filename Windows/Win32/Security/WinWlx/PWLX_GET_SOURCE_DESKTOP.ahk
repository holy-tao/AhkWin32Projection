#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WLX_DESKTOP.ahk" { WLX_DESKTOP }

/**
 * Called by GINA to determine the name and handle of the desktop that was current before Winlogon switched to the Winlogon desktop.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_get_source_desktop
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_GET_SOURCE_DESKTOP {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_GET_SOURCE_DESKTOP) {
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
     * @param {Pointer<Pointer<WLX_DESKTOP>>} ppDesktop Receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_desktop">WLX_DESKTOP</a> structure containing necessary information describing the desktop. This pointer can be freed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {BOOL} The <b>WlxGetSourceDesktop</b> function returns one of the following values.
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
     * The call succeeded.
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
     * The call failed.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, ppDesktop) {
        ppDesktopMarshal := ppDesktop is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hWlx, ppDesktopMarshal, ppDesktop, BOOL)
        return result
    }

    /**
     * A PWLX_GET_SOURCE_DESKTOP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_GET_SOURCE_DESKTOP {
        /**
         * Creates a PWLX_GET_SOURCE_DESKTOP pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
