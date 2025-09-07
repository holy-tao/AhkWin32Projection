#Requires AutoHotkey v2.0.0 64-bit

/**
 * In Per Monitor v2 contexts, dialogs will automatically respond to DPI changes by resizing themselves and re-computing the positions of their child windows (here referred to as re-layouting).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-dialog_dpi_change_behaviors
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class DIALOG_DPI_CHANGE_BEHAVIORS{

    /**
     * The default behavior of the dialog manager. In response to a DPI change, the dialog manager will re-layout each control, update the font on each control, resize the dialog, and update the dialog's own font.
     * @type {Integer (Int32)}
     */
    static DDC_DEFAULT => 0

    /**
     * Prevents the dialog manager from responding to <a href="https://docs.microsoft.com/windows/desktop/hidpi/wm-getdpiscaledsize">WM_GETDPISCALEDSIZE</a> and <a href="https://docs.microsoft.com/windows/desktop/hidpi/wm-dpichanged">WM_DPICHANGED</a>, disabling all default DPI scaling behavior.
     * @type {Integer (Int32)}
     */
    static DDC_DISABLE_ALL => 1

    /**
     * Prevents the dialog manager from resizing the dialog in response to a DPI change.
     * @type {Integer (Int32)}
     */
    static DDC_DISABLE_RESIZE => 2

    /**
     * Prevents the dialog manager from re-layouting all of the dialogue's immediate children HWNDs in response to a DPI change.
     * @type {Integer (Int32)}
     */
    static DDC_DISABLE_CONTROL_RELAYOUT => 4
}
