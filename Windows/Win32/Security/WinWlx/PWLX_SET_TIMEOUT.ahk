#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Called by GINA to change the time-out associated with a dialog box. The default time-out is two minutes.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_set_timeout
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SET_TIMEOUT {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SET_TIMEOUT) {
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
     * @param {Integer} Timeout Requested time-out, in seconds.
     * @returns {BOOL} The <b>WlxSetTimeout</b> function returns one of the following values.
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
     * The new time-out was accepted.
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
     * The new time-out was not accepted.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, Timeout) {
        result := DllCall(this.value, HANDLE, hWlx, UInt32, Timeout, BOOL)
        return result
    }

    /**
     * A PWLX_SET_TIMEOUT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SET_TIMEOUT {
        /**
         * Creates a PWLX_SET_TIMEOUT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
