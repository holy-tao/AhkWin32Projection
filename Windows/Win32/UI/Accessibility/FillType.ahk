#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the FillType attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-filltype
 * @namespace Windows.Win32.UI.Accessibility
 */
class FillType extends Win32Enum {

    /**
     * The element is not filled.
     * Native name: FillType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The element is filled with a solid color.
     * Native name: FillType_Color
     * @type {Integer (Int32)}
     */
    static Color => 1

    /**
     * The element is filled with a gradient.
     * Native name: FillType_Gradient
     * @type {Integer (Int32)}
     */
    static Gradient => 2

    /**
     * The element is filled using a picture.
     * Native name: FillType_Picture
     * @type {Integer (Int32)}
     */
    static Picture => 3

    /**
     * The element is filled using a pattern.
     * Native name: FillType_Pattern
     * @type {Integer (Int32)}
     */
    static Pattern => 4
}
