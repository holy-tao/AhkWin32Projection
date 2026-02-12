#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimePickerSelectedValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TimePicker.SelectedTimeChanged](timepicker_selectedtimechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerselectedvaluechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePickerSelectedValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickerSelectedValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickerSelectedValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time previously selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerselectedvaluechangedeventargs.oldtime
     * @type {IReference<TimeSpan>} 
     */
    OldTime {
        get => this.get_OldTime()
    }

    /**
     * Gets the new time selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerselectedvaluechangedeventargs.newtime
     * @type {IReference<TimeSpan>} 
     */
    NewTime {
        get => this.get_NewTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_OldTime() {
        if (!this.HasProp("__ITimePickerSelectedValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickerSelectedValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerSelectedValueChangedEventArgs := ITimePickerSelectedValueChangedEventArgs(outPtr)
        }

        return this.__ITimePickerSelectedValueChangedEventArgs.get_OldTime()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_NewTime() {
        if (!this.HasProp("__ITimePickerSelectedValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickerSelectedValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerSelectedValueChangedEventArgs := ITimePickerSelectedValueChangedEventArgs(outPtr)
        }

        return this.__ITimePickerSelectedValueChangedEventArgs.get_NewTime()
    }

;@endregion Instance Methods
}
