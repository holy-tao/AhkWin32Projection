#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Receives messages or notifications intended for the default dialog box procedure of the Color dialog box. This is an application-defined or library-defined callback function that is used with the ChooseColor function.
 * @remarks
 * When you use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646912(v=vs.85)">ChooseColor</a> function to create a <b>Color</b> dialog box, you can provide a <i>CCHookProc</i> hook procedure to process messages or notifications intended for the dialog box procedure. To enable the hook procedure, use the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-choosecolora-r1">CHOOSECOLOR</a> structure that you passed to the dialog creation function. Specify the address of the hook procedure in the  <b>lpfnHook</b> member and specify the <b>CC_ENABLEHOOK</b> flag in the  <b>Flags</b> member.
 * 
 * The default dialog box procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message before passing it to the hook procedure. For all other messages, the hook procedure receives the message first. Then, the return value of the hook procedure determines whether the default dialog procedure processes the message or ignores it.
 * 
 * If the hook procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-ctlcolordlg">WM_CTLCOLORDLG</a> message, it must return a valid brush handle to painting the background of the dialog box. In general, if the hook procedure processes any <b>WM_CTLCOLOR*</b> message, it must return a valid brush handle to painting the background of the specified control.
 * 
 * Do not call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enddialog">EndDialog</a> function from the hook procedure. Instead, the hook procedure can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a> function to post a  <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message with the <b>IDABORT</b> value to the dialog box procedure. Posting <b>IDABORT</b> closes the dialog box and causes the dialog box function to return <b>FALSE</b>. If you need to know why the hook procedure closed the dialog box, you must provide your own communication mechanism between the hook procedure and your application.
 * 
 * You can subclass the standard controls of a common dialog box. However, the dialog box procedure may also subclass the controls. Because of this, you should subclass controls when your hook procedure processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. This ensures that your subclass procedure receives the control-specific messages before the subclass procedure set by the dialog box procedure.
 * @see https://learn.microsoft.com/windows/win32/api//content/commdlg/nc-commdlg-lpcchookproc
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class LPCCHOOKPROC extends IUnknown {

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
