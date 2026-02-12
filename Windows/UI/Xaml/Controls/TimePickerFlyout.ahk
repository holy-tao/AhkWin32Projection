#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\PickerFlyoutBase.ahk
#Include .\ITimePickerFlyout.ahk
#Include .\ITimePickerFlyoutStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TimePickerFlyout.ahk
#Include .\TimePickedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that allows a user to pick a time value.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TimePickerFlyout extends PickerFlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimePickerFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimePickerFlyout.IID

    /**
     * Gets the identifier for the [ClockIdentifier](timepickerflyout_clockidentifier.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.clockidentifierproperty
     * @type {DependencyProperty} 
     */
    static ClockIdentifierProperty {
        get => TimePickerFlyout.get_ClockIdentifierProperty()
    }

    /**
     * Gets the identifier for the [Time](timepickerflyout_time.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.timeproperty
     * @type {DependencyProperty} 
     */
    static TimeProperty {
        get => TimePickerFlyout.get_TimeProperty()
    }

    /**
     * Gets the identifier for the [MinuteIncrement](timepickerflyout_minuteincrement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.minuteincrementproperty
     * @type {DependencyProperty} 
     */
    static MinuteIncrementProperty {
        get => TimePickerFlyout.get_MinuteIncrementProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ClockIdentifierProperty() {
        if (!TimePickerFlyout.HasProp("__ITimePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerFlyoutStatics.IID)
            TimePickerFlyout.__ITimePickerFlyoutStatics := ITimePickerFlyoutStatics(factoryPtr)
        }

        return TimePickerFlyout.__ITimePickerFlyoutStatics.get_ClockIdentifierProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TimeProperty() {
        if (!TimePickerFlyout.HasProp("__ITimePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerFlyoutStatics.IID)
            TimePickerFlyout.__ITimePickerFlyoutStatics := ITimePickerFlyoutStatics(factoryPtr)
        }

        return TimePickerFlyout.__ITimePickerFlyoutStatics.get_TimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinuteIncrementProperty() {
        if (!TimePickerFlyout.HasProp("__ITimePickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimePickerFlyoutStatics.IID)
            TimePickerFlyout.__ITimePickerFlyoutStatics := ITimePickerFlyoutStatics(factoryPtr)
        }

        return TimePickerFlyout.__ITimePickerFlyoutStatics.get_MinuteIncrementProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the clock system to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.clockidentifier
     * @type {HSTRING} 
     */
    ClockIdentifier {
        get => this.get_ClockIdentifier()
        set => this.put_ClockIdentifier(value)
    }

    /**
     * Gets or sets the time currently set in the time picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
        set => this.put_Time(value)
    }

    /**
     * Gets or sets a value that indicates the time increments shown in the minute picker. For example, 15 specifies that minute picker displays only the choices 00, 15, 30, 45.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.minuteincrement
     * @type {Integer} 
     */
    MinuteIncrement {
        get => this.get_MinuteIncrement()
        set => this.put_MinuteIncrement(value)
    }

    /**
     * Occurs when the user has selected a time in the time picker flyout.
     * @type {TypedEventHandler<TimePickerFlyout, TimePickedEventArgs>}
    */
    OnTimePicked {
        get {
            if(!this.HasProp("__OnTimePicked")){
                this.__OnTimePicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7d77980b-a0df-51b1-879b-c23d2de0abbe}"),
                    TimePickerFlyout,
                    TimePickedEventArgs
                )
                this.__OnTimePickedToken := this.add_TimePicked(this.__OnTimePicked.iface)
            }
            return this.__OnTimePicked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimePickerFlyout](timepickerflyout.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TimePickerFlyout")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTimePickedToken")) {
            this.remove_TimePicked(this.__OnTimePickedToken)
            this.__OnTimePicked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClockIdentifier() {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.get_ClockIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ClockIdentifier(value) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.put_ClockIdentifier(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.get_Time()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Time(value) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.put_Time(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinuteIncrement() {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.get_MinuteIncrement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinuteIncrement(value) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.put_MinuteIncrement(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TimePickerFlyout, TimePickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimePicked(handler) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.add_TimePicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TimePicked(token) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.remove_TimePicked(token)
    }

    /**
     * Begins an asynchronous operation to show the flyout placed in relation to the specified element.
     * @param {FrameworkElement} target The element to use as the flyout's placement target.
     * @returns {IAsyncOperation<IReference<TimeSpan>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.timepickerflyout.showatasync
     */
    ShowAtAsync(target) {
        if (!this.HasProp("__ITimePickerFlyout")) {
            if ((queryResult := this.QueryInterface(ITimePickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimePickerFlyout := ITimePickerFlyout(outPtr)
        }

        return this.__ITimePickerFlyout.ShowAtAsync(target)
    }

;@endregion Instance Methods
}
