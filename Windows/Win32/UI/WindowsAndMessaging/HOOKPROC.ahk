#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * An application-defined or library-defined callback function used with the SetWindowsHookEx function. The system calls this function after the SendMessage function is called. The hook procedure can examine the message; it cannot modify it.
 * @remarks
 * An application installs the hook procedure by specifying the <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-hooks">WH_CALLWNDPROCRET</a> hook type and a pointer to the hook procedure in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowshookexa">SetWindowsHookEx</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-hookproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct HOOKPROC {
    value : IntPtr

    __value {
        set {
            if (value is HOOKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} code 
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Specifies whether the message is sent by the current process. If the message is sent by the current process, it is nonzero; otherwise, it is <b>NULL</b>.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-cwpretstruct">CWPRETSTRUCT</a> structure that contains details about the message.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * If <i>nCode</i> is less than zero, the hook procedure must return the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-callnexthookex">CallNextHookEx</a>. 
     * 
     * If <i>nCode</i> is greater than or equal to zero, it is highly recommended that you call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-callnexthookex">CallNextHookEx</a> and return the value it returns; otherwise, other applications that have installed <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-hooks">WH_CALLWNDPROCRET</a> hooks will not receive hook notifications and may behave incorrectly as a result. If the hook procedure does not call <b>CallNextHookEx</b>, the return value should be zero.
     */
    Call(code, _wParam, _lParam) {
        result := DllCall(this.value, Int32, code, WPARAM, _wParam, LPARAM, _lParam, LRESULT)
        return result
    }

    /**
     * A HOOKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HOOKPROC {
        /**
         * Creates a HOOKPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32, WPARAM, LPARAM) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, WPARAM, LPARAM, LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
