#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify which view of the calendar is shown.
 * @remarks
 * This enumeration provides values for the [CalendarView.DisplayMode](calendarview_displaymode.md) and [CalandarDatePicker.DisplayMode](calendardatepicker_displaymode.md) properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewdisplaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarViewDisplayMode extends Win32Enum{

    /**
     * The month view is shown.
     * @type {Integer (Int32)}
     */
    static Month => 0

    /**
     * The year selector view is shown.
     * @type {Integer (Int32)}
     */
    static Year => 1

    /**
     * The decade selector view is shown.
     * @type {Integer (Int32)}
     */
    static Decade => 2
}
