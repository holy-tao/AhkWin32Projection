#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the IUIAutomationTransformPattern2::ZoomByUnit method, which zooms the viewport of a control by the specified unit.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-zoomunit
 * @namespace Windows.Win32.UI.Accessibility
 */
class ZoomUnit extends Win32Enum {

    /**
     * No increase or decrease in zoom.
     * Native name: ZoomUnit_NoAmount
     * @type {Integer (Int32)}
     */
    static NoAmount => 0

    /**
     * Decrease zoom by a large decrement.
     * Native name: ZoomUnit_LargeDecrement
     * @type {Integer (Int32)}
     */
    static LargeDecrement => 1

    /**
     * Decrease zoom by a small decrement.
     * Native name: ZoomUnit_SmallDecrement
     * @type {Integer (Int32)}
     */
    static SmallDecrement => 2

    /**
     * Increase zoom by a large increment.
     * Native name: ZoomUnit_LargeIncrement
     * @type {Integer (Int32)}
     */
    static LargeIncrement => 3

    /**
     * Increase zoom by a small increment.
     * Native name: ZoomUnit_SmallIncrement
     * @type {Integer (Int32)}
     */
    static SmallIncrement => 4
}
