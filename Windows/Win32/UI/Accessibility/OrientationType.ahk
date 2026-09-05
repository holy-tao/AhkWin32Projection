#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the orientation of a control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-orientationtype
 * @namespace Windows.Win32.UI.Accessibility
 */
class OrientationType extends Win32Enum {

    /**
     * The control has no orientation.
     * Native name: OrientationType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The control has horizontal orientation.
     * Native name: OrientationType_Horizontal
     * @type {Integer (Int32)}
     */
    static Horizontal => 1

    /**
     * The control has vertical orientation.
     * Native name: OrientationType_Vertical
     * @type {Integer (Int32)}
     */
    static Vertical => 2
}
