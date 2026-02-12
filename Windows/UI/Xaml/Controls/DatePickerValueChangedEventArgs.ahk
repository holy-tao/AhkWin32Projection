#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatePickerValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DatePicker.DateChanged](datepicker_datechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickervaluechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickerValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the date previously selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickervaluechangedeventargs.olddate
     * @type {DateTime} 
     */
    OldDate {
        get => this.get_OldDate()
    }

    /**
     * Gets the new date selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickervaluechangedeventargs.newdate
     * @type {DateTime} 
     */
    NewDate {
        get => this.get_NewDate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_OldDate() {
        if (!this.HasProp("__IDatePickerValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickerValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerValueChangedEventArgs := IDatePickerValueChangedEventArgs(outPtr)
        }

        return this.__IDatePickerValueChangedEventArgs.get_OldDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NewDate() {
        if (!this.HasProp("__IDatePickerValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickerValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerValueChangedEventArgs := IDatePickerValueChangedEventArgs(outPtr)
        }

        return this.__IDatePickerValueChangedEventArgs.get_NewDate()
    }

;@endregion Instance Methods
}
