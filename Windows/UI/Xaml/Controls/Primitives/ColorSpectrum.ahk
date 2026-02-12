#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Control.ahk
#Include .\IColorSpectrum.ahk
#Include .\IColorSpectrumFactory.ahk
#Include .\IColorSpectrumStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ColorSpectrum.ahk
#Include ..\ColorChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that lets a user choose a color from a visual spectrum.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * ColorSpectrum is a component of the [ColorPicker](../windows.ui.xaml.controls/colorpicker.md) control. Use ColorPicker for a complete color picking experience.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ColorSpectrum extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorSpectrum

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorSpectrum.IID

    /**
     * Identifies the Color dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.ColorProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.colorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.colorproperty
     * @type {DependencyProperty} 
     */
    static ColorProperty {
        get => ColorSpectrum.get_ColorProperty()
    }

    /**
     * Identifies the HsvColor dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.HsvColorProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.hsvcolorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.hsvcolorproperty
     * @type {DependencyProperty} 
     */
    static HsvColorProperty {
        get => ColorSpectrum.get_HsvColorProperty()
    }

    /**
     * Identifies the MinHue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinHueProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minhueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minhueproperty
     * @type {DependencyProperty} 
     */
    static MinHueProperty {
        get => ColorSpectrum.get_MinHueProperty()
    }

    /**
     * Identifies the MaxHue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxHueProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxhueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxhueproperty
     * @type {DependencyProperty} 
     */
    static MaxHueProperty {
        get => ColorSpectrum.get_MaxHueProperty()
    }

    /**
     * Identifies the MinSaturation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinSaturationProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minsaturationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minsaturationproperty
     * @type {DependencyProperty} 
     */
    static MinSaturationProperty {
        get => ColorSpectrum.get_MinSaturationProperty()
    }

    /**
     * Identifies the MaxSaturation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxSaturationProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxsaturationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxsaturationproperty
     * @type {DependencyProperty} 
     */
    static MaxSaturationProperty {
        get => ColorSpectrum.get_MaxSaturationProperty()
    }

    /**
     * Identifies the MinValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minvalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minvalueproperty
     * @type {DependencyProperty} 
     */
    static MinValueProperty {
        get => ColorSpectrum.get_MinValueProperty()
    }

    /**
     * Identifies the MaxValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxvalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxvalueproperty
     * @type {DependencyProperty} 
     */
    static MaxValueProperty {
        get => ColorSpectrum.get_MaxValueProperty()
    }

    /**
     * Identifies the Shape dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.ShapeProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.shapeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.shapeproperty
     * @type {DependencyProperty} 
     */
    static ShapeProperty {
        get => ColorSpectrum.get_ShapeProperty()
    }

    /**
     * Identifies the Components dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.ComponentsProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.componentsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.componentsproperty
     * @type {DependencyProperty} 
     */
    static ComponentsProperty {
        get => ColorSpectrum.get_ComponentsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ColorSpectrum} 
     */
    static CreateInstance() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumFactory.IID)
            ColorSpectrum.__IColorSpectrumFactory := IColorSpectrumFactory(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_ColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HsvColorProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_HsvColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinHueProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MinHueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxHueProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MaxHueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinSaturationProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MinSaturationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxSaturationProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MaxSaturationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinValueProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MinValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxValueProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_MaxValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShapeProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_ShapeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ComponentsProperty() {
        if (!ColorSpectrum.HasProp("__IColorSpectrumStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorSpectrum")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorSpectrumStatics.IID)
            ColorSpectrum.__IColorSpectrumStatics := IColorSpectrumStatics(factoryPtr)
        }

        return ColorSpectrum.__IColorSpectrumStatics.get_ComponentsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the current color value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.Color](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.color) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the current color value as a Vector4.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.HsvColor](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.hsvcolor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.hsvcolor
     * @type {Vector4} 
     */
    HsvColor {
        get => this.get_HsvColor()
        set => this.put_HsvColor(value)
    }

    /**
     * Gets or sets the minimum Hue value in the range 0-359.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinHue](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minhue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Hue values is 0-359. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minhue
     * @type {Integer} 
     */
    MinHue {
        get => this.get_MinHue()
        set => this.put_MinHue(value)
    }

    /**
     * Gets or sets the maximum Hue value in the range 0-359.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxHue](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxhue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Hue values is 0-359. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxhue
     * @type {Integer} 
     */
    MaxHue {
        get => this.get_MaxHue()
        set => this.put_MaxHue(value)
    }

    /**
     * Gets or sets the minimum Saturation value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinSaturation](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minsaturation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Saturation values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minsaturation
     * @type {Integer} 
     */
    MinSaturation {
        get => this.get_MinSaturation()
        set => this.put_MinSaturation(value)
    }

    /**
     * Gets or sets the maximum Saturation value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxSaturation](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxsaturation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Saturation values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxsaturation
     * @type {Integer} 
     */
    MaxSaturation {
        get => this.get_MaxSaturation()
        set => this.put_MaxSaturation(value)
    }

    /**
     * Gets or sets the minimum Value value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MinValue](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.minvalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Value values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.minvalue
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
        set => this.put_MinValue(value)
    }

    /**
     * Gets or sets the maximum Value value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.MaxValue](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.maxvalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Value values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.maxvalue
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
        set => this.put_MaxValue(value)
    }

    /**
     * Gets or sets a value that indicates whether the ColorSpectrum is shown as a square or a circle.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.Shape](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.shape) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.shape
     * @type {Integer} 
     */
    Shape {
        get => this.get_Shape()
        set => this.put_Shape(value)
    }

    /**
     * Gets or sets a value that indicates how the Hue-Saturation-Value (HSV) color components are mapped onto the [ColorSpectrum](colorspectrum.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.Components](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.components) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorspectrum.components
     * @type {Integer} 
     */
    Components {
        get => this.get_Components()
        set => this.put_Components(value)
    }

    /**
     * Occurs when the Color property has changed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum.ColorChanged](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorspectrum.colorchanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<ColorSpectrum, ColorChangedEventArgs>}
    */
    OnColorChanged {
        get {
            if(!this.HasProp("__OnColorChanged")){
                this.__OnColorChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{650cfa09-70c2-5151-a2cd-27570fb9556b}"),
                    ColorSpectrum,
                    ColorChangedEventArgs
                )
                this.__OnColorChangedToken := this.add_ColorChanged(this.__OnColorChanged.iface)
            }
            return this.__OnColorChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnColorChangedToken")) {
            this.remove_ColorChanged(this.__OnColorChangedToken)
            this.__OnColorChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_Color(value)
    }

    /**
     * 
     * @returns {Vector4} 
     */
    get_HsvColor() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_HsvColor()
    }

    /**
     * 
     * @param {Vector4} value 
     * @returns {HRESULT} 
     */
    put_HsvColor(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_HsvColor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinHue() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MinHue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinHue(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MinHue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxHue() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MaxHue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxHue(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MaxHue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinSaturation() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MinSaturation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinSaturation(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MinSaturation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSaturation() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MaxSaturation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxSaturation(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MaxSaturation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MinValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinValue(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MinValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_MaxValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxValue(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_MaxValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Shape() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_Shape()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Shape(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_Shape(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Components() {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.get_Components()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Components(value) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.put_Components(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ColorSpectrum, ColorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorChanged(handler) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.add_ColorChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ColorChanged(token) {
        if (!this.HasProp("__IColorSpectrum")) {
            if ((queryResult := this.QueryInterface(IColorSpectrum.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorSpectrum := IColorSpectrum(outPtr)
        }

        return this.__IColorSpectrum.remove_ColorChanged(token)
    }

;@endregion Instance Methods
}
