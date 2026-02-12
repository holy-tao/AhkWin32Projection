#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimePickerValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TimePicker.TimeChanged](timepicker_timechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickervaluechangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePickerValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickerValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickerValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time previously selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickervaluechangedeventargs.oldtime
     * @type {TimeSpan} 
     */
    OldTime {
        get => this.get_OldTime()
    }

    /**
     * Gets the new time selected in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickervaluechangedeventargs.newtime
     * @type {TimeSpan} 
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
     * @returns {TimeSpan} 
     */
    get_OldTime() {
        if (!this.HasProp("__ITimePickerValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickerValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerValueChangedEventArgs := ITimePickerValueChangedEventArgs(outPtr)
        }

        return this.__ITimePickerValueChangedEventArgs.get_OldTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewTime() {
        if (!this.HasProp("__ITimePickerValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickerValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerValueChangedEventArgs := ITimePickerValueChangedEventArgs(outPtr)
        }

        return this.__ITimePickerValueChangedEventArgs.get_NewTime()
    }

;@endregion Instance Methods
}
