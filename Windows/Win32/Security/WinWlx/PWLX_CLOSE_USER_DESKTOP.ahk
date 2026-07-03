#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WLX_DESKTOP.ahk" { WLX_DESKTOP }

/**
 * Called by GINA to close an alternate user desktop and clean up after the desktop is closed.
 * @remarks
 * In addition to closing the desktop, this function will modify access to the parent window station to remove <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ACEs</a> added during the creation of the user desktop.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_close_user_desktop
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_CLOSE_USER_DESKTOP {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_CLOSE_USER_DESKTOP) {
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
     * @param {Pointer<WLX_DESKTOP>} pDesktop Specifies a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_desktop">WLX_DESKTOP</a> structure, obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_create_user_desktop">WlxCreateUserDesktop</a> function.
     * @param {HANDLE} hToken Specifies the handle to the token of the user whose desktop is to be closed.
     * @returns {BOOL} If the function successfully closes the desktop, the return value is <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     */
    Call(hWlx, pDesktop, hToken) {
        result := DllCall(this.value, HANDLE, hWlx, WLX_DESKTOP.Ptr, pDesktop, HANDLE, hToken, BOOL)
        return result
    }

    /**
     * A PWLX_CLOSE_USER_DESKTOP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_CLOSE_USER_DESKTOP {
        /**
         * Creates a PWLX_CLOSE_USER_DESKTOP pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, WLX_DESKTOP, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, WLX_DESKTOP.Ptr, HANDLE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
