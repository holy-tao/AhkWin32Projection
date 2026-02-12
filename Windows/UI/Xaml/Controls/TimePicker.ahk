#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ITimePicker.ahk
#Include .\ITimePicker2.ahk
#Include .\ITimePicker3.ahk
#Include .\ITimePickerStatics2.ahk
#Include .\ITimePickerStatics.ahk
#Include .\ITimePickerStatics3.ahk
#Include .\ITimePickerFactory.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\TimePickerValueChangedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TimePicker.ahk
#Include .\TimePickerSelectedValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick a time value.
 * @remarks
 * Use a `TimePicker` to let a user enter a single time value. You can customize the `DatePicker` to use a 12-hour or 24-hour clock.
 * 
 * ![A time picker control.](images/date-time/time-picker-closed.png)
 * 
 * For more info, design guidance, and code examples, see [Time picker](/windows/uwp/design/controls-and-patterns/time-picker).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePicker extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePicker.IID

    /**
     * Identifies the [LightDismissOverlayMode](timepicker_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => TimePicker.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [Header](timepicker_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => TimePicker.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](timepicker_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => TimePicker.get_HeaderTemplateProperty()
    }

    /**
     * Gets the identifier for the [ClockIdentifier](timepicker_clockidentifier.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.clockidentifierproperty
     * @type {DependencyProperty} 
     */
    static ClockIdentifierProperty {
        get => TimePicker.get_ClockIdentifierProperty()
    }

    /**
     * Gets the identifier for the [MinuteIncrement](timepicker_minuteincrement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.minuteincrementproperty
     * @type {DependencyProperty} 
     */
    static MinuteIncrementProperty {
        get => TimePicker.get_MinuteIncrementProperty()
    }

    /**
     * Gets the identifier for the [Time](timepicker_time.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.timeproperty
     * @type {DependencyProperty} 
     */
    static TimeProperty {
        get => TimePicker.get_TimeProperty()
    }

    /**
     * Identifies the [SelectedTime](timepicker_selectedtime.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.selectedtimeproperty
     * @type {DependencyProperty} 
     */
    static SelectedTimeProperty {
        get => TimePicker.get_SelectedTimeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics2.IID)
            TimePicker.__ITimePickerStatics2 := ITimePickerStatics2(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics2.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics.IID)
            TimePicker.__ITimePickerStatics := ITimePickerStatics(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics.IID)
            TimePicker.__ITimePickerStatics := ITimePickerStatics(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClockIdentifierProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics.IID)
            TimePicker.__ITimePickerStatics := ITimePickerStatics(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics.get_ClockIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinuteIncrementProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics.IID)
            TimePicker.__ITimePickerStatics := ITimePickerStatics(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics.get_MinuteIncrementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TimeProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics.IID)
            TimePicker.__ITimePickerStatics := ITimePickerStatics(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics.get_TimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedTimeProperty() {
        if (!TimePicker.HasProp("__ITimePickerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerStatics3.IID)
            TimePicker.__ITimePickerStatics3 := ITimePickerStatics3(factoryPtr)
        }

        return TimePicker.__ITimePickerStatics3.get_SelectedTimeProperty()
    }

    /**
     * 
     * @returns {TimePicker} 
     */
    static CreateInstance() {
        if (!TimePicker.HasProp("__ITimePickerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerFactory.IID)
            TimePicker.__ITimePickerFactory := ITimePickerFactory(factoryPtr)
        }

        return TimePicker.__ITimePickerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](timepicker_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the clock system to use.
     * @remarks
     * The type of the property is **String**, but you must use values that correspond to the static string properties of [Windows.Globalization.ClockIdentifiers](../windows.globalization/clockidentifiers.md). These are: [TwelveHour](../windows.globalization/clockidentifiers_twelvehour.md) (the string "12HourClock")and [TwentyFourHour](../windows.globalization/clockidentifiers_twentyfourhour.md) (the string "24HourClock"). "12HourClock" is the default value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.clockidentifier
     * @type {HSTRING} 
     */
    ClockIdentifier {
        get => this.get_ClockIdentifier()
        set => this.put_ClockIdentifier(value)
    }

    /**
     * Gets or sets a value that indicates the time increments shown in the minute picker. For example, 15 specifies that the [TimePicker](timepicker.md) minute control displays only the choices 00, 15, 30, 45.
     * @remarks
     * You can set the `MinuteIncrement` property to indicate the time increments shown in the minute picker. For example, 15 specifies that the `TimePicker` minute control displays only the choices 00, 15, 30, 45.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.minuteincrement
     * @type {Integer} 
     */
    MinuteIncrement {
        get => this.get_MinuteIncrement()
        set => this.put_MinuteIncrement(value)
    }

    /**
     * Gets or sets the time currently set in the time picker.
     * @remarks
     * The time picker control has both `Time`/[TimeChanged](timepicker_timechanged.md) and [SelectedTime](timepicker_selectedtime.md)/[SelectedTimeChanged](timepicker_selectedtimechanged.md) APIs. The difference between these is that `Time` is not nullable, while `SelectedTime` is nullable.
     * 
     * The value of `SelectedTime` is used to populate the time picker and is `null` by default. If `SelectedTime` is `null`, the `Time` property is set to a [TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) of 0; otherwise, the `Time` value is synchronized with the `SelectedTime` value. When `SelectedTime` is `null`, the picker is 'unset' and shows the field names instead of a time.
     * 
     * The time won't increment in real-time (like a clock would) unless you provide a code binding to some value that does track the current time while the app is running.
     * 
     * You can set the time value as an attribute in XAML. This is probably easiest if you're already declaring the [TimePicker](timepicker.md) object in XAML and aren't using bindings for the time value. Use a string in the form *Hh*:*Mm* where *Hh* is hours and can be between 0 and 23 and *Mm* is minutes and can be between 0 and 59. A "0" can be the initial character in either *Hh* or *Mm* and is typically included for clarity of any values 0 thru 9. For example, "9:5" and "09:05" are both valid and represent the same time, but "09:05" is easier to read in markup.
     * 
     * To set the time in code, you have different techniques available depending on your programming language. The value is represented as [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) for C# and Visual Basic, or [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) for Visual C++ component extensions (C++/CX). Probably the easiest way to produce a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) value that's appropriate for `Time` is to use the [TimeSpan.Parse](/dotnet/api/system.timespan.parse?view=dotnet-uwp-10.0&preserve-view=true)static method. Use a string in the form *Hh*:*Mm* (hours:minutes).
     * 
     * Whether set in code or XAML, the [TimePicker](timepicker.md) class has coercion logic for the value it preserves when you attempt to set it. Any days values are ignored. Seconds values are ignored (for example seconds over 30 are not rounded up to the next minute). Fractional seconds are ignored. Values do not wrap around (for example a value of "24:00" is invalid.) The minimum value within the `TimeSpan` is a time of 0 (00:00, midnight) and the maximum value is 23:59. Values outside the range throw exceptions, but depending on the specifics the exceptions might originate in the `TimeSpan` construction rather than from validation and coercion of `Time`.
     * 
     * To set the `Time` value in Visual C++ component extensions (C++/CX), you set the `Duration` field of the [TimeSpan](../windows.foundation/timespan.md) structure. `Duration` specifies a time in 100 nanosecond units; write your own logic for converting to and from hours:minutes representations.
     * 
     * Any value you set for `Time` in code or XAML is specifying the initial value shown in the control. In the app at runtime that value is typically set by the user in the time picker's flyout. The time selected by the user is set and the [TimeChanged](timepicker_timechanged.md) event occurs when the user makes a change and presses the check mark button in the time picker flyout to commit their selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
        set => this.put_Time(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as the open [TimePickerFlyout](timepickerflyout.md) of a [TimePicker](timepicker.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets the time currently selected in the time picker.
     * @remarks
     * The time picker control has both [Time](timepicker_time.md)/[TimeChanged](timepicker_timechanged.md) and `SelectedTime`/[SelectedTimeChanged](timepicker_selectedtimechanged.md) APIs. The difference between these is that `Time` is not nullable, while `SelectedTime` is nullable.
     * 
     * The value of `SelectedTime` is used to populate the time picker and is `null` by default. If `SelectedTime` is `null`, the `Time` property is set to a [TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) of 0; otherwise, the `Time` value is synchronized with the `SelectedTime` value. When `SelectedTime` is `null`, the picker is 'unset' and shows the field names instead of a time.
     * 
     * The time won't increment in real-time (like a clock would) unless you provide a code binding to some value that does track the current time while the app is running.
     * 
     * You can set the time value as an attribute in XAML. This is probably easiest if you're already declaring the [TimePicker](timepicker.md) object in XAML and aren't using bindings for the time value. Use a string in the form *Hh*:*Mm* where *Hh* is hours and can be between 0 and 23 and *Mm* is minutes and can be between 0 and 59. A "0" can be the initial character in either *Hh* or *Mm* and is typically included for clarity of any values 0 thru 9. For example, "9:5" and "09:05" are both valid and represent the same time, but "09:05" is easier to read in markup.
     * 
     * To set the time in code, you have different techniques available depending on your programming language. The value is represented as [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) for C# and Visual Basic, or [Windows.Foundation.TimeSpan](../windows.foundation/timespan.md) for Visual C++ component extensions (C++/CX). Probably the easiest way to produce a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) value that's appropriate for `SelectedTime` is to use the [TimeSpan.Parse](/dotnet/api/system.timespan.parse?view=dotnet-uwp-10.0&preserve-view=true)static method. Use a string in the form *Hh*:*Mm* (hours:minutes).
     * 
     * Whether set in code or XAML, the [TimePicker](timepicker.md) class has coercion logic for the value it preserves when you attempt to set it. Any days values are ignored. Seconds values are ignored (for example seconds over 30 are not rounded up to the next minute). Fractional seconds are ignored. Values do not wrap around (for example a value of "24:00" is invalid.) The minimum value within the `TimeSpan` is a time of 0 (00:00, midnight) and the maximum value is 23:59. Values outside the range throw exceptions, but depending on the specifics the exceptions might originate in the `TimeSpan` construction rather than from validation and coercion of `SelectedTime`.
     * 
     * To set the `SelectedTime` value in Visual C++ component extensions (C++/CX), you set the `Duration` field of the [TimeSpan](../windows.foundation/timespan.md) structure. `Duration` specifies a time in 100 nanosecond units; write your own logic for converting to and from hours:minutes representations.
     * 
     * Any value you set for `SelectedTime` in code or XAML is specifying the initial value shown in the control. In the app at runtime that value is typically set by the user in the time picker's flyout. The time selected by the user is set and the [SelectedTimeChanged](timepicker_selectedtimechanged.md) event occurs when the user makes a change and presses the check mark button in the time picker flyout to commit their selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepicker.selectedtime
     * @type {IReference<TimeSpan>} 
     */
    SelectedTime {
        get => this.get_SelectedTime()
        set => this.put_SelectedTime(value)
    }

    /**
     * Occurs when the value of the `Time` property is changed.
     * @type {EventHandler<TimePickerValueChangedEventArgs>}
    */
    OnTimeChanged {
        get {
            if(!this.HasProp("__OnTimeChanged")){
                this.__OnTimeChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{9e04bd68-463c-54d5-8fb7-847ff25462cb}"),
                    IInspectable,
                    TimePickerValueChangedEventArgs
                )
                this.__OnTimeChangedToken := this.add_TimeChanged(this.__OnTimeChanged.iface)
            }
            return this.__OnTimeChanged
        }
    }

    /**
     * Occurs when the value of the `SelectedTime` property is changed.
     * @type {TypedEventHandler<TimePicker, TimePickerSelectedValueChangedEventArgs>}
    */
    OnSelectedTimeChanged {
        get {
            if(!this.HasProp("__OnSelectedTimeChanged")){
                this.__OnSelectedTimeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e9531083-d552-58c0-b29a-7e9cddfd3b24}"),
                    TimePicker,
                    TimePickerSelectedValueChangedEventArgs
                )
                this.__OnSelectedTimeChangedToken := this.add_SelectedTimeChanged(this.__OnSelectedTimeChanged.iface)
            }
            return this.__OnSelectedTimeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTimeChangedToken")) {
            this.remove_TimeChanged(this.__OnTimeChangedToken)
            this.__OnTimeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSelectedTimeChangedToken")) {
            this.remove_SelectedTimeChanged(this.__OnSelectedTimeChangedToken)
            this.__OnSelectedTimeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClockIdentifier() {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.get_ClockIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ClockIdentifier(value) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.put_ClockIdentifier(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinuteIncrement() {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.get_MinuteIncrement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinuteIncrement(value) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.put_MinuteIncrement(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.get_Time()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Time(value) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.put_Time(value)
    }

    /**
     * 
     * @param {EventHandler<TimePickerValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimeChanged(handler) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.add_TimeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TimeChanged(token) {
        if (!this.HasProp("__ITimePicker")) {
            if ((queryResult := this.QueryInterface(ITimePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker := ITimePicker(outPtr)
        }

        return this.__ITimePicker.remove_TimeChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__ITimePicker2")) {
            if ((queryResult := this.QueryInterface(ITimePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker2 := ITimePicker2(outPtr)
        }

        return this.__ITimePicker2.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__ITimePicker2")) {
            if ((queryResult := this.QueryInterface(ITimePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker2 := ITimePicker2(outPtr)
        }

        return this.__ITimePicker2.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SelectedTime() {
        if (!this.HasProp("__ITimePicker3")) {
            if ((queryResult := this.QueryInterface(ITimePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker3 := ITimePicker3(outPtr)
        }

        return this.__ITimePicker3.get_SelectedTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SelectedTime(value) {
        if (!this.HasProp("__ITimePicker3")) {
            if ((queryResult := this.QueryInterface(ITimePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker3 := ITimePicker3(outPtr)
        }

        return this.__ITimePicker3.put_SelectedTime(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TimePicker, TimePickerSelectedValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectedTimeChanged(handler) {
        if (!this.HasProp("__ITimePicker3")) {
            if ((queryResult := this.QueryInterface(ITimePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker3 := ITimePicker3(outPtr)
        }

        return this.__ITimePicker3.add_SelectedTimeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectedTimeChanged(token) {
        if (!this.HasProp("__ITimePicker3")) {
            if ((queryResult := this.QueryInterface(ITimePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePicker3 := ITimePicker3(outPtr)
        }

        return this.__ITimePicker3.remove_SelectedTimeChanged(token)
    }

;@endregion Instance Methods
}
