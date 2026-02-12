#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IDatePickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DatePicked](datepickerflyout_datepicked.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DatePickedEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatePickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatePickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous date.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickedeventargs.olddate
     * @type {DateTime} 
     */
    OldDate {
        get => this.get_OldDate()
    }

    /**
     * Gets the date that was selected by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.datepickedeventargs.newdate
     * @type {DateTime} 
     */
    NewDate {
        get => this.get_NewDate()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DatePickedEventArgs](datepickedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DatePickedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_OldDate() {
        if (!this.HasProp("__IDatePickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickedEventArgs := IDatePickedEventArgs(outPtr)
        }

        return this.__IDatePickedEventArgs.get_OldDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NewDate() {
        if (!this.HasProp("__IDatePickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatePickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatePickedEventArgs := IDatePickedEventArgs(outPtr)
        }

        return this.__IDatePickedEventArgs.get_NewDate()
    }

;@endregion Instance Methods
}
