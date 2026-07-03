#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Receives messages that allow you to customize drawing of the sample page in the Page Setup dialog box. The PagePaintHook hook procedure is an application-defined or library-defined callback function used with the PageSetupDlg function.
 * @remarks
 * The <b>Page Setup</b> dialog box includes an image of a sample page that shows how the user's selections affect the appearance of the printed output. The image consists of a rectangle that represents the selected paper or envelope type, with a dotted-line rectangle representing the current margins, and partial (Greek text) characters to show how text looks on the printed page. When you use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646937(v=vs.85)">PageSetupDlg</a> function to create a <b>Page Setup</b> dialog box, you can provide a <i>PagePaintHook</i> hook procedure to customize the appearance of the sample page.
 * 
 * To enable the hook procedure, use the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-pagesetupdlga">PAGESETUPDLG</a> structure that you passed to the creation function. Specify the pointer to the hook procedure in the  <b>lpfnPagePaintHook</b> member and specify the <b>PSD_ENABLEPAGEPAINTHOOK</b> flag in the  <b>Flags</b> member.
 * 
 * Whenever the dialog box is about to draw the contents of the sample page, the hook procedure receives the following messages in the order in which they are listed.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Message</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-pagesetupdlg">WM_PSD_PAGESETUPDLG</a>
 * </td>
 * <td>The dialog box is about to draw the sample page. The hook procedure can use this message to prepare to draw the contents of the sample page.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-fullpagerect">WM_PSD_FULLPAGERECT</a>
 * </td>
 * <td>The dialog box is about to draw the sample page. This message specifies the bounding rectangle of the sample page.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-minmarginrect">WM_PSD_MINMARGINRECT</a>
 * </td>
 * <td>The dialog box is about to draw the sample page. This message specifies the margin rectangle.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-marginrect">WM_PSD_MARGINRECT</a>
 * </td>
 * <td>The dialog box is about to draw the margin rectangle.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-greektextrect">WM_PSD_GREEKTEXTRECT</a>
 * </td>
 * <td>The dialog box is about to draw the Greek text inside the margin rectangle.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-envstamprect">WM_PSD_ENVSTAMPRECT</a>
 * </td>
 * <td>The dialog box is about to draw in the envelope-stamp rectangle of an envelope sample page. This message is sent for envelopes only.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-yafullpagerect">WM_PSD_YAFULLPAGERECT</a>
 * </td>
 * <td>The dialog box is about to draw the return address portion of an envelope sample page. This message is sent for envelopes and other paper sizes.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-lppagepainthook
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct LPPAGEPAINTHOOK {
    value : IntPtr

    __value {
        set {
            if (value is LPPAGEPAINTHOOK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 A handle to the <b>Page Setup</b> dialog box.
     * @param {Integer} param1 The identifier of the message being received.
     * @param {WPARAM} param2 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter.
     * @param {LPARAM} param3 Additional information about the message. The exact meaning depends on the value of the <i>unnamedParam2</i> parameter.
     * @returns {Pointer} If the hook procedure returns <b>TRUE</b> for any of the first three messages of a drawing sequence (<a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-pagesetupdlg">WM_PSD_PAGESETUPDLG</a>, <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-fullpagerect">WM_PSD_FULLPAGERECT</a>, or <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-psd-minmarginrect">WM_PSD_MINMARGINRECT</a>), the dialog box sends no more messages and does not draw in the sample page until the next time the system needs to redraw the sample page. If the hook procedure returns <b>FALSE</b> for all three messages, the dialog box sends the remaining messages of the drawing sequence.
     * 
     * If the hook procedure returns <b>TRUE</b> for any of the remaining messages in a drawing sequence, the dialog box does not draw the corresponding portion of the sample page. If the hook procedure returns <b>FALSE</b> for any of these messages, the dialog box draws that portion of the sample page.
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, IntPtr)
        return result
    }

    /**
     * A LPPAGEPAINTHOOK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPPAGEPAINTHOOK {
        /**
         * Creates a LPPAGEPAINTHOOK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
