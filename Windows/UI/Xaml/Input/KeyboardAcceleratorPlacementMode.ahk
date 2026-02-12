#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether a keyboard shortcut (accelerator) is displayed.
 * @remarks
 * This enumeration is used by the [UIElement.KeyboardAcceleratorPlacementMode](../windows.ui.xaml/uielement_keyboardacceleratorplacementmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyboardacceleratorplacementmode
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardAcceleratorPlacementMode extends Win32Enum{

    /**
     * The keyboard accelerator is displayed. Default.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The keyboard accelerator is not shown.
     * @type {Integer (Int32)}
     */
    static Hidden => 1
}
