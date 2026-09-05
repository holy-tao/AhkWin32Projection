#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the direction and distance to scroll.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-scrollamount
 * @namespace Windows.Win32.UI.Accessibility
 */
class ScrollAmount extends Win32Enum {

    /**
     * Scrolling is done in large decrements, equivalent to pressing the PAGE UP key or clicking on a blank part of a scroll bar. If one page up is not a relevant amount for the control and no scroll bar exists, the value represents an amount equal to the current visible window.
     * Native name: ScrollAmount_LargeDecrement
     * @type {Integer (Int32)}
     */
    static LargeDecrement => 0

    /**
     * Scrolling is done in small decrements, equivalent to pressing an arrow key or clicking the arrow button on a scroll bar.
     * Native name: ScrollAmount_SmallDecrement
     * @type {Integer (Int32)}
     */
    static SmallDecrement => 1

    /**
     * No scrolling is done.
     * Native name: ScrollAmount_NoAmount
     * @type {Integer (Int32)}
     */
    static NoAmount => 2

    /**
     * Scrolling is done in large increments, equivalent to pressing the PAGE DOWN or PAGE UP key or clicking on a blank part of a scroll bar. 
     * 			If one page is not a relevant amount for the control and no scroll bar exists, the value represents an amount equal to the current visible window.
     * Native name: ScrollAmount_LargeIncrement
     * @type {Integer (Int32)}
     */
    static LargeIncrement => 3

    /**
     * Scrolling is done in small increments, equivalent to pressing an arrow key or clicking the arrow 
     * 			button on a scroll bar.
     * Native name: ScrollAmount_SmallIncrement
     * @type {Integer (Int32)}
     */
    static SmallIncrement => 4
}
