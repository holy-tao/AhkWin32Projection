#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Receives notification messages sent from the dialog box.
 * @remarks
 * If you do not specify the <b>OFN_EXPLORER</b> flag when you create an <b>Open</b> or <b>Save As</b> dialog box, and you want a hook procedure, you must use an old-style <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure. In this case, the dialog box will have the old-style user interface.
 * 
 * When you use the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getopenfilenamea">GetOpenFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getsavefilenamea">GetSaveFileName</a> functions to create an Explorer-style <b>Open</b> or <b>Save As</b> dialog box, you can provide an <i>OFNHookProc</i> hook procedure. To enable the hook procedure, use the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure that you passed to the dialog creation function. Specify the pointer to the hook procedure in the  <b>lpfnHook</b> member and specify the <b>OFN_ENABLEHOOK</b> flag in the  <b>Flags</b> member.
 * 
 * If you provide a hook procedure for an Explorer-style common dialog box, the system creates a dialog box that is a child of the default dialog box. The hook procedure acts as the dialog procedure for the child dialog. This child dialog is based on the template you specified in the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure, or it is a default child dialog if no template is specified. The child dialog is created when the default dialog procedure is processing its <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. After the child dialog processes its own <b>WM_INITDIALOG</b> message, the default dialog procedure moves the standard controls, if necessary, to make room for any additional controls of the child dialog. The system then sends the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-initdone">CDN_INITDONE</a> notification message to the hook procedure.
 * 
 * The hook procedure does not receive messages intended for the standard controls of the default dialog box. You can subclass the standard controls, but this is discouraged because it may make your application incompatible with later versions. However, the Explorer-style common dialog boxes provide a set of messages that the hook procedure can use to monitor and control the dialog. These include a set of notification messages sent from the dialog, as well as messages that you can send to retrieve information from the dialog. For a complete list of these messages, see <a href="https://docs.microsoft.com/windows/desktop/dlgbox/open-and-save-as-dialog-boxes">Explorer-Style Hook Procedures</a>.
 * 
 * If the hook procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-ctlcolordlg">WM_CTLCOLORDLG</a> message, it must return a valid brush handle to painting the background of the dialog box. In general, if it processes any <b>WM_CTLCOLOR*</b> message, it must return a valid brush handle to painting the background of the specified control.
 * 
 * Do not call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enddialog">EndDialog</a> function from the hook procedure. Instead, the hook procedure can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a> function to post a  <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message with the <b>IDCANCEL</b> value to the dialog box procedure. Posting <b>IDCANCEL</b> closes the dialog box and causes the dialog box function to return <b>FALSE</b>. If you need to know why the hook procedure closed the dialog box, you must provide your own communication mechanism between the hook procedure and your application.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-lpofnhookproc
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct LPOFNHOOKPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPOFNHOOKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 A handle to the child dialog box of the <b>Open</b> or <b>Save As</b> dialog box. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getparent">GetParent</a> function to get the handle to the <b>Open</b> or <b>Save As</b> dialog box.
     * @param {Integer} param1 The identifier of the message being received.
     * @param {WPARAM} param2 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter.
     * @param {LPARAM} param3 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter. If the <i>unnamedParam2</i> parameter indicates the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message, <i>unnamedParam4</i> is a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure containing the values specified when the dialog box was created.
     * @returns {Pointer} If the hook procedure returns zero, the default dialog box procedure processes the message.
     * 
     * If the hook procedure returns a nonzero value, the default dialog box procedure ignores the message.
     * 
     * For the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-shareviolation">CDN_SHAREVIOLATION</a> and <a href="https://docs.microsoft.com/windows/desktop/dlgbox/cdn-fileok">CDN_FILEOK</a> notification messages, the hook procedure should return a nonzero value to indicate that it has used the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a> function to set a nonzero <b>DWL_MSGRESULT</b> value.
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, IntPtr)
        return result
    }

    /**
     * A LPOFNHOOKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOFNHOOKPROC {
        /**
         * Creates a LPOFNHOOKPROC pointer that invokes the given AHK function when called.
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
