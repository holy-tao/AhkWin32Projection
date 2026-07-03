#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Called by GINA to set the value of an option.
 * @remarks
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * 
 * Use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_get_option">WlxGetOption</a> to retrieve the current value of an option.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_set_option
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SET_OPTION {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SET_OPTION) {
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
     * @param {Integer} Option Specifies one of the following options:
     * @param {Pointer} Value Specifies a new value for the option.
     * @param {Pointer<Pointer>} OldValue On return, pointer to the old value the option was set to.
     * @returns {BOOL} The <b>WlxSetOption</b> function returns one of the following values.
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
     * The option was set to the value specified in the <i>Value</i> parameter.
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
     * Winlogon did not set <i>Option</i> to <i>Value</i>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, Option, Value, OldValue) {
        OldValueMarshal := OldValue is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hWlx, UInt32, Option, IntPtr, Value, OldValueMarshal, OldValue, BOOL)
        return result
    }

    /**
     * A PWLX_SET_OPTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SET_OPTION {
        /**
         * Creates a PWLX_SET_OPTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, IntPtr, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, IntPtr, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
