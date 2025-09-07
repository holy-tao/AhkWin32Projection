#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains possible values for the IUIAutomationTransformPattern2::ZoomByUnit method, which zooms the viewport of a control by the specified unit.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-zoomunit
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ZoomUnit{

    /**
     * No increase or decrease in zoom.
     * @type {Integer (Int32)}
     */
    static ZoomUnit_NoAmount => 0

    /**
     * Decrease zoom by a large decrement.
     * @type {Integer (Int32)}
     */
    static ZoomUnit_LargeDecrement => 1

    /**
     * Decrease zoom by a small decrement.
     * @type {Integer (Int32)}
     */
    static ZoomUnit_SmallDecrement => 2

    /**
     * Increase zoom by a large increment.
     * @type {Integer (Int32)}
     */
    static ZoomUnit_LargeIncrement => 3

    /**
     * Increase zoom by a small increment.
     * @type {Integer (Int32)}
     */
    static ZoomUnit_SmallIncrement => 4
}
