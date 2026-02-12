#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\RangeBase.ahk
#Include .\ISlider.ahk
#Include .\ISlider2.ahk
#Include .\ISliderStatics2.ahk
#Include .\ISliderFactory.ahk
#Include .\ISliderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that lets the user select from a range of values by moving a [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) control along a track.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Sliders](/windows/uwp/design/controls-and-patterns/slider).
 * 
 * Slider is a control that lets the user select from a range of values by moving a [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) control along a track.
 * 
 * <img alt="Slider control" src="images/controls/Slider.png" />
 * 
 * Use a Slider control when you want your users to be able to set defined, contiguous values (such as volume or brightness) or a range of discrete values (such as screen resolution settings). Sliders are for user interaction. If a user can't ever change the value, use read-only text instead. For more information on when to use a Slider, see [Guidelines for sliders](/windows/uwp/controls-and-patterns/slider).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Slider extends RangeBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISlider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISlider.IID

    /**
     * Identifies the [Header](slider_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => Slider.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](slider_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => Slider.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [IntermediateValue](slider_intermediatevalue.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.intermediatevalueproperty
     * @type {DependencyProperty} 
     */
    static IntermediateValueProperty {
        get => Slider.get_IntermediateValueProperty()
    }

    /**
     * Identifies the [StepFrequency](slider_stepfrequency.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.stepfrequencyproperty
     * @type {DependencyProperty} 
     */
    static StepFrequencyProperty {
        get => Slider.get_StepFrequencyProperty()
    }

    /**
     * Identifies the [SnapsTo](slider_snapsto.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.snapstoproperty
     * @type {DependencyProperty} 
     */
    static SnapsToProperty {
        get => Slider.get_SnapsToProperty()
    }

    /**
     * Identifies the [TickFrequency](slider_tickfrequency.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.tickfrequencyproperty
     * @type {DependencyProperty} 
     */
    static TickFrequencyProperty {
        get => Slider.get_TickFrequencyProperty()
    }

    /**
     * Identifies the [TickPlacement](slider_tickplacement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.tickplacementproperty
     * @type {DependencyProperty} 
     */
    static TickPlacementProperty {
        get => Slider.get_TickPlacementProperty()
    }

    /**
     * Identifies the [Orientation](slider_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => Slider.get_OrientationProperty()
    }

    /**
     * Identifies the [IsDirectionReversed](slider_isdirectionreversed.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.isdirectionreversedproperty
     * @type {DependencyProperty} 
     */
    static IsDirectionReversedProperty {
        get => Slider.get_IsDirectionReversedProperty()
    }

    /**
     * Identifies the [IsThumbToolTipEnabled](slider_isthumbtooltipenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.isthumbtooltipenabledproperty
     * @type {DependencyProperty} 
     */
    static IsThumbToolTipEnabledProperty {
        get => Slider.get_IsThumbToolTipEnabledProperty()
    }

    /**
     * Identifies the [ThumbToolTipValueConverter](slider_thumbtooltipvalueconverter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.thumbtooltipvalueconverterproperty
     * @type {DependencyProperty} 
     */
    static ThumbToolTipValueConverterProperty {
        get => Slider.get_ThumbToolTipValueConverterProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!Slider.HasProp("__ISliderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics2.IID)
            Slider.__ISliderStatics2 := ISliderStatics2(factoryPtr)
        }

        return Slider.__ISliderStatics2.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!Slider.HasProp("__ISliderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics2.IID)
            Slider.__ISliderStatics2 := ISliderStatics2(factoryPtr)
        }

        return Slider.__ISliderStatics2.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {Slider} 
     */
    static CreateInstance() {
        if (!Slider.HasProp("__ISliderFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderFactory.IID)
            Slider.__ISliderFactory := ISliderFactory(factoryPtr)
        }

        return Slider.__ISliderFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IntermediateValueProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_IntermediateValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StepFrequencyProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_StepFrequencyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SnapsToProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_SnapsToProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TickFrequencyProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_TickFrequencyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TickPlacementProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_TickPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDirectionReversedProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_IsDirectionReversedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsThumbToolTipEnabledProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_IsThumbToolTipEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ThumbToolTipValueConverterProperty() {
        if (!Slider.HasProp("__ISliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Slider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISliderStatics.IID)
            Slider.__ISliderStatics := ISliderStatics(factoryPtr)
        }

        return Slider.__ISliderStatics.get_ThumbToolTipValueConverterProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the value of the [Slider](slider.md) while the user is interacting with it, before the value is snapped to either the tick or step value. The value the [Slider](slider.md) snaps to is specified by the [SnapsTo](slider_snapsto.md) property.
     * @remarks
     * Use this property to get the value of the [Slider](slider.md) while the user is interacting with it, before the value is snapped to either the tick or step value (as specified by the [SnapsTo](slider_snapsto.md) property).
     * 
     * This property isn't typically set in XAML. It could be useful though as an element binding source for another XAML UI element that displays the IntermediateValue value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.intermediatevalue
     * @type {Float} 
     */
    IntermediateValue {
        get => this.get_IntermediateValue()
        set => this.put_IntermediateValue(value)
    }

    /**
     * Gets or sets the value part of a value range that steps should be created for.
     * @remarks
     * When the [SnapsTo](slider_snapsto.md) property is set to [StepValues](../windows.ui.xaml.controls.primitives/slidersnapsto.md), set the StepFrequency property to specify the interval between snap points.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.stepfrequency
     * @type {Float} 
     */
    StepFrequency {
        get => this.get_StepFrequency()
        set => this.put_StepFrequency(value)
    }

    /**
     * Gets or sets a value that indicates how the [Slider](slider.md) conforms the thumb position to its steps or tick marks.
     * @remarks
     * Set the SnapsTo property to specify whether the [Slider](slider.md) snaps to tick marks or step values. Set the [TickFrequency](slider_tickfrequency.md) or [StepFrequency](slider_stepfrequency.md) property to specify the interval between snap points.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.snapsto
     * @type {Integer} 
     */
    SnapsTo {
        get => this.get_SnapsTo()
        set => this.put_SnapsTo(value)
    }

    /**
     * Gets or sets the increment of the value range that ticks should be created for.
     * @remarks
     * Set the TickFrequency property to specify at which values tick marks are drawn on a [Slider](slider.md). For example, if a [Slider](slider.md) has [Minimum](../windows.ui.xaml.controls.primitives/rangebase_minimum.md) of 0, [Maximum](../windows.ui.xaml.controls.primitives/rangebase_maximum.md) of 20, and TickFrequency of 2, tick marks are placed at every other step value, starting at 0 and ending at 20.
     * 
     * The drawing of tick marks on a slider depends on both the TickFrequency and [TickPlacement](slider_tickplacement.md) properties. In order for tick marks to be shown, you must set the TickFrequency property to a value greater than 0, and the [TickPlacement](slider_tickplacement.md) property to a value other than **None**.
     * 
     * To prevent tick marks from being packed too densely, the [Slider](slider.md) will only show tick marks that are a minimum of 20 pixels apart. If a combination of [Slider](slider.md) size, value range, and tick frequency results in tick marks that are too close together, some tick marks are not shown.
     * 
     * When the [SnapsTo](slider_snapsto.md) property is set to [Ticks](../windows.ui.xaml.controls.primitives/slidersnapsto.md), the TickFrequency property also specifies the interval between snap points.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.tickfrequency
     * @type {Float} 
     */
    TickFrequency {
        get => this.get_TickFrequency()
        set => this.put_TickFrequency(value)
    }

    /**
     * Gets or sets a value that indicates where to draw tick marks in relation to the track.
     * @remarks
     * The drawing of tick marks on a slider depends on both the [TickFrequency](slider_tickfrequency.md) and TickPlacement properties. In order for tick marks to be shown, you must set the [TickFrequency](slider_tickfrequency.md) property to a value greater than 0, and the TickPlacement property to a value other than **None**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.tickplacement
     * @type {Integer} 
     */
    TickPlacement {
        get => this.get_TickPlacement()
        set => this.put_TickPlacement(value)
    }

    /**
     * Gets or sets the orientation of a [Slider](slider.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets a value that indicates the direction of increasing value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.isdirectionreversed
     * @type {Boolean} 
     */
    IsDirectionReversed {
        get => this.get_IsDirectionReversed()
        set => this.put_IsDirectionReversed(value)
    }

    /**
     * Gets or sets a value that determines whether the slider value is shown in a tool tip for the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) component of the [Slider](slider.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.isthumbtooltipenabled
     * @type {Boolean} 
     */
    IsThumbToolTipEnabled {
        get => this.get_IsThumbToolTipEnabled()
        set => this.put_IsThumbToolTipEnabled(value)
    }

    /**
     * Gets or sets the converter logic that converts the range value of the [Slider](slider.md) into tool tip content.
     * @remarks
     * By default, the [Slider](slider.md)'s thumb tooltip shows the numeric value of the slider. To show other values in the thumb tooltip, you create a custom value converter and assign it to the ThumbToolTipValueConverter property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.thumbtooltipvalueconverter
     * @type {IValueConverter} 
     */
    ThumbToolTipValueConverter {
        get => this.get_ThumbToolTipValueConverter()
        set => this.put_ThumbToolTipValueConverter(value)
    }

    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](slider_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.slider.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IntermediateValue() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_IntermediateValue()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_IntermediateValue(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_IntermediateValue(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StepFrequency() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_StepFrequency()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StepFrequency(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_StepFrequency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SnapsTo() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_SnapsTo()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SnapsTo(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_SnapsTo(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TickFrequency() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_TickFrequency()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TickFrequency(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_TickFrequency(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TickPlacement() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_TickPlacement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TickPlacement(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_TickPlacement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_Orientation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDirectionReversed() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_IsDirectionReversed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDirectionReversed(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_IsDirectionReversed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbToolTipEnabled() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_IsThumbToolTipEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsThumbToolTipEnabled(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_IsThumbToolTipEnabled(value)
    }

    /**
     * 
     * @returns {IValueConverter} 
     */
    get_ThumbToolTipValueConverter() {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.get_ThumbToolTipValueConverter()
    }

    /**
     * 
     * @param {IValueConverter} value 
     * @returns {HRESULT} 
     */
    put_ThumbToolTipValueConverter(value) {
        if (!this.HasProp("__ISlider")) {
            if ((queryResult := this.QueryInterface(ISlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider := ISlider(outPtr)
        }

        return this.__ISlider.put_ThumbToolTipValueConverter(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__ISlider2")) {
            if ((queryResult := this.QueryInterface(ISlider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider2 := ISlider2(outPtr)
        }

        return this.__ISlider2.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__ISlider2")) {
            if ((queryResult := this.QueryInterface(ISlider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider2 := ISlider2(outPtr)
        }

        return this.__ISlider2.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__ISlider2")) {
            if ((queryResult := this.QueryInterface(ISlider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider2 := ISlider2(outPtr)
        }

        return this.__ISlider2.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__ISlider2")) {
            if ((queryResult := this.QueryInterface(ISlider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlider2 := ISlider2(outPtr)
        }

        return this.__ISlider2.put_HeaderTemplate(value)
    }

;@endregion Instance Methods
}
