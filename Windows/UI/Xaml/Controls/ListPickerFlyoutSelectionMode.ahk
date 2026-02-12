#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the selection mode of a [ListPickerFlyout](listpickerflyout.md).
 * @remarks
 * These values are used by the [ListPickerFlyout.SelectionMode](listpickerflyout_selectionmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listpickerflyoutselectionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListPickerFlyoutSelectionMode extends Win32Enum{

    /**
     * A user can select only one item.
     * @type {Integer (Int32)}
     */
    static Single => 0

    /**
     * The user can select multiple items.
     * @type {Integer (Int32)}
     */
    static Multiple => 1
}
