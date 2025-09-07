#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which mouse button was pressed. (InkMouseButton)
 * @remarks
 * In C++, explicit casting is required when trying to set more than one flag at a time. A compilation error occurs if explicit casting is not used.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkmousebutton
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkMouseButton{

    /**
     * The left mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static IMF_Left => 1

    /**
     * The right mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static IMF_Right => 2

    /**
     * The middle mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static IMF_Middle => 4
}
