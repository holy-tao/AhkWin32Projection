#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable an application to receive notifications and messages from the PrintDlgEx function while the Print Property Sheet is displayed.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nn-commdlg-iprintdialogcallback
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class IPrintDialogCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDialogCallback
     * @type {Guid}
     */
    static IID => Guid("{5852a2c3-6530-11d1-b6a3-0000f8757bf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitDone", "SelectionChange", "HandleMessage"]

    /**
     * Called by PrintDlgEx when the system has finished initializing the General page of the Print Property Sheet.
     * @remarks
     * If your callback object implements the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iobjectwithsite">IObjectWithSite</a> interface, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">IObjectWithSite::SetSite</a> method to pass an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nn-commdlg-iprintdialogservices">IPrintDialogServices</a> pointer to the callback object. The <b>PrintDlgEx</b> function calls the <b>IObjectWithSite::SetSite</b> method before calling the <b>InitDone</b> method. This enables your <b>InitDone</b> implementation to use the <b>IPrintDialogServices</b> methods to retrieve information about the currently selected printer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> to prevent the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function from performing its default actions.
     * 
     * Return <b>S_FALSE</b> to allow <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default actions. Currently, <b>PrintDlgEx</b> does not perform any default processing after the <b>InitDone</b> call.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-initdone
     */
    InitDone() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Called by PrintDlgEx when the user selects a different printer from the list of installed printers on the General page of the Print Property Sheet.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> to prevent the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function from performing its default actions.
     * 
     * Return <b>S_FALSE</b> to allow <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default actions, which include adjustments to the <b>Copies</b>, <b>Collate</b>, and <b>Print Range</b> items.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-selectionchange
     */
    SelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called by PrintDlgEx to give your application an opportunity to handle messages sent to the child dialog box in the lower portion of the General page of the Print Property Sheet.
     * @remarks
     * For notification messages passed by the <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-notify">WM_NOTIFY</a> message, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowlonga">SetWindowLong</a> function with the <b>DWL_MSGRESULT</b> value to set a return value. When you call <b>SetWindowLong</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getparent">GetParent</a>(<i>hDlg</i>) to set the <b>DWL_MSGRESULT</b> value of the <b>General</b> page, which is the parent of the child window.
     * 
     * The default dialog box procedure for the child window in the lower portion of the <b>General</b> page processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message before passing it to the <b>HandleMessage</b> method. For all other messages sent to the child window, <b>HandleMessage</b> receives the message first. Then the <b>HandleMessage</b> return value determines whether the default dialog procedure processes the message or ignores it.
     * 
     * If <b>HandleMessage</b> processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-ctlcolordlg">WM_CTLCOLORDLG</a> message, it must return a valid brush handle to painting the background of the dialog box. In general, if <b>HandleMessage</b> processes any <b>WM_CTLCOLOR*</b> message, it must return a valid brush handle to painting the background of the specified control.
     * 
     * Do not call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enddialog">EndDialog</a> function from the <b>HandleMessage</b> method. Instead, <b>HandleMessage</b> can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a> function to post a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message with the IDABORT value to the dialog box procedure. Posting <b>IDABORT</b> closes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/print-property-sheet">Print Property Sheet</a> and causes <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to return <b>PD_RESULT_CANCEL</b> in the <b>dwResultAction</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printdlgexa">PRINTDLGEX</a> structure. If you need to know why <b>HandleMessage</b> closed the dialog box, you must provide your own communication mechanism between the <b>HandleMessage</b> method and your application.
     * 
     * You can subclass the standard controls of the child dialog box in the lower portion of the <b>General</b> page. These standard controls are similar to those found in the <b>Print</b> dialog box. However, the default dialog box procedure may also subclass the controls. Because of this, you should subclass controls when <b>HandleMessage</b> processes the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. This ensures that your subclass procedure receives control-specific messages before the subclass procedure set by the dialog box procedure.
     * @param {HWND} hDlg Type: <b>HWND</b>
     * 
     * A handle to the child dialog box in the lower portion of the <b>General</b> page.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The identifier of the message being received.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @param {Pointer<LRESULT>} pResult Type: <b>LRESULT*</b>
     * 
     * Indicates the result to be returned by the dialog box procedure for the message. The value pointed to should be <b>TRUE</b> if you process the message, otherwise it should be <b>FALSE</b> or whatever is an appropriate value according to the message type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> if your <b>IPrintDialogCallback::HandleMessage</b> implementation handled the message. In this case, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function does not perform any default message handling.
     * 
     * Return <b>S_FALSE</b> if you want <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default message handling.
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-iprintdialogcallback-handlemessage
     */
    HandleMessage(hDlg, uMsg, _wParam, _lParam, pResult) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        pResultMarshal := pResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hDlg, "uint", uMsg, "ptr", _wParam, "ptr", _lParam, pResultMarshal, pResult, "HRESULT")
        return result
    }
}
