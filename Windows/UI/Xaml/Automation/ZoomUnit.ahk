#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the [ZoomByUnit](../windows.ui.xaml.automation.provider/itransformprovider2_zoombyunit_1744877203.md) method, which zooms the viewport of a control by the specified unit.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.zoomunit
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ZoomUnit extends Win32Enum{

    /**
     * No increase or decrease in zoom.
     * @type {Integer (Int32)}
     */
    static NoAmount => 0

    /**
     * Decrease zoom by a large decrement.
     * @type {Integer (Int32)}
     */
    static LargeDecrement => 1

    /**
     * Decrease zoom by a small decrement.
     * @type {Integer (Int32)}
     */
    static SmallDecrement => 2

    /**
     * Increase zoom by a large increment.
     * @type {Integer (Int32)}
     */
    static LargeIncrement => 3

    /**
     * Increase zoom by a small increment.
     * @type {Integer (Int32)}
     */
    static SmallIncrement => 4
}
