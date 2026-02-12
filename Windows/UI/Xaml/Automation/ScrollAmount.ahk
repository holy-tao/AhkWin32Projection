#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that are used by the [IScrollProvider](../windows.ui.xaml.automation.provider/iscrollprovider.md) pattern to indicate the direction and distance to scroll.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.scrollamount
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ScrollAmount extends Win32Enum{

    /**
     * Specifies that scrolling is performed in large decrements, which is equivalent to pressing the PAGE UP key or to clicking a blank part of a scrollbar. If the distance represented by the PAGE UP key is not a relevant amount for the control, or if no scrollbar exists, the value represents an amount equal to the size of the currently visible window.
     * @type {Integer (Int32)}
     */
    static LargeDecrement => 0

    /**
     * Specifies that scrolling is performed in small decrements, which is equivalent to pressing an arrow key or to clicking the arrow button on a scrollbar.
     * @type {Integer (Int32)}
     */
    static SmallDecrement => 1

    /**
     * Specifies that scrolling should not be performed.
     * @type {Integer (Int32)}
     */
    static NoAmount => 2

    /**
     * Specifies that scrolling is performed in large increments, which is equivalent to pressing the PAGE DOWN key or to clicking a blank part of a scrollbar. If the distance represented by the PAGE DOWN key is not a relevant amount for the control, or if no scrollbar exists, the value represents an amount equal to the size of the currently visible region.
     * @type {Integer (Int32)}
     */
    static LargeIncrement => 3

    /**
     * Specifies that scrolling is performed in small increments, which is equivalent to pressing an arrow key or to clicking the arrow button on a scrollbar.
     * @type {Integer (Int32)}
     */
    static SmallIncrement => 4
}
