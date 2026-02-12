#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICalendarViewSelectedDatesChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SelectedDatesChanged](calendarview_selecteddateschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewselecteddateschangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarViewSelectedDatesChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarViewSelectedDatesChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarViewSelectedDatesChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection that contains the items that were selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewselecteddateschangedeventargs.addeddates
     * @type {IVectorView<DateTime>} 
     */
    AddedDates {
        get => this.get_AddedDates()
    }

    /**
     * Gets a collection that contains the items that were unselected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendarviewselecteddateschangedeventargs.removeddates
     * @type {IVectorView<DateTime>} 
     */
    RemovedDates {
        get => this.get_RemovedDates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<DateTime>} 
     */
    get_AddedDates() {
        if (!this.HasProp("__ICalendarViewSelectedDatesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewSelectedDatesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewSelectedDatesChangedEventArgs := ICalendarViewSelectedDatesChangedEventArgs(outPtr)
        }

        return this.__ICalendarViewSelectedDatesChangedEventArgs.get_AddedDates()
    }

    /**
     * 
     * @returns {IVectorView<DateTime>} 
     */
    get_RemovedDates() {
        if (!this.HasProp("__ICalendarViewSelectedDatesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarViewSelectedDatesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarViewSelectedDatesChangedEventArgs := ICalendarViewSelectedDatesChangedEventArgs(outPtr)
        }

        return this.__ICalendarViewSelectedDatesChangedEventArgs.get_RemovedDates()
    }

;@endregion Instance Methods
}
