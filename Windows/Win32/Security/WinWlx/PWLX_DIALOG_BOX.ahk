#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Called by the GINA to create a modal dialog box from a dialog box template.
 * @remarks
 * GINA must use the Winlogon <b>WlxDialogBox</b> function, not the Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxa">DialogBox</a> macro. <b>WlxDialogBox</b> duplicates the Windows <b>DialogBox</b> macro, and also allows Winlogon to terminate the dialog box. For more information, see 
 * <b>DialogBox</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_dialog_box
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_DIALOG_BOX {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_DIALOG_BOX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Specifies the Winlogon handle passed to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {HANDLE} hInst Specifies an instance of the module whose executable file contains the dialog box template.
     * @param {PWSTR} lpszTemplate Specifies the dialog box template. This parameter is either the address of a null-terminated character string that specifies the name of the dialog box template, or an integer value that specifies the resource identifier of the dialog box template. If the parameter specifies a resource identifier, its high-order word must be zero and its low-order word must contain the identifier. You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro to create this value.
     * @param {HWND} hwndOwner Specifies the window that owns the dialog box.
     * @param {Pointer<DLGPROC>} dlgprc Points to the dialog box procedure. For more information about the dialog box procedure, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-dlgproc">DialogProc</a> callback function.
     * @returns {Integer} If the <b>WlxDialogBox</b> function succeeds, the return value is the <i>nResult</i> parameter given in the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enddialog">EndDialog</a> function used to terminate the dialog box. The following table lists some possible success return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WLX_DLG_INPUT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WLX_DLG_SAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">secure attention sequence</a> (SAS) event occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WLX_DLG_SCREEN_SAVER_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The screen saver timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WLX_DLG_USER_LOGOFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user logged off.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is –1.
     */
    Call(hWlx, hInst, lpszTemplate, hwndOwner, dlgprc) {
        lpszTemplate := lpszTemplate is String ? StrPtr(lpszTemplate) : lpszTemplate

        result := DllCall(this.value, HANDLE, hWlx, HANDLE, hInst, "ptr", lpszTemplate, HWND, hwndOwner, "ptr", dlgprc, Int32)
        return result
    }

    /**
     * A PWLX_DIALOG_BOX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_DIALOG_BOX {
        /**
         * Creates a PWLX_DIALOG_BOX pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, PWSTR, HWND, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, PWSTR, HWND, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
