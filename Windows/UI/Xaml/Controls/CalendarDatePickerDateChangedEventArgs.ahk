#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICalendarDatePickerDateChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DateChanged](calendardatepicker_datechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepickerdatechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CalendarDatePickerDateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICalendarDatePickerDateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICalendarDatePickerDateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the date that is currently selected in the [CalendarDatePicker](calendardatepicker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepickerdatechangedeventargs.newdate
     * @type {IReference<DateTime>} 
     */
    NewDate {
        get => this.get_NewDate()
    }

    /**
     * Gets the date that was previously selected in the [CalendarDatePicker](calendardatepicker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.calendardatepickerdatechangedeventargs.olddate
     * @type {IReference<DateTime>} 
     */
    OldDate {
        get => this.get_OldDate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NewDate() {
        if (!this.HasProp("__ICalendarDatePickerDateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePickerDateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePickerDateChangedEventArgs := ICalendarDatePickerDateChangedEventArgs(outPtr)
        }

        return this.__ICalendarDatePickerDateChangedEventArgs.get_NewDate()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_OldDate() {
        if (!this.HasProp("__ICalendarDatePickerDateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICalendarDatePickerDateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICalendarDatePickerDateChangedEventArgs := ICalendarDatePickerDateChangedEventArgs(outPtr)
        }

        return this.__ICalendarDatePickerDateChangedEventArgs.get_OldDate()
    }

;@endregion Instance Methods
}
