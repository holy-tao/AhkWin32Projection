#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Application-defined callback function used with the CreateDialog and DialogBox families of functions.
 * @remarks
 * You should use the dialog box procedure only if you use the dialog box class for the dialog box. This is the default class and is used when no explicit class is specified in the dialog box template. Although the dialog box procedure is similar to a window procedure, it must not call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a> function to process unwanted messages. Unwanted messages are processed internally by the dialog box window procedure.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-dlgproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DLGPROC {
    value : IntPtr

    __value {
        set {
            if (value is DLGPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 Type: <b>HWND</b>
     * 
     * A handle to the dialog box.
     * @param {Integer} param1 Type: <b>UINT</b>
     * 
     * The message.
     * @param {WPARAM} param2 Type: <b>WPARAM</b>
     * 
     * Additional message-specific information.
     * @param {LPARAM} param3 Type: <b>LPARAM</b>
     * 
     * Additional message-specific information. 
     * 
     * 
     * 
     * Type: <b>INT_PTR</b>
     * 
     * Typically, the dialog box procedure should return <b>TRUE</b> if it processed the message, and <b>FALSE</b> if it did not. If the dialog box procedure returns <b>FALSE</b>, the dialog manager performs the default dialog operation in response to the message.
     * 
     * If the dialog box procedure processes a message that requires a specific return value, the dialog box procedure should set the desired return value by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a>(<i>hwndDlg</i>, <b>DWL_MSGRESULT</b>, <i>lResult</i>) immediately before returning <b>TRUE</b>. Note that you must call <b>SetWindowLong</b> immediately before returning <b>TRUE</b>; doing so earlier may result in the <b>DWL_MSGRESULT</b> value being overwritten by a nested dialog box message.
     * 
     * The following messages are exceptions to the general rules stated above. Consult the documentation for the specific message for details on the semantics of the return value.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-chartoitem">WM_CHARTOITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-compareitem">WM_COMPAREITEM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-ctlcolorbtn">WM_CTLCOLORBTN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-ctlcolordlg">WM_CTLCOLORDLG</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-ctlcoloredit">WM_CTLCOLOREDIT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-ctlcolorlistbox">WM_CTLCOLORLISTBOX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-ctlcolorscrollbar">WM_CTLCOLORSCROLLBAR</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-ctlcolorstatic">WM_CTLCOLORSTATIC</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-querydragicon">WM_QUERYDRAGICON</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-vkeytoitem">WM_VKEYTOITEM</a>
     * </li>
     * </ul>
     * @returns {Pointer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, IntPtr)
        return result
    }

    /**
     * A DLGPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DLGPROC {
        /**
         * Creates a DLGPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
