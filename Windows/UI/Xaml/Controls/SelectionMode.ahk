#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the selection behavior for a [ListBox](listbox.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.selectionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SelectionMode extends Win32Enum{

    /**
     * The user can select only one item at a time.
     * @type {Integer (Int32)}
     */
    static Single => 0

    /**
     * The user can select multiple items without entering a special mode.
     * @type {Integer (Int32)}
     */
    static Multiple => 1

    /**
     * The user can select multiple items by entering a special mode, for example when depressing a modifier key.
     * @type {Integer (Int32)}
     */
    static Extended => 2
}
