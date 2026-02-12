#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the area outside of a *light-dismiss* UI is darkened.
 * @remarks
 * Transient UI, such as a [Flyout](flyout.md) or the open drop-down of a [ComboBox](combobox.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
 * 
 * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set [LightDismissOverlayMode](../windows.ui.xaml.controls.primitives/flyoutbase_lightdismissoverlaymode.md) to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.lightdismissoverlaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class LightDismissOverlayMode extends Win32Enum{

    /**
     * The device-family the app is running on determines whether the area outside of a *light-dismiss* UI is darkened.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The area outside of a *light-dismiss* UI is darkened for all device families.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The area outside of a *light-dismiss* UI is not darkened for all device families.
     * @type {Integer (Int32)}
     */
    static Off => 2
}
