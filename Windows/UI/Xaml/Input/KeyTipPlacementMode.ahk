#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify where a keytip is placed in relation to a UIElement.
 * @remarks
 * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
 * 
 * This enumeration is used by the [UIElement.KeyTipPlacementMode](../windows.ui.xaml/uielement_keytipplacementmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keytipplacementmode
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyTipPlacementMode extends Win32Enum{

    /**
     * The placement of the keytip is determined by the system.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The keytip is placed below the element.
     * @type {Integer (Int32)}
     */
    static Bottom => 1

    /**
     * The keytip is placed above the element.
     * @type {Integer (Int32)}
     */
    static Top => 2

    /**
     * The keytip is placed left of the element.
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * The keytip is placed right of the element.
     * @type {Integer (Int32)}
     */
    static Right => 4

    /**
     * The keytip is centered on the element.
     * @type {Integer (Int32)}
     */
    static Center => 5

    /**
     * The keytip is not shown.
     * @type {Integer (Int32)}
     */
    static Hidden => 6
}
