#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBase.ahk
#Include .\IRepeatButton.ahk
#Include .\IRepeatButtonStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a control that raises its [Click](buttonbase_click.md) event repeatedly when it is pressed and held.
 * @remarks
 * A RepeatButton is a button that raises [Click](buttonbase_click.md) events repeatedly from the time it is pressed until it is released. Set the [Delay](repeatbutton_delay.md) property to specify the time that the RepeatButton waits after it is pressed before it starts repeating the click action. Set the [Interval](repeatbutton_interval.md) property to specify the time between repetitions of the click action. Times for both properties are specified in milliseconds.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.repeatbutton
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class RepeatButton extends ButtonBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRepeatButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRepeatButton.IID

    /**
     * Identifies the [Delay](repeatbutton_delay.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.repeatbutton.delayproperty
     * @type {DependencyProperty} 
     */
    static DelayProperty {
        get => RepeatButton.get_DelayProperty()
    }

    /**
     * Identifies the [Interval](repeatbutton_interval.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.repeatbutton.intervalproperty
     * @type {DependencyProperty} 
     */
    static IntervalProperty {
        get => RepeatButton.get_IntervalProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DelayProperty() {
        if (!RepeatButton.HasProp("__IRepeatButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RepeatButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatButtonStatics.IID)
            RepeatButton.__IRepeatButtonStatics := IRepeatButtonStatics(factoryPtr)
        }

        return RepeatButton.__IRepeatButtonStatics.get_DelayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IntervalProperty() {
        if (!RepeatButton.HasProp("__IRepeatButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RepeatButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatButtonStatics.IID)
            RepeatButton.__IRepeatButtonStatics := IRepeatButtonStatics(factoryPtr)
        }

        return RepeatButton.__IRepeatButtonStatics.get_IntervalProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the time, in milliseconds, that the [RepeatButton](repeatbutton.md) waits when it is pressed before it starts repeating the click action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.repeatbutton.delay
     * @type {Integer} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * Gets or sets the time, in milliseconds, between repetitions of the click action, as soon as repeating starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.repeatbutton.interval
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RepeatButton](repeatbutton.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RepeatButton")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Delay() {
        if (!this.HasProp("__IRepeatButton")) {
            if ((queryResult := this.QueryInterface(IRepeatButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepeatButton := IRepeatButton(outPtr)
        }

        return this.__IRepeatButton.get_Delay()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        if (!this.HasProp("__IRepeatButton")) {
            if ((queryResult := this.QueryInterface(IRepeatButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepeatButton := IRepeatButton(outPtr)
        }

        return this.__IRepeatButton.put_Delay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        if (!this.HasProp("__IRepeatButton")) {
            if ((queryResult := this.QueryInterface(IRepeatButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepeatButton := IRepeatButton(outPtr)
        }

        return this.__IRepeatButton.get_Interval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Interval(value) {
        if (!this.HasProp("__IRepeatButton")) {
            if ((queryResult := this.QueryInterface(IRepeatButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepeatButton := IRepeatButton(outPtr)
        }

        return this.__IRepeatButton.put_Interval(value)
    }

;@endregion Instance Methods
}
