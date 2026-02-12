#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/commdlg/nc-commdlg-lpofnhookproc
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class LPOFNHOOKPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @param {WPARAM} param2 
     * @param {LPARAM} param3 
     * @returns {Pointer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "ptr")
        return result
    }
}
