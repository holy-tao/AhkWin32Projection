#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether items were added to or removed from the [CommandBar](commandbar.md) overflow menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbardynamicoverflowaction
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarDynamicOverflowAction extends Win32Enum{

    /**
     * Items are added to the overflow menu.
     * @type {Integer (Int32)}
     */
    static AddingToOverflow => 0

    /**
     * Items are removed from the overflow menu.
     * @type {Integer (Int32)}
     */
    static RemovingFromOverflow => 1
}
