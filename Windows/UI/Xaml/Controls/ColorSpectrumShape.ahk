#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the [ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md) control is shown.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorSpectrumShape](/windows/winui/api/microsoft.ui.xaml.controls.colorspectrumshape) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorspectrumshape
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColorSpectrumShape extends Win32Enum{

    /**
     * The [ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md) control is shown as a square.
     * @type {Integer (Int32)}
     */
    static Box => 0

    /**
     * The [ColorSpectrum](../windows.ui.xaml.controls.primitives/colorspectrum.md) control is shown as a circle.
     * @type {Integer (Int32)}
     */
    static Ring => 1
}
