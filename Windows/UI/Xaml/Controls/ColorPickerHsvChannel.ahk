#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines contstants that specify which Hue-Saturation-Value-Alpha component a slider in a [ColorPicker](colorpicker.md) controls.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ColorPickerHsvChannel](/windows/winui/api/microsoft.ui.xaml.controls.colorpickerhsvchannel) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.colorpickerhsvchannel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColorPickerHsvChannel extends Win32Enum{

    /**
     * The slider controls the Hue channel.
     * @type {Integer (Int32)}
     */
    static Hue => 0

    /**
     * The slider controls the Saturation channel.
     * @type {Integer (Int32)}
     */
    static Saturation => 1

    /**
     * The slider controls the Value channel.
     * @type {Integer (Int32)}
     */
    static Value => 2

    /**
     * The slider controls the Alpha channel.
     * @type {Integer (Int32)}
     */
    static Alpha => 3
}
