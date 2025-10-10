#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the orientation of a control.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-orientationtype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class OrientationType{

    /**
     * The control has no orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_None => 0

    /**
     * The control has horizontal orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_Horizontal => 1

    /**
     * The control has vertical orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_Vertical => 2
}
