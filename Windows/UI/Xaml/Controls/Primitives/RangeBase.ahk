#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Control.ahk
#Include .\IRangeBase.ahk
#Include .\IRangeBaseOverrides.ahk
#Include .\IRangeBaseStatics.ahk
#Include .\RangeBaseValueChangedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\RangeBaseValueChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an element that has a value within a specific range, such as the [ProgressBar](../windows.ui.xaml.controls/progressbar.md), [ScrollBar](scrollbar.md), and [Slider](../windows.ui.xaml.controls/slider.md) controls.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class RangeBase extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRangeBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRangeBase.IID

    /**
     * Identifies the [Minimum](rangebase_minimum.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.minimumproperty
     * @type {DependencyProperty} 
     */
    static MinimumProperty {
        get => RangeBase.get_MinimumProperty()
    }

    /**
     * Identifies the [Maximum](rangebase_maximum.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.maximumproperty
     * @type {DependencyProperty} 
     */
    static MaximumProperty {
        get => RangeBase.get_MaximumProperty()
    }

    /**
     * Identifies the [SmallChange](rangebase_smallchange.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.smallchangeproperty
     * @type {DependencyProperty} 
     */
    static SmallChangeProperty {
        get => RangeBase.get_SmallChangeProperty()
    }

    /**
     * Identifies the [LargeChange](rangebase_largechange.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.largechangeproperty
     * @type {DependencyProperty} 
     */
    static LargeChangeProperty {
        get => RangeBase.get_LargeChangeProperty()
    }

    /**
     * Identifies the [Value](rangebase_value.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => RangeBase.get_ValueProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinimumProperty() {
        if (!RangeBase.HasProp("__IRangeBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RangeBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseStatics.IID)
            RangeBase.__IRangeBaseStatics := IRangeBaseStatics(factoryPtr)
        }

        return RangeBase.__IRangeBaseStatics.get_MinimumProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaximumProperty() {
        if (!RangeBase.HasProp("__IRangeBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RangeBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseStatics.IID)
            RangeBase.__IRangeBaseStatics := IRangeBaseStatics(factoryPtr)
        }

        return RangeBase.__IRangeBaseStatics.get_MaximumProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SmallChangeProperty() {
        if (!RangeBase.HasProp("__IRangeBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RangeBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseStatics.IID)
            RangeBase.__IRangeBaseStatics := IRangeBaseStatics(factoryPtr)
        }

        return RangeBase.__IRangeBaseStatics.get_SmallChangeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LargeChangeProperty() {
        if (!RangeBase.HasProp("__IRangeBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RangeBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseStatics.IID)
            RangeBase.__IRangeBaseStatics := IRangeBaseStatics(factoryPtr)
        }

        return RangeBase.__IRangeBaseStatics.get_LargeChangeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!RangeBase.HasProp("__IRangeBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.RangeBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseStatics.IID)
            RangeBase.__IRangeBaseStatics := IRangeBaseStatics(factoryPtr)
        }

        return RangeBase.__IRangeBaseStatics.get_ValueProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Minimum possible [Value](rangebase_value.md) of the range element.
     * @remarks
     * > [!NOTE]
     * > When binding Minimum and [Maximum](rangebase_maximum.md) values in Extensible Application Markup Language (XAML), declare the [Binding](../windows.ui.xaml.data/binding.md) for [Maximum](rangebase_maximum.md) first. If the [Binding](../windows.ui.xaml.data/binding.md) for [Maximum](rangebase_maximum.md) is declared after Minimum, the bound value for [Maximum](rangebase_maximum.md) is ignored and the following situations can occur: + If the bound Minimum value is negative, the [Maximum](rangebase_maximum.md) value is set to 0.
     * + If the bound Minimum value is greater than the default [Maximum](rangebase_maximum.md) (100 for [Slider](../windows.ui.xaml.controls/slider.md) and [ProgressBar](../windows.ui.xaml.controls/progressbar.md)), the [Maximum](rangebase_maximum.md) value is set equal to the Minimum value.
     * To avoid this behavior, declare the [Binding](../windows.ui.xaml.data/binding.md) for [Maximum](rangebase_maximum.md) first in your Extensible Application Markup Language (XAML).
     * 
     * These behaviors can also occur if you set the Minimum value without also explicitly setting the [Maximum](rangebase_maximum.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.minimum
     * @type {Float} 
     */
    Minimum {
        get => this.get_Minimum()
        set => this.put_Minimum(value)
    }

    /**
     * Gets or sets the highest possible [Value](rangebase_value.md) of the range element.
     * @remarks
     * [Slider](../windows.ui.xaml.controls/slider.md) and [ProgressBar](../windows.ui.xaml.controls/progressbar.md) override the metadata of this property and set its default to 100. For more information, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * 
     * > [!NOTE]
     * > When binding [Minimum](rangebase_minimum.md) and Maximum values in Extensible Application Markup Language (XAML), declare the [Binding](../windows.ui.xaml.data/binding.md) for Maximum first. If the [Binding](../windows.ui.xaml.data/binding.md) for Maximum is declared after [Minimum](rangebase_minimum.md), the bound value for Maximum is ignored and the following situations can occur: + If the bound [Minimum](rangebase_minimum.md) value is negative, the Maximum value is set to 0.
     * + If the bound [Minimum](rangebase_minimum.md) value is greater than the default Maximum (100 for [Slider](../windows.ui.xaml.controls/slider.md) and [ProgressBar](../windows.ui.xaml.controls/progressbar.md)), the Maximum value is set equal to the [Minimum](rangebase_minimum.md) value.
     * To avoid this behavior, declare the [Binding](../windows.ui.xaml.data/binding.md) for Maximum first in your Extensible Application Markup Language (XAML).
     * 
     * These behaviors can also occur if you set the [Minimum](rangebase_minimum.md) value without also explicitly setting the Maximum value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.maximum
     * @type {Float} 
     */
    Maximum {
        get => this.get_Maximum()
        set => this.put_Maximum(value)
    }

    /**
     * Gets or sets a [Value](rangebase_value.md) to be added to or subtracted from the [Value](rangebase_value.md) of a [RangeBase](rangebase.md) control.
     * @remarks
     * [Slider](../windows.ui.xaml.controls/slider.md) overrides the metadata of this property and sets its default to 1. For more information, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.smallchange
     * @type {Float} 
     */
    SmallChange {
        get => this.get_SmallChange()
        set => this.put_SmallChange(value)
    }

    /**
     * Gets or sets a value to be added to or subtracted from the [Value](rangebase_value.md) of a [RangeBase](rangebase.md) control.
     * @remarks
     * [Slider](../windows.ui.xaml.controls/slider.md) overrides the metadata of this property and sets its default to 10. For more information, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.largechange
     * @type {Float} 
     */
    LargeChange {
        get => this.get_LargeChange()
        set => this.put_LargeChange(value)
    }

    /**
     * Gets or sets the current setting of the range control, which may be coerced.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Occurs when the range value changes.
     * @type {RangeBaseValueChangedEventHandler}
    */
    OnValueChanged {
        get {
            if(!this.HasProp("__OnValueChanged")){
                this.__OnValueChanged := WinRTEventHandler(
                    RangeBaseValueChangedEventHandler,
                    RangeBaseValueChangedEventHandler.IID,
                    IInspectable,
                    RangeBaseValueChangedEventArgs
                )
                this.__OnValueChangedToken := this.add_ValueChanged(this.__OnValueChanged.iface)
            }
            return this.__OnValueChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnValueChangedToken")) {
            this.remove_ValueChanged(this.__OnValueChangedToken)
            this.__OnValueChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Minimum() {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.get_Minimum()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Minimum(value) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.put_Minimum(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Maximum() {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.get_Maximum()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Maximum(value) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.put_Maximum(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SmallChange() {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.get_SmallChange()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SmallChange(value) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.put_SmallChange(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LargeChange() {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.get_LargeChange()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LargeChange(value) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.put_LargeChange(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.get_Value()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.put_Value(value)
    }

    /**
     * 
     * @param {RangeBaseValueChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(handler) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.add_ValueChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(token) {
        if (!this.HasProp("__IRangeBase")) {
            if ((queryResult := this.QueryInterface(IRangeBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBase := IRangeBase(outPtr)
        }

        return this.__IRangeBase.remove_ValueChanged(token)
    }

    /**
     * Called when the [Minimum](rangebase_minimum.md) property changes.
     * @param {Float} oldMinimum Old value of the [Minimum](rangebase_minimum.md) property.
     * @param {Float} newMinimum New value of the [Minimum](rangebase_minimum.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.onminimumchanged
     */
    OnMinimumChanged(oldMinimum, newMinimum) {
        if (!this.HasProp("__IRangeBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IRangeBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBaseOverrides := IRangeBaseOverrides(outPtr)
        }

        return this.__IRangeBaseOverrides.OnMinimumChanged(oldMinimum, newMinimum)
    }

    /**
     * Called when the [Maximum](rangebase_maximum.md) property changes.
     * @param {Float} oldMaximum Old value of the [Maximum](rangebase_maximum.md) property.
     * @param {Float} newMaximum New value of the [Maximum](rangebase_maximum.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.onmaximumchanged
     */
    OnMaximumChanged(oldMaximum, newMaximum) {
        if (!this.HasProp("__IRangeBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IRangeBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBaseOverrides := IRangeBaseOverrides(outPtr)
        }

        return this.__IRangeBaseOverrides.OnMaximumChanged(oldMaximum, newMaximum)
    }

    /**
     * Fires the [ValueChanged](rangebase_valuechanged.md) routed event.
     * @param {Float} oldValue Old value of the [Value](rangebase_value.md) property.
     * @param {Float} newValue New value of the [Value](rangebase_value.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebase.onvaluechanged
     */
    OnValueChanged(oldValue, newValue) {
        if (!this.HasProp("__IRangeBaseOverrides")) {
            if ((queryResult := this.QueryInterface(IRangeBaseOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBaseOverrides := IRangeBaseOverrides(outPtr)
        }

        return this.__IRangeBaseOverrides.OnValueChanged(oldValue, newValue)
    }

;@endregion Instance Methods
}
