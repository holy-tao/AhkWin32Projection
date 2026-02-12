#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kind of date selections are allowed in the calendar.
 * @remarks
 * This enumeration provides values for the [CalendarView.SelectionMode](calendarview_selectionmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewselectionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarViewSelectionMode extends Win32Enum{

    /**
     * Date selection is disabled.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * One date can be selected at a time.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * One or more dates can be selected at a time.
     * @type {Integer (Int32)}
     */
    static Multiple => 2
}
