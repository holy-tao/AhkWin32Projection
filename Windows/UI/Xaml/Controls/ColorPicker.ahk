#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IColorPicker.ahk
#Include .\IColorPickerStatics.ahk
#Include .\IColorPickerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ColorPicker.ahk
#Include .\ColorChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that lets a user pick a color using a color spectrum, sliders, and text input.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * A color picker is used to browse through and select colors. By default, it lets a user navigate through colors on a color spectrum, or specify a color in either Red-Green-Blue (RGB), Hue-Saturation-Value (HSV), or Hexadecimal textboxes.
 * 
 * For more info about the ColorPicker control, see [Color picker](/windows/uwp/controls-and-patterns/color-picker).
 * 
 * ![The default color picker control](images/controls/color-picker-default.png)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColorPicker extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorPicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorPicker.IID

    /**
     * Identifies the Color dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.colorproperty
     * @type {DependencyProperty} 
     */
    static ColorProperty {
        get => ColorPicker.get_ColorProperty()
    }

    /**
     * Identifies the PreviousColor dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.PreviousColorProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.previouscolorproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.previouscolorproperty
     * @type {DependencyProperty} 
     */
    static PreviousColorProperty {
        get => ColorPicker.get_PreviousColorProperty()
    }

    /**
     * Identifies the IsAlphaEnabled dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaEnabledProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphaenabledproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphaenabledproperty
     * @type {DependencyProperty} 
     */
    static IsAlphaEnabledProperty {
        get => ColorPicker.get_IsAlphaEnabledProperty()
    }

    /**
     * Identifies the IsColorSpectrumVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorSpectrumVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorspectrumvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorspectrumvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsColorSpectrumVisibleProperty {
        get => ColorPicker.get_IsColorSpectrumVisibleProperty()
    }

    /**
     * Identifies the IsColorPreviewVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorPreviewVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorpreviewvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorpreviewvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsColorPreviewVisibleProperty {
        get => ColorPicker.get_IsColorPreviewVisibleProperty()
    }

    /**
     * Identifies the IsColorSliderVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorSliderVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorslidervisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorslidervisibleproperty
     * @type {DependencyProperty} 
     */
    static IsColorSliderVisibleProperty {
        get => ColorPicker.get_IsColorSliderVisibleProperty()
    }

    /**
     * Identifies the IsAlphaSliderVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaSliderVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphaslidervisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphaslidervisibleproperty
     * @type {DependencyProperty} 
     */
    static IsAlphaSliderVisibleProperty {
        get => ColorPicker.get_IsAlphaSliderVisibleProperty()
    }

    /**
     * Identifies the IsMoreButtonVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsMoreButtonVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.ismorebuttonvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.ismorebuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsMoreButtonVisibleProperty {
        get => ColorPicker.get_IsMoreButtonVisibleProperty()
    }

    /**
     * Identifies the IsColorChannelTextInputVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorChannelTextInputVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorchanneltextinputvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorchanneltextinputvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsColorChannelTextInputVisibleProperty {
        get => ColorPicker.get_IsColorChannelTextInputVisibleProperty()
    }

    /**
     * Identifies the IsAlphaTextInputVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaTextInputVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphatextinputvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphatextinputvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsAlphaTextInputVisibleProperty {
        get => ColorPicker.get_IsAlphaTextInputVisibleProperty()
    }

    /**
     * Identifies the IsHexInputVisible dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsHexInputVisibleProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.ishexinputvisibleproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.ishexinputvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsHexInputVisibleProperty {
        get => ColorPicker.get_IsHexInputVisibleProperty()
    }

    /**
     * Identifies the MinHue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinHueProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minhueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minhueproperty
     * @type {DependencyProperty} 
     */
    static MinHueProperty {
        get => ColorPicker.get_MinHueProperty()
    }

    /**
     * Identifies the MaxHue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxHueProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxhueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxhueproperty
     * @type {DependencyProperty} 
     */
    static MaxHueProperty {
        get => ColorPicker.get_MaxHueProperty()
    }

    /**
     * Identifies the MinSaturation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinSaturationProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minsaturationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minsaturationproperty
     * @type {DependencyProperty} 
     */
    static MinSaturationProperty {
        get => ColorPicker.get_MinSaturationProperty()
    }

    /**
     * Identifies the MaxSaturation dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxSaturationProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxsaturationproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxsaturationproperty
     * @type {DependencyProperty} 
     */
    static MaxSaturationProperty {
        get => ColorPicker.get_MaxSaturationProperty()
    }

    /**
     * Identifies the MinValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minvalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minvalueproperty
     * @type {DependencyProperty} 
     */
    static MinValueProperty {
        get => ColorPicker.get_MinValueProperty()
    }

    /**
     * Identifies the MaxValue dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxValueProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxvalueproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxvalueproperty
     * @type {DependencyProperty} 
     */
    static MaxValueProperty {
        get => ColorPicker.get_MaxValueProperty()
    }

    /**
     * Identifies the ColorSpectrumShape dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorSpectrumShapeProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorspectrumshapeproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.colorspectrumshapeproperty
     * @type {DependencyProperty} 
     */
    static ColorSpectrumShapeProperty {
        get => ColorPicker.get_ColorSpectrumShapeProperty()
    }

    /**
     * Identifies the ColorSpectrumComponents dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorSpectrumComponentsProperty](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorspectrumcomponentsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.colorspectrumcomponentsproperty
     * @type {DependencyProperty} 
     */
    static ColorSpectrumComponentsProperty {
        get => ColorPicker.get_ColorSpectrumComponentsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_ColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PreviousColorProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_PreviousColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAlphaEnabledProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsAlphaEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorSpectrumVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsColorSpectrumVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorPreviewVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsColorPreviewVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorSliderVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsColorSliderVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAlphaSliderVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsAlphaSliderVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsMoreButtonVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsMoreButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorChannelTextInputVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsColorChannelTextInputVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAlphaTextInputVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsAlphaTextInputVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHexInputVisibleProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_IsHexInputVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinHueProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MinHueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxHueProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MaxHueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinSaturationProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MinSaturationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxSaturationProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MaxSaturationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinValueProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MinValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxValueProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_MaxValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorSpectrumShapeProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_ColorSpectrumShapeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorSpectrumComponentsProperty() {
        if (!ColorPicker.HasProp("__IColorPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerStatics.IID)
            ColorPicker.__IColorPickerStatics := IColorPickerStatics(factoryPtr)
        }

        return ColorPicker.__IColorPickerStatics.get_ColorSpectrumComponentsProperty()
    }

    /**
     * 
     * @returns {ColorPicker} 
     */
    static CreateInstance() {
        if (!ColorPicker.HasProp("__IColorPickerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColorPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerFactory.IID)
            ColorPicker.__IColorPickerFactory := IColorPickerFactory(factoryPtr)
        }

        return ColorPicker.__IColorPickerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the current color value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.Color](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.color) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the previous color.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.PreviousColor](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.previouscolor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.previouscolor
     * @type {IReference<Color>} 
     */
    PreviousColor {
        get => this.get_PreviousColor()
        set => this.put_PreviousColor(value)
    }

    /**
     * Gets or sets a value that indicates whether the alpha channel can be modified.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaEnabled](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphaenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The **IsAlphaSliderVisible** and **IsAlphaTextInputVisible** properties are ignored if IsAlphaEnabled is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphaenabled
     * @type {Boolean} 
     */
    IsAlphaEnabled {
        get => this.get_IsAlphaEnabled()
        set => this.put_IsAlphaEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the color spectrum control is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorSpectrumVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorspectrumvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorspectrumvisible
     * @type {Boolean} 
     */
    IsColorSpectrumVisible {
        get => this.get_IsColorSpectrumVisible()
        set => this.put_IsColorSpectrumVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the color preview bar is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorPreviewVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorpreviewvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorpreviewvisible
     * @type {Boolean} 
     */
    IsColorPreviewVisible {
        get => this.get_IsColorPreviewVisible()
        set => this.put_IsColorPreviewVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the slider control for the color value is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorSliderVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorslidervisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorslidervisible
     * @type {Boolean} 
     */
    IsColorSliderVisible {
        get => this.get_IsColorSliderVisible()
        set => this.put_IsColorSliderVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the slider control for the alpha channel is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaSliderVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphaslidervisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The **IsAlphaSliderVisible** and **IsAlphaTextInputVisible** properties are ignored if IsAlphaEnabled is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphaslidervisible
     * @type {Boolean} 
     */
    IsAlphaSliderVisible {
        get => this.get_IsAlphaSliderVisible()
        set => this.put_IsAlphaSliderVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the 'more' button is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsMoreButtonVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.ismorebuttonvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.ismorebuttonvisible
     * @type {Boolean} 
     */
    IsMoreButtonVisible {
        get => this.get_IsMoreButtonVisible()
        set => this.put_IsMoreButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the text input boxes for the color channels are shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsColorChannelTextInputVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.iscolorchanneltextinputvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.iscolorchanneltextinputvisible
     * @type {Boolean} 
     */
    IsColorChannelTextInputVisible {
        get => this.get_IsColorChannelTextInputVisible()
        set => this.put_IsColorChannelTextInputVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the text input box for the alpha channel is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsAlphaTextInputVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.isalphatextinputvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The **IsAlphaSliderVisible** and **IsAlphaTextInputVisible** properties are ignored if IsAlphaEnabled is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.isalphatextinputvisible
     * @type {Boolean} 
     */
    IsAlphaTextInputVisible {
        get => this.get_IsAlphaTextInputVisible()
        set => this.put_IsAlphaTextInputVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the text input box for a HEX color value is shown.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.IsHexInputVisible](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.ishexinputvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.ishexinputvisible
     * @type {Boolean} 
     */
    IsHexInputVisible {
        get => this.get_IsHexInputVisible()
        set => this.put_IsHexInputVisible(value)
    }

    /**
     * Gets or sets the minimum Hue value in the range 0-359.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinHue](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minhue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Hue values is 0-359. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minhue
     * @type {Integer} 
     */
    MinHue {
        get => this.get_MinHue()
        set => this.put_MinHue(value)
    }

    /**
     * Gets or sets the maximum Hue value in the range 0-359.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxHue](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxhue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Hue values is 0-359. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxhue
     * @type {Integer} 
     */
    MaxHue {
        get => this.get_MaxHue()
        set => this.put_MaxHue(value)
    }

    /**
     * Gets or sets the minimum Saturation value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinSaturation](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minsaturation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Saturation values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minsaturation
     * @type {Integer} 
     */
    MinSaturation {
        get => this.get_MinSaturation()
        set => this.put_MinSaturation(value)
    }

    /**
     * Gets or sets the maximum Saturation value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxSaturation](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxsaturation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Saturation values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxsaturation
     * @type {Integer} 
     */
    MaxSaturation {
        get => this.get_MaxSaturation()
        set => this.put_MaxSaturation(value)
    }

    /**
     * Gets or sets the minimum Value value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MinValue](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.minvalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Value values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.minvalue
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
        set => this.put_MinValue(value)
    }

    /**
     * Gets or sets the maximum Value value in the range 0-100.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.MaxValue](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.maxvalue) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The valid range for Value values is 0-100. Setting a value outside of this range will cause an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.maxvalue
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
        set => this.put_MaxValue(value)
    }

    /**
     * Gets or sets a value that indicates whether the ColorSpectrum is shown as a square or a circle.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorSpectrumShape](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorspectrumshape) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.colorspectrumshape
     * @type {Integer} 
     */
    ColorSpectrumShape {
        get => this.get_ColorSpectrumShape()
        set => this.put_ColorSpectrumShape(value)
    }

    /**
     * Gets or sets a value that indicates how the Hue-Saturation-Value (HSV) color components are mapped onto the [ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorSpectrumComponents](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorspectrumcomponents) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpicker.colorspectrumcomponents
     * @type {Integer} 
     */
    ColorSpectrumComponents {
        get => this.get_ColorSpectrumComponents()
        set => this.put_ColorSpectrumComponents(value)
    }

    /**
     * Occurs when the Color property has changed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPicker.ColorChanged](/windows/winui/api/microsoft.ui.xaml.controls.colorpicker.colorchanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<ColorPicker, ColorChangedEventArgs>}
    */
    OnColorChanged {
        get {
            if(!this.HasProp("__OnColorChanged")){
                this.__OnColorChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e162d9c5-40b6-5662-82b0-4d2404d3716b}"),
                    ColorPicker,
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
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_Color(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_PreviousColor() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_PreviousColor()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_PreviousColor(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_PreviousColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaEnabled() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsAlphaEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaEnabled(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsAlphaEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorSpectrumVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsColorSpectrumVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorSpectrumVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsColorSpectrumVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorPreviewVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsColorPreviewVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorPreviewVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsColorPreviewVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorSliderVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsColorSliderVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorSliderVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsColorSliderVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaSliderVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsAlphaSliderVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaSliderVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsAlphaSliderVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMoreButtonVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsMoreButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMoreButtonVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsMoreButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorChannelTextInputVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsColorChannelTextInputVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorChannelTextInputVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsColorChannelTextInputVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaTextInputVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsAlphaTextInputVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaTextInputVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsAlphaTextInputVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHexInputVisible() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_IsHexInputVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHexInputVisible(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_IsHexInputVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinHue() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MinHue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinHue(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MinHue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxHue() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MaxHue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxHue(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MaxHue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinSaturation() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MinSaturation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinSaturation(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MinSaturation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSaturation() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MaxSaturation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxSaturation(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MaxSaturation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MinValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinValue(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MinValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_MaxValue()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxValue(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_MaxValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpectrumShape() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_ColorSpectrumShape()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorSpectrumShape(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_ColorSpectrumShape(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpectrumComponents() {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.get_ColorSpectrumComponents()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorSpectrumComponents(value) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.put_ColorSpectrumComponents(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ColorPicker, ColorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorChanged(handler) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.add_ColorChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ColorChanged(token) {
        if (!this.HasProp("__IColorPicker")) {
            if ((queryResult := this.QueryInterface(IColorPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPicker := IColorPicker(outPtr)
        }

        return this.__IColorPicker.remove_ColorChanged(token)
    }

;@endregion Instance Methods
}
