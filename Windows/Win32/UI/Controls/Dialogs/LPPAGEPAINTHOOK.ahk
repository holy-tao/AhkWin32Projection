#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/commdlg/nc-commdlg-lppagepainthook
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class LPPAGEPAINTHOOK extends IUnknown {

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
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @param {WPARAM} param2 
     * @param {LPARAM} param3 
     * @returns {Pointer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "ptr")
        return result
    }
}
