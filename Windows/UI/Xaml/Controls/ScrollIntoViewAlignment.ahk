#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe how an item that is programmatically scrolled into view aligns with the visible area.
 * @remarks
 * When scrolled vertically, the leading edge is the top edge.
 * 
 * When scrolled horizontally, the leading edge is the left edge if [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is [LeftToRight](../windows.ui.xaml/flowdirection.md), and the right edge if [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is [RightToLeft](../windows.ui.xaml/flowdirection.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollintoviewalignment
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollIntoViewAlignment extends Win32Enum{

    /**
     * The item aligns with the nearest edge.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The item aligns with the leading edge.
     * @type {Integer (Int32)}
     */
    static Leading => 1
}
