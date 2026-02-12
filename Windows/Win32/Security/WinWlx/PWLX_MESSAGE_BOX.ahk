#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to create, display, and operate a message box.
 * @remarks
 * The <b>WlxMessageBox</b> function does not handle <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">SAS</a> events, and is not suitable for security dialog boxes. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box">WlxDialogBox</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect">WlxDialogBoxIndirect</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect_param">WlxDialogBoxIndirectParam</a> function for security dialog boxes.
 * 
 * <b>WlxMessageBox</b> duplicates the Windows 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function, with the exception that this function also allows Winlogon to time out the dialog box. For more information, see 
 * <b>MessageBox</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_message_box
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_MESSAGE_BOX extends IUnknown {

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
     * @param {HANDLE} hWlx 
     * @param {HWND} hwndOwner 
     * @param {PWSTR} lpszText 
     * @param {PWSTR} lpszTitle 
     * @param {Integer} fuStyle 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, hwndOwner, lpszText, lpszTitle, fuStyle) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        lpszText := lpszText is String ? StrPtr(lpszText) : lpszText
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := ComCall(3, this, "ptr", hWlx, "ptr", hwndOwner, "ptr", lpszText, "ptr", lpszTitle, "uint", fuStyle, "int")
        return result
    }
}
