#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\UI\WindowsAndMessaging\DLGPROC.ahk" { DLGPROC }
#Import "..\..\UI\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }

/**
 * Called by GINA to create a modal dialog box from a dialog box template in memory.
 * @remarks
 * <b>WlxDialogBoxIndirect</b> duplicates the Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxindirecta">DialogBoxIndirect</a> macro, and also allows Winlogon to terminate the dialog box. For more information, see 
 * <b>DialogBoxIndirect</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_DIALOG_BOX_INDIRECT {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_DIALOG_BOX_INDIRECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hWlx Winlogon handle provided to GINA in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> call.
     * @param {HANDLE} hInst Identifies the instance of the module that creates the dialog box.
     * @param {Pointer<DLGTEMPLATE>} hDialogTemplate Specifies the address of a global memory object that contains a dialog box template used to create the dialog box. The template is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-dlgtemplate">DLGTEMPLATE</a> structure followed by one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-dlgitemtemplate">DLGITEMTEMPLATE</a> structures. For a full description of these structures, see the Platform SDK.
     * @param {HWND} hwndOwner Identifies the window that owns the dialog box.
     * @param {Pointer<DLGPROC>} dlgprc Points to the dialog box procedure. For more information about the dialog box procedure, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-dlgproc">DialogProc</a>.
     * @returns {Integer} If the <b>WlxDialogBoxIndirect</b> function succeeds, the return value is the <i>nResult</i> parameter given in the call to the 
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
    Call(hWlx, hInst, hDialogTemplate, hwndOwner, dlgprc) {
        result := DllCall(this.value, HANDLE, hWlx, HANDLE, hInst, DLGTEMPLATE.Ptr, hDialogTemplate, HWND, hwndOwner, DLGPROC, dlgprc, Int32)
        return result
    }

    /**
     * A PWLX_DIALOG_BOX_INDIRECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_DIALOG_BOX_INDIRECT {
        /**
         * Creates a PWLX_DIALOG_BOX_INDIRECT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, DLGTEMPLATE, HWND, DLGPROC) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, DLGTEMPLATE.Ptr, HWND, DLGPROC, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
