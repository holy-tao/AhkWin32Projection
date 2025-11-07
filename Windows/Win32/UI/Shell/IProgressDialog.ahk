#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide options for an application to display a progress dialog box.
 * @remarks
 * 
 * The progress dialog box object creates a modeless dialog box and allows the client to set its title, animation, text lines, and progress bar. The object then handles updating on a background thread and allows the user to cancel the operation. Optionally, it estimates the time remaining until the operation is complete and displays the information as a line of text.
 * 
 * Applications normally do not implement this interface. It is exported by the progress dialog box object for use by applications.
 * 
 * Use this interface when your application needs to display a progress dialog box. To initialize the object:
 * 
 * 				
 * 
 * <ol>
 * <li>Create an in-process progress dialog box object (CLSID_ProgressDialog) with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. Request a 
 * pointer to its <b>IProgressDialog</b> interface (IID_IProgressDialog).</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-settitle">IProgressDialog::SetTitle</a> to specify the dialog box title.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setanimation">IProgressDialog::SetAnimation</a> to specify an AVI clip to be played while the operation progresses.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setcancelmsg">IProgressDialog::SetCancelMsg</a> to specify the message that will be displayed if the user cancels the operation.</li>
 * </ol>
 * To display the progress of the operation:
 * 				
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-startprogressdialog">IProgressDialog::StartProgressDialog</a> to display the dialog box.</li>
 * <li>Assign a numerical value to the total amount of work the operation will perform. Use any number that allows you to conveniently define the progress of the operation. For example, set this value to 100 if you want to specify the progress of the operation in terms of the percent that has been completed.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-timer">IProgressDialog::Timer</a> to reset the timer. This method sets the starting point that the progress dialog object uses to estimate the time remaining in the operation. If you do not call this method, the starting point will be the call to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-startprogressdialog">StartProgressDialog</a>.</li>
 * <li>As the operation progresses, periodically call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress">IProgressDialog::SetProgress</a> to update the dialog box as to how much of the operation has been completed. The progress dialog object will update its progress bar and recalculate its estimate of the remaining time. You can use any numerical measure of progress that is convenient. However, if you want to use values larger than 4 gigabytes (GB), you must call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress64">IProgressDialog::SetProgress64</a> instead of <b>IProgressDialog::SetProgress</b>.</li>
 * <li>Your application does not receive a notification if the user clicks the <b>Cancel</b> button to cancel the operation. As the operation progresses, periodically call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-hasusercancelled">IProgressDialog::HasUserCancelled</a> to see if the user has clicked the <b>Cancel</b> button. Applications typically call this method each time they call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress">IProgressDialog::SetProgress</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress64">IProgressDialog::SetProgress64</a>.</li>
 * <li>The dialog box displays three lines of text. An application can periodically call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-setline">IProgressDialog::SetLine</a> to display a message on one of these lines. This method is normally used to provide information on the current status of the operation. A typical message is something like: "Currently processing item XXX...". Messages are typically displayed on lines 1 and 2. You can display messages on line 3 only if you have not instructed the progress dialog object to estimate the remaining time by setting the <b>PROGDLG_AUTOTIME</b> flag in the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-startprogressdialog">IProgressDialog::StartProgressDialog</a>. In that case, the third text line is used to display the estimated time.</li>
 * </ol>
 * When the operation is complete:
 * 				
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iprogressdialog-stopprogressdialog">IProgressDialog::StopProgressDialog</a> to close the dialog box.</li>
 * <li>Release the progress dialog box object.</li>
 * </ol>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iprogressdialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IProgressDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressDialog
     * @type {Guid}
     */
    static IID => Guid("{ebbc7c04-315e-11d2-b62f-006097df5bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProgressDialog", "StopProgressDialog", "SetTitle", "SetAnimation", "HasUserCancelled", "SetProgress", "SetProgress64", "SetLine", "SetCancelMsg", "Timer"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {IUnknown} punkEnableModless 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-startprogressdialog
     */
    StartProgressDialog(hwndParent, punkEnableModless, dwFlags) {
        static pvResevered := 0 ;Reserved parameters must always be NULL

        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", punkEnableModless, "uint", dwFlags, "ptr", pvResevered, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-stopprogressdialog
     */
    StopProgressDialog() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-settitle
     */
    SetTitle(pwzTitle) {
        pwzTitle := pwzTitle is String ? StrPtr(pwzTitle) : pwzTitle

        result := ComCall(5, this, "ptr", pwzTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HINSTANCE} hInstAnimation 
     * @param {Integer} idAnimation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-setanimation
     */
    SetAnimation(hInstAnimation, idAnimation) {
        hInstAnimation := hInstAnimation is Win32Handle ? NumGet(hInstAnimation, "ptr") : hInstAnimation

        result := ComCall(6, this, "ptr", hInstAnimation, "uint", idAnimation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-hasusercancelled
     */
    HasUserCancelled() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwCompleted 
     * @param {Integer} dwTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress
     */
    SetProgress(dwCompleted, dwTotal) {
        result := ComCall(8, this, "uint", dwCompleted, "uint", dwTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCompleted 
     * @param {Integer} ullTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-setprogress64
     */
    SetProgress64(ullCompleted, ullTotal) {
        result := ComCall(9, this, "uint", ullCompleted, "uint", ullTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLineNum 
     * @param {PWSTR} pwzString 
     * @param {BOOL} fCompactPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-setline
     */
    SetLine(dwLineNum, pwzString, fCompactPath) {
        static pvResevered := 0 ;Reserved parameters must always be NULL

        pwzString := pwzString is String ? StrPtr(pwzString) : pwzString

        result := ComCall(10, this, "uint", dwLineNum, "ptr", pwzString, "int", fCompactPath, "ptr", pvResevered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzCancelMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-setcancelmsg
     */
    SetCancelMsg(pwzCancelMsg) {
        static pvResevered := 0 ;Reserved parameters must always be NULL

        pwzCancelMsg := pwzCancelMsg is String ? StrPtr(pwzCancelMsg) : pwzCancelMsg

        result := ComCall(11, this, "ptr", pwzCancelMsg, "ptr", pvResevered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimerAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iprogressdialog-timer
     */
    Timer(dwTimerAction) {
        static pvResevered := 0 ;Reserved parameters must always be NULL

        result := ComCall(12, this, "uint", dwTimerAction, "ptr", pvResevered, "HRESULT")
        return result
    }
}
