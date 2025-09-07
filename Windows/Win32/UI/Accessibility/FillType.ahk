#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values for the FillType attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-filltype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class FillType{

    /**
     * The element is not filled.
     * @type {Integer (Int32)}
     */
    static FillType_None => 0

    /**
     * The element is filled with a solid color.
     * @type {Integer (Int32)}
     */
    static FillType_Color => 1

    /**
     * The element is filled with a gradient.
     * @type {Integer (Int32)}
     */
    static FillType_Gradient => 2

    /**
     * The element is filled using a picture.
     * @type {Integer (Int32)}
     */
    static FillType_Picture => 3

    /**
     * The element is filled using a pattern.
     * @type {Integer (Int32)}
     */
    static FillType_Pattern => 4
}
