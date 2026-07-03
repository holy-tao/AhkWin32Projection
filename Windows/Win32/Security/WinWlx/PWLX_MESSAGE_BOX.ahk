#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

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
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_message_box
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_MESSAGE_BOX {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_MESSAGE_BOX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a> handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {HWND} hwndOwner Specifies the owner window of the message box to be created. If this parameter is <b>NULL</b>, the message box has no owner window.
     * @param {PWSTR} lpszText Points to a null-terminated string that contains the message to be displayed.
     * @param {PWSTR} lpszTitle Points to a null-terminated string used for the dialog box title. If this parameter is <b>NULL</b>, the default title Error is used.
     * @param {Integer} fuStyle 
     * @returns {Integer} If the function fails, or if there is not enough memory to create the message box, the return value is zero.
     * 
     * If the function succeeds, the return value is one of the following menu item values returned by the dialog box.
     * 
     * <div class="alert"><b>Note</b>  If a message box has a <b>Cancel</b> button, the function returns the IDCANCEL value if either the <b>ESC</b> key is pressed or the <b>Cancel</b> button is clicked. If the message box has no <b>Cancel</b> button, pressing <b>ESC</b> has no effect.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Abort</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDCANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Cancel</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDIGNORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Ignore</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDNO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A  button was not selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>OK</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDRETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Retry</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDYES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Yes</b> button was selected.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(hWlx, hwndOwner, lpszText, lpszTitle, fuStyle) {
        lpszText := lpszText is String ? StrPtr(lpszText) : lpszText
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := DllCall(this.value, HANDLE, hWlx, HWND, hwndOwner, "ptr", lpszText, "ptr", lpszTitle, UInt32, fuStyle, Int32)
        return result
    }

    /**
     * A PWLX_MESSAGE_BOX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_MESSAGE_BOX {
        /**
         * Creates a PWLX_MESSAGE_BOX pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HWND, PWSTR, PWSTR, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HWND, PWSTR, PWSTR, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
