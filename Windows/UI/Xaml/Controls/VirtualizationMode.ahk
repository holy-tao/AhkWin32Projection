#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how [VirtualizingStackPanel](virtualizingstackpanel.md) manages item containers for its child items.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.virtualizationmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class VirtualizationMode extends Win32Enum{

    /**
     * Create and discard the item containers.
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Reuse the item containers.
     * @type {Integer (Int32)}
     */
    static Recycling => 1
}
