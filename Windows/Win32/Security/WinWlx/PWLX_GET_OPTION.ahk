#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Called by GINA to retrieve the current value of an option.
 * @remarks
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_get_option
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_GET_OPTION {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_GET_OPTION) {
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
     * @param {Pointer<Pointer>} Value Returns the current value of the option.
     * @returns {BOOL} The <b>WlxGetOption</b> function returns one of the following values.
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
     * The value of the option was returned in the <i>Value</i> parameter.
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
     * Winlogon did not return the value.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, Option, Value) {
        ValueMarshal := Value is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hWlx, UInt32, Option, ValueMarshal, Value, BOOL)
        return result
    }

    /**
     * A PWLX_GET_OPTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_GET_OPTION {
        /**
         * Creates a PWLX_GET_OPTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
