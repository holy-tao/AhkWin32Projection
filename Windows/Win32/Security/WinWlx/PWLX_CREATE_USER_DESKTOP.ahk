#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLX_DESKTOP.ahk" { WLX_DESKTOP }

/**
 * Called by GINA to create alternate application desktops for the user.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_create_user_desktop
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_CREATE_USER_DESKTOP {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_CREATE_USER_DESKTOP) {
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
     * @param {HANDLE} hToken Specifies the handle to the token of the user for whom the desktop is being created.
     * @param {Integer} Flags Specifies access to the desktop. Specify one of the following. 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLX_CREATE_INSTANCE_ONLY"></a><a id="wlx_create_instance_only"></a><dl>
     * <dt><b>WLX_CREATE_INSTANCE_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that only this instance of the user has access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLX_CREATE_USER"></a><a id="wlx_create_user"></a><dl>
     * <dt><b>WLX_CREATE_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that any instance of this user has access.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pszDesktopName Specifies the name of the desktop to be created.
     * @param {Pointer<Pointer<WLX_DESKTOP>>} ppDesktop If the desktop is created, returns a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_desktop">WLX_DESKTOP</a> structure for the new desktop. This pointer can be used in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_set_return_desktop">WlxSetReturnDesktop</a> to make this the current desktop after a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">SAS</a> event is processed.
     * @returns {BOOL} The <b>WlxCreateUserDesktop</b> function returns one of the following values.
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
     * The desktop has been created.
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
     * The desktop has not been created.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, hToken, Flags, pszDesktopName, ppDesktop) {
        pszDesktopName := pszDesktopName is String ? StrPtr(pszDesktopName) : pszDesktopName

        ppDesktopMarshal := ppDesktop is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, hWlx, HANDLE, hToken, UInt32, Flags, "ptr", pszDesktopName, ppDesktopMarshal, ppDesktop, BOOL)
        return result
    }

    /**
     * A PWLX_CREATE_USER_DESKTOP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_CREATE_USER_DESKTOP {
        /**
         * Creates a PWLX_CREATE_USER_DESKTOP pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, PWSTR, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, PWSTR, "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
