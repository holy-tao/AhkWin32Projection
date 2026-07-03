#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Allows the GINA DLL switch to the Winlogon desktop.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_switch_desktop_to_winlogon
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_SWITCH_DESKTOP_TO_WINLOGON {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_SWITCH_DESKTOP_TO_WINLOGON) {
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
     * @returns {Integer} The <b>WlxSwitchDesktopToWinlogon</b> function returns zero if the function call succeeds. Otherwise, it returns an error code.
     */
    Call(hWlx) {
        result := DllCall(this.value, HANDLE, hWlx, Int32)
        return result
    }

    /**
     * A PWLX_SWITCH_DESKTOP_TO_WINLOGON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_SWITCH_DESKTOP_TO_WINLOGON {
        /**
         * Creates a PWLX_SWITCH_DESKTOP_TO_WINLOGON pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
