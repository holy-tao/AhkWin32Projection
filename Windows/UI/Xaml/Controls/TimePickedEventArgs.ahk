#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\ITimePickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [TimePicked](timepickerflyout_timepicked.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePickedEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the old time value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickedeventargs.oldtime
     * @type {TimeSpan} 
     */
    OldTime {
        get => this.get_OldTime()
    }

    /**
     * Gets the time that was selected by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickedeventargs.newtime
     * @type {TimeSpan} 
     */
    NewTime {
        get => this.get_NewTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimePickedEventArgs](timepickedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OldTime() {
        if (!this.HasProp("__ITimePickedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickedEventArgs := ITimePickedEventArgs(outPtr)
        }

        return this.__ITimePickedEventArgs.get_OldTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewTime() {
        if (!this.HasProp("__ITimePickedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITimePickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickedEventArgs := ITimePickedEventArgs(outPtr)
        }

        return this.__ITimePickedEventArgs.get_NewTime()
    }

;@endregion Instance Methods
}
