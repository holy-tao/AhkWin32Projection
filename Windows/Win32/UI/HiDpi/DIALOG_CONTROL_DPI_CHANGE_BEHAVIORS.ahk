#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-dialog_control_dpi_change_behaviors
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS{

    /**
     * @type {Integer (Int32)}
     */
    static DCDC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCDC_DISABLE_FONT_UPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCDC_DISABLE_RELAYOUT => 2
}
