#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the Hue-Saturation-Value (HSV) color components are mapped onto the [ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md).
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorSpectrumComponents](/windows/winui/api/microsoft.ui.xaml.controls.colorspectrumcomponents) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * The order of the two components in each value indicates the X/Y axis when the spectrum is a box, or the degree/radius when the spectrum is a ring.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorspectrumcomponents
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColorSpectrumComponents extends Win32Enum{

    /**
     * Hue is mapped to the X axis. Value is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static HueValue => 0

    /**
     * Value is mapped to the X axis. Hue is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static ValueHue => 1

    /**
     * Hue is mapped to the X axis. Saturation is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static HueSaturation => 2

    /**
     * Saturation is mapped to the X axis. Hue is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static SaturationHue => 3

    /**
     * Saturation is mapped to the X axis. Value is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static SaturationValue => 4

    /**
     * Value is mapped to the X axis. Saturation is mapped to the Y axis.
     * @type {Integer (Int32)}
     */
    static ValueSaturation => 5
}
