#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatePickerSelectedValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [DatePicker.SelectedDateChanged](datepicker_selecteddatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerselectedvaluechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickerSelectedValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickerSelectedValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickerSelectedValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the date previously selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerselectedvaluechangedeventargs.olddate
     * @type {IReference<DateTime>} 
     */
    OldDate {
        get => this.get_OldDate()
    }

    /**
     * Gets the new date selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickerselectedvaluechangedeventargs.newdate
     * @type {IReference<DateTime>} 
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
     * @returns {IReference<DateTime>} 
     */
    get_OldDate() {
        if (!this.HasProp("__IDatePickerSelectedValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickerSelectedValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerSelectedValueChangedEventArgs := IDatePickerSelectedValueChangedEventArgs(outPtr)
        }

        return this.__IDatePickerSelectedValueChangedEventArgs.get_OldDate()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NewDate() {
        if (!this.HasProp("__IDatePickerSelectedValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickerSelectedValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickerSelectedValueChangedEventArgs := IDatePickerSelectedValueChangedEventArgs(outPtr)
        }

        return this.__IDatePickerSelectedValueChangedEventArgs.get_NewDate()
    }

;@endregion Instance Methods
}
