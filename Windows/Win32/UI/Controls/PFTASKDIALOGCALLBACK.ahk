#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The TaskDialogCallbackProc function is an application-defined function used with the TaskDialogIndirect function.
 * @remarks
 * An application must register this callback function by passing its address in the <b>pfCallback</b> member of  the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialogconfig">TASKDIALOGCONFIG</a> structure that is passed via pointer through <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-taskdialogindirect">TaskDialogIndirect</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/commctrl/nc-commctrl-pftaskdialogcallback
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PFTASKDIALOGCALLBACK extends IUnknown {

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
     * @param {HWND} hwnd_ 
     * @param {Integer} msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @param {Pointer} lpRefData 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwnd_, msg_, wParam_, lParam_, lpRefData) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", hwnd_, "uint", msg_, "ptr", wParam_, "ptr", lParam_, "ptr", lpRefData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
