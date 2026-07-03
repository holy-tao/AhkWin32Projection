#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\UI\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }

/**
 * Called by GINA to initialize dialog box controls and then create a modal dialog box from a dialog box template in memory.
 * @remarks
 * <b>WlxDialogBoxIndirectParam</b> duplicates the Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxindirectparama">DialogBoxIndirectParam</a> function and also allows Winlogon to terminate the dialog box. For more information, see 
 * <b>DialogBoxIndirectParam</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/nc-winwlx-pwlx_dialog_box_indirect_param
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PWLX_DIALOG_BOX_INDIRECT_PARAM {
    value : IntPtr

    __value {
        set {
            if (value is PWLX_DIALOG_BOX_INDIRECT_PARAM) {
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
     * @param {HANDLE} hInst Specifies the instance of the module that creates the dialog box.
     * @param {Pointer<DLGTEMPLATE>} hDialogTemplate Specifies the address of a global memory object that contains a dialog box template used to create the dialog box. The template is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-dlgtemplate">DLGTEMPLATE</a> structure followed by one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-dlgitemtemplate">DLGITEMTEMPLATE</a> structures. For a full description of these structures, see the Platform SDK.
     * @param {HWND} hwndOwner Specifies the window that owns the dialog box.
     * @param {Pointer<DLGPROC>} dlgprc Points to the dialog box procedure. For more information about the dialog box procedure, see the description of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-dlgproc">DialogProc</a> callback function in the Platform SDK.
     * @param {LPARAM} dwInitParam Specifies the value used to initialize the dialog box control. This value is passed to the dialog box in the <i>lParam</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message.
     * @returns {Integer} If the function succeeds, the function returns the <i>nResult</i> parameter given in the call to the 
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
    Call(hWlx, hInst, hDialogTemplate, hwndOwner, dlgprc, dwInitParam) {
        result := DllCall(this.value, HANDLE, hWlx, HANDLE, hInst, DLGTEMPLATE.Ptr, hDialogTemplate, HWND, hwndOwner, "ptr", dlgprc, LPARAM, dwInitParam, Int32)
        return result
    }

    /**
     * A PWLX_DIALOG_BOX_INDIRECT_PARAM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLX_DIALOG_BOX_INDIRECT_PARAM {
        /**
         * Creates a PWLX_DIALOG_BOX_INDIRECT_PARAM pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, DLGTEMPLATE, HWND, "ptr", LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, DLGTEMPLATE.Ptr, HWND, "ptr", LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
