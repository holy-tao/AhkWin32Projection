#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable an application to receive notifications and messages from the PrintDlgEx function while the Print Property Sheet is displayed.
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/nn-commdlg-iprintdialogcallback
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
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> to prevent the <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function from performing its default actions.
     * 
     * Return <b>S_FALSE</b> to allow <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default actions. Currently, <b>PrintDlgEx</b> does not perform any default processing after the <b>InitDone</b> call.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogcallback-initdone
     */
    InitDone() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Called by PrintDlgEx when the user selects a different printer from the list of installed printers on the General page of the Print Property Sheet.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> to prevent the <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function from performing its default actions.
     * 
     * Return <b>S_FALSE</b> to allow <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default actions, which include adjustments to the <b>Copies</b>, <b>Collate</b>, and <b>Print Range</b> items.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogcallback-selectionchange
     */
    SelectionChange() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called by PrintDlgEx to give your application an opportunity to handle messages sent to the child dialog box in the lower portion of the General page of the Print Property Sheet.
     * @param {HWND} hDlg Type: <b>HWND</b>
     * 
     * A handle to the child dialog box in the lower portion of the <b>General</b> page.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The identifier of the message being received.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the <i>uMsg</i> parameter.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the <i>uMsg</i> parameter.
     * 
     * 					
     * 
     * If the <i>uMsg</i> parameter indicates the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message, <i>lParam</i> is a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printdlgexa">PRINTDLGEX</a> structure containing the values specified when the property sheet was created.
     * @param {Pointer<LRESULT>} pResult Type: <b>LRESULT*</b>
     * 
     * Indicates the result to be returned by the dialog box procedure for the message. The value pointed to should be <b>TRUE</b> if you process the message, otherwise it should be <b>FALSE</b> or whatever is an appropriate value according to the message type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return <b>S_OK</b> if your <b>IPrintDialogCallback::HandleMessage</b> implementation handled the message. In this case, the <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> function does not perform any default message handling.
     * 
     * Return <b>S_FALSE</b> if you want <a href="/previous-versions/windows/desktop/legacy/ms646942(v=vs.85)">PrintDlgEx</a> to perform its default message handling.
     * @see https://docs.microsoft.com/windows/win32/api//commdlg/nf-commdlg-iprintdialogcallback-handlemessage
     */
    HandleMessage(hDlg, uMsg, wParam, lParam, pResult) {
        hDlg := hDlg is Win32Handle ? NumGet(hDlg, "ptr") : hDlg

        pResultMarshal := pResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hDlg, "uint", uMsg, "ptr", wParam, "ptr", lParam, pResultMarshal, pResult, "HRESULT")
        return result
    }
}
