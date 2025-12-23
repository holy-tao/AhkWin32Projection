#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values used to indicate Microsoft UI Automation data types.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-uiautomationtype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIAutomationType extends Win32BitflagEnum{

    /**
     * An integer.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Int => 1

    /**
     * An Boolean value.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Bool => 2

    /**
     * A null-terminated character string.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_String => 3

    /**
     * A double-precision floating-point number.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Double => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the x- and y-coordinates of a point.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Point => 5

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper-left and lower-right corners of a rectangle. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Rect => 6

    /**
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface of a UI Automation element.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Element => 7

    /**
     * An array of an unspecified type.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Array => 65536

    /**
     * The address of a variable that receives a value retrieved by a function.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_Out => 131072

    /**
     * An array of integers. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_IntArray => 65537

    /**
     * An array of Boolean values. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_BoolArray => 65538

    /**
     * An array of null-terminated character strings. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_StringArray => 65539

    /**
     * An array of double-precision floating-point numbers. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_DoubleArray => 65540

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structures, each containing the x- and y-coordinates of a point. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_PointArray => 65541

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures, each containing the coordinates of the upper-left and lower-right corners of a rectangle. This type is not supported for a custom UI Automation property.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_RectArray => 65542

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces, each for a UI Automation element.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_ElementArray => 65543

    /**
     * The address of a variable that receives an integer value.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutInt => 131073

    /**
     * The address of a variable that receives a Boolean value.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutBool => 131074

    /**
     * The address of a variable that receives a null-terminated character string.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutString => 131075

    /**
     * The address of a variable that receives a double-precision floating-point number.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutDouble => 131076

    /**
     * The address of a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutPoint => 131077

    /**
     * The address of a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutRect => 131078

    /**
     * The address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface of a UI Automation element.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutElement => 131079

    /**
     * The address of a variable that receives an array of integer values.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutIntArray => 196609

    /**
     * The address of a variable that receives an array of Boolean values.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutBoolArray => 196610

    /**
     * The address of a variable that receives an array of null-terminated character strings.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutStringArray => 196611

    /**
     * The address of a variable that receives an array of double-precision floating-point numbers.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutDoubleArray => 196612

    /**
     * The address of a variable that receives an array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structures.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutPointArray => 196613

    /**
     * The address of a variable that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutRectArray => 196614

    /**
     * The address of a variable that receives an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces of UI Automation elements.
     * @type {Integer (Int32)}
     */
    static UIAutomationType_OutElementArray => 196615
}
