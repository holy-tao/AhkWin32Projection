#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes per-monitor DPI scaling behavior overrides for child windows within dialogs. The values in this enumeration are bitfields and can be combined.
 * @remarks
 * This enum is used with <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdialogcontroldpichangebehavior">SetDialogControlDpiChangeBehavior</a> in order to override the default per-monitor DPI scaling behavior for a child window within a dialog.
  * 
  * These settings only apply to individual controls within dialogs. The dialog-wide per-monitor DPI scaling behavior of a dialog is controlled by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-dialog_dpi_change_behaviors">DIALOG_DPI_CHANGE_BEHAVIORS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-dialog_control_dpi_change_behaviors
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS{

    /**
     * The default behavior of the dialog manager. The dialog managed will update the font, size, and position of the child window on DPI changes.
     * @type {Integer (Int32)}
     */
    static DCDC_DEFAULT => 0

    /**
     * Prevents the dialog manager from sending an updated font to the child window via WM_SETFONT in response to a DPI change.
     * @type {Integer (Int32)}
     */
    static DCDC_DISABLE_FONT_UPDATE => 1

    /**
     * Prevents the dialog manager from resizing and repositioning  the child window in response to a DPI change.
     * @type {Integer (Int32)}
     */
    static DCDC_DISABLE_RELAYOUT => 2
}
