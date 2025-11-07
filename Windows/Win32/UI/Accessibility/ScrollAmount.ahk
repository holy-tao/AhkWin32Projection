#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the direction and distance to scroll.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-scrollamount
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ScrollAmount{

    /**
     * Scrolling is done in large decrements, equivalent to pressing the PAGE UP key or clicking on a blank part of a scroll bar. If one page up is not a relevant amount for the control and no scroll bar exists, the value represents an amount equal to the current visible window.
     * @type {Integer (Int32)}
     */
    static ScrollAmount_LargeDecrement => 0

    /**
     * Scrolling is done in small decrements, equivalent to pressing an arrow key or clicking the arrow button on a scroll bar.
     * @type {Integer (Int32)}
     */
    static ScrollAmount_SmallDecrement => 1

    /**
     * No scrolling is done.
     * @type {Integer (Int32)}
     */
    static ScrollAmount_NoAmount => 2

    /**
     * Scrolling is done in large increments, equivalent to pressing the PAGE DOWN or PAGE UP key or clicking on a blank part of a scroll bar. 
     * 			If one page is not a relevant amount for the control and no scroll bar exists, the value represents an amount equal to the current visible window.
     * @type {Integer (Int32)}
     */
    static ScrollAmount_LargeIncrement => 3

    /**
     * Scrolling is done in small increments, equivalent to pressing an arrow key or clicking the arrow 
     * 			button on a scroll bar.
     * @type {Integer (Int32)}
     */
    static ScrollAmount_SmallIncrement => 4
}
