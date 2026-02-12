#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the content flow direction for text and UI elements.
 * @remarks
 * The FlowDirection enumeration is used as a value by the [FrameworkElement.FlowDirection](frameworkelement_flowdirection.md) property. **LeftToRight** is the default value.
 * 
 * [FrameworkElement.FlowDirection](frameworkelement_flowdirection.md) is interpreted differently for render purposes depending on which [FrameworkElement](frameworkelement.md) subclass is involved as the content or as a container. For more info, see [FrameworkElement.FlowDirection](frameworkelement_flowdirection.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.flowdirection
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FlowDirection extends Win32Enum{

    /**
     * Indicates that content should flow from left to right.
     * @type {Integer (Int32)}
     */
    static LeftToRight => 0

    /**
     * Indicates that content should flow from right to left.
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1
}
