#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * An application-defined or library-defined callback function used with the PrintDlg function. The hook procedure receives messages or notifications intended for the default dialog box procedure of the Print Setup dialog box.
 * @remarks
 * The <b>Print Setup</b> dialog box has been superseded by the <b>Page Setup</b> dialog box, which should be used by new applications. However, for compatibility, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function continues to support display of the <b>Print Setup</b> dialog box. You can provide a <i>SetupHookProc</i> hook procedure for the <b>Print Setup</b> dialog box to process messages or notifications intended for the dialog box procedure.
 * 
 * To enable the hook procedure, use the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printdlga">PRINTDLG</a> structure that you passed to the dialog creation function. Specify the address of the hook procedure in the  <b>lpfnSetupHook</b> member and specify the <b>PD_ENABLESETUPHOOK</b> flag in the  <b>Flags</b> member.
 * 
 * The default dialog box procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message before passing it to the hook procedure. For all other messages, the hook procedure receives the message first. Then, the return value of the hook procedure determines whether the default dialog procedure processes the message or ignores it.
 * 
 * If the hook procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-ctlcolordlg">WM_CTLCOLORDLG</a> message, it must return a valid brush handle to painting the background of the dialog box. In general, if the hook procedure processes any <b>WM_CTLCOLOR*</b> message, it must return a valid brush handle to painting the background of the specified control.
 * 
 * Do not call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enddialog">EndDialog</a> function from the hook procedure. Instead, the hook procedure can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a> function to post a  <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message with the <b>IDABORT</b> value to the dialog box procedure. Posting <b>IDABORT</b> closes the dialog box and causes the dialog box function to return <b>FALSE</b>. If you need to know why the hook procedure closed the dialog box, you must provide your own communication mechanism between the hook procedure and your application.
 * 
 * You can subclass the standard controls of a common dialog box. However, the dialog box procedure may also subclass the controls. Because of this, you should subclass controls when your hook procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. This ensures that your subclass procedure receives the control-specific messages before the subclass procedure set by the dialog box procedure.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-lpsetuphookproc
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct LPSETUPHOOKPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPSETUPHOOKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 A handle to the <b>Print Setup</b> dialog box for which the message is intended.
     * @param {Integer} param1 The identifier of the message being received.
     * @param {WPARAM} param2 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter.
     * @param {LPARAM} param3 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter.
     * @returns {Pointer} If the hook procedure returns zero, the default dialog box procedure processes the message.
     * 
     * If the hook procedure returns a nonzero value, the default dialog box procedure ignores the message.
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, IntPtr)
        return result
    }

    /**
     * A LPSETUPHOOKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPSETUPHOOKPROC {
        /**
         * Creates a LPSETUPHOOKPROC pointer that invokes the given AHK function when called.
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
