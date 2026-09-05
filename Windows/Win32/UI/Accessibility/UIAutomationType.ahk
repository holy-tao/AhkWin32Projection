#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values used to indicate Microsoft UI Automation data types.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-uiautomationtype
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIAutomationType extends Win32BitflagEnum {

    /**
     * An integer.
     * Native name: UIAutomationType_Int
     * @type {Integer (Int32)}
     */
    static Int => 1

    /**
     * An Boolean value.
     * Native name: UIAutomationType_Bool
     * @type {Integer (Int32)}
     */
    static Bool => 2

    /**
     * A null-terminated character string.
     * Native name: UIAutomationType_String
     * @type {Integer (Int32)}
     */
    static String => 3

    /**
     * A double-precision floating-point number.
     * Native name: UIAutomationType_Double
     * @type {Integer (Int32)}
     */
    static Double => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the x- and y-coordinates of a point.
     * Native name: UIAutomationType_Point
     * @type {Integer (Int32)}
     */
    static Point => 5

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper-left and lower-right corners of a rectangle. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_Rect
     * @type {Integer (Int32)}
     */
    static Rect => 6

    /**
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface of a UI Automation element.
     * Native name: UIAutomationType_Element
     * @type {Integer (Int32)}
     */
    static Element => 7

    /**
     * An array of an unspecified type.
     * Native name: UIAutomationType_Array
     * @type {Integer (Int32)}
     */
    static Array => 65536

    /**
     * The address of a variable that receives a value retrieved by a function.
     * Native name: UIAutomationType_Out
     * @type {Integer (Int32)}
     */
    static Out => 131072

    /**
     * An array of integers. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_IntArray
     * @type {Integer (Int32)}
     */
    static IntArray => 65537

    /**
     * An array of Boolean values. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_BoolArray
     * @type {Integer (Int32)}
     */
    static BoolArray => 65538

    /**
     * An array of null-terminated character strings. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_StringArray
     * @type {Integer (Int32)}
     */
    static StringArray => 65539

    /**
     * An array of double-precision floating-point numbers. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_DoubleArray
     * @type {Integer (Int32)}
     */
    static DoubleArray => 65540

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structures, each containing the x- and y-coordinates of a point. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_PointArray
     * @type {Integer (Int32)}
     */
    static PointArray => 65541

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures, each containing the coordinates of the upper-left and lower-right corners of a rectangle. This type is not supported for a custom UI Automation property.
     * Native name: UIAutomationType_RectArray
     * @type {Integer (Int32)}
     */
    static RectArray => 65542

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces, each for a UI Automation element.
     * Native name: UIAutomationType_ElementArray
     * @type {Integer (Int32)}
     */
    static ElementArray => 65543

    /**
     * The address of a variable that receives an integer value.
     * Native name: UIAutomationType_OutInt
     * @type {Integer (Int32)}
     */
    static OutInt => 131073

    /**
     * The address of a variable that receives a Boolean value.
     * Native name: UIAutomationType_OutBool
     * @type {Integer (Int32)}
     */
    static OutBool => 131074

    /**
     * The address of a variable that receives a null-terminated character string.
     * Native name: UIAutomationType_OutString
     * @type {Integer (Int32)}
     */
    static OutString => 131075

    /**
     * The address of a variable that receives a double-precision floating-point number.
     * Native name: UIAutomationType_OutDouble
     * @type {Integer (Int32)}
     */
    static OutDouble => 131076

    /**
     * The address of a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure.
     * Native name: UIAutomationType_OutPoint
     * @type {Integer (Int32)}
     */
    static OutPoint => 131077

    /**
     * The address of a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure.
     * Native name: UIAutomationType_OutRect
     * @type {Integer (Int32)}
     */
    static OutRect => 131078

    /**
     * The address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface of a UI Automation element.
     * Native name: UIAutomationType_OutElement
     * @type {Integer (Int32)}
     */
    static OutElement => 131079

    /**
     * The address of a variable that receives an array of integer values.
     * Native name: UIAutomationType_OutIntArray
     * @type {Integer (Int32)}
     */
    static OutIntArray => 196609

    /**
     * The address of a variable that receives an array of Boolean values.
     * Native name: UIAutomationType_OutBoolArray
     * @type {Integer (Int32)}
     */
    static OutBoolArray => 196610

    /**
     * The address of a variable that receives an array of null-terminated character strings.
     * Native name: UIAutomationType_OutStringArray
     * @type {Integer (Int32)}
     */
    static OutStringArray => 196611

    /**
     * The address of a variable that receives an array of double-precision floating-point numbers.
     * Native name: UIAutomationType_OutDoubleArray
     * @type {Integer (Int32)}
     */
    static OutDoubleArray => 196612

    /**
     * The address of a variable that receives an array of <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structures.
     * Native name: UIAutomationType_OutPointArray
     * @type {Integer (Int32)}
     */
    static OutPointArray => 196613

    /**
     * The address of a variable that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures.
     * Native name: UIAutomationType_OutRectArray
     * @type {Integer (Int32)}
     */
    static OutRectArray => 196614

    /**
     * The address of a variable that receives an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces of UI Automation elements.
     * Native name: UIAutomationType_OutElementArray
     * @type {Integer (Int32)}
     */
    static OutElementArray => 196615
}
