#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the THUMBBUTTON structure to specify which members of that structure contain valid data.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-thumbbuttonmask
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class THUMBBUTTONMASK{

    /**
     * The <b>iBitmap</b> member contains valid information.
     * @type {Integer (Int32)}
     */
    static THB_BITMAP => 1

    /**
     * The <b>hIcon</b> member contains valid information.
     * @type {Integer (Int32)}
     */
    static THB_ICON => 2

    /**
     * The <b>szTip</b> member contains valid information.
     * @type {Integer (Int32)}
     */
    static THB_TOOLTIP => 4

    /**
     * The <b>dwFlags</b> member contains valid information.
     * @type {Integer (Int32)}
     */
    static THB_FLAGS => 8
}
