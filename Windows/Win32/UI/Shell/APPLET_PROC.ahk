#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * Serves as the entry point for a Control Panel application. This is a library-defined callback function.
 * @remarks
 * Implementers of Control Panel items must also implement this function. No default implementation is available.
 * @see https://learn.microsoft.com/windows/win32/api/cpl/nc-cpl-applet_proc
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPLET_PROC {
    value : IntPtr

    __value {
        set {
            if (value is APPLET_PROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndCpl Type: <b>HWND</b>
     * 
     * The identifier of the main window of the controlling application. Use the <i>hwndCPl</i> parameter for dialog boxes or other windows that require a handle to a parent window.
     * @param {Integer} _msg Type: <b>UINT</b>
     * 
     * The message being sent to the Control Panel application.
     * @param {LPARAM} lParam1 Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} lParam2 Type: <b>LPARAM</b>
     * 
     * Additional message-specific information.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * The return value depends on the message. 
     * 
     * For more information, see the descriptions of the individual <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc144185(v=vs.85)">Control Panel messages</a>.
     */
    Call(hwndCpl, _msg, lParam1, lParam2) {
        result := DllCall(this.value, HWND, hwndCpl, UInt32, _msg, LPARAM, lParam1, LPARAM, lParam2, Int32)
        return result
    }

    /**
     * A APPLET_PROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends APPLET_PROC {
        /**
         * Creates a APPLET_PROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, LPARAM, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, LPARAM, LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
