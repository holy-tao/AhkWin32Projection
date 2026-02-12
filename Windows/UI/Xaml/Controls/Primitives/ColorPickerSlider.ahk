#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Slider.ahk
#Include .\IColorPickerSlider.ahk
#Include .\IColorPickerSliderFactory.ahk
#Include .\IColorPickerSliderStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a slider in a [ColorPicker](../windows.ui.xaml.controls/colorpicker.md) control.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorPickerSlider](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorpickerslider) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorpickerslider
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ColorPickerSlider extends Slider {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorPickerSlider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorPickerSlider.IID

    /**
     * Identifies the ColorChannel dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorPickerSlider.ColorChannelProperty](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorpickerslider.colorchannelproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorpickerslider.colorchannelproperty
     * @type {DependencyProperty} 
     */
    static ColorChannelProperty {
        get => ColorPickerSlider.get_ColorChannelProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ColorPickerSlider} 
     */
    static CreateInstance() {
        if (!ColorPickerSlider.HasProp("__IColorPickerSliderFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorPickerSlider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerSliderFactory.IID)
            ColorPickerSlider.__IColorPickerSliderFactory := IColorPickerSliderFactory(factoryPtr)
        }

        return ColorPickerSlider.__IColorPickerSliderFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorChannelProperty() {
        if (!ColorPickerSlider.HasProp("__IColorPickerSliderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ColorPickerSlider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPickerSliderStatics.IID)
            ColorPickerSlider.__IColorPickerSliderStatics := IColorPickerSliderStatics(factoryPtr)
        }

        return ColorPickerSlider.__IColorPickerSliderStatics.get_ColorChannelProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates which color channel the slider modifies.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.ColorPickerSlider.ColorChannel](/windows/winui/api/microsoft.ui.xaml.controls.primitives.colorpickerslider.colorchannel) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.colorpickerslider.colorchannel
     * @type {Integer} 
     */
    ColorChannel {
        get => this.get_ColorChannel()
        set => this.put_ColorChannel(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorChannel() {
        if (!this.HasProp("__IColorPickerSlider")) {
            if ((queryResult := this.QueryInterface(IColorPickerSlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPickerSlider := IColorPickerSlider(outPtr)
        }

        return this.__IColorPickerSlider.get_ColorChannel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorChannel(value) {
        if (!this.HasProp("__IColorPickerSlider")) {
            if ((queryResult := this.QueryInterface(IColorPickerSlider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPickerSlider := IColorPickerSlider(outPtr)
        }

        return this.__IColorPickerSlider.put_ColorChannel(value)
    }

;@endregion Instance Methods
}
