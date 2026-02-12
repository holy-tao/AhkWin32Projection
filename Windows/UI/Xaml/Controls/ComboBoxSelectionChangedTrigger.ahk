#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what action causes a [SelectionChanged](/uwp/api/windows.ui.xaml.controls.primitives.selector.selectionchanged) event to occur.
 * @remarks
 * This enumeration is used by the [ComboBox.SelectionChangedTrigger](combobox_selectionchangedtrigger.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.comboboxselectionchangedtrigger
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ComboBoxSelectionChangedTrigger extends Win32Enum{

    /**
     * A change event occurs when the user commits a selection in the combo box.
     * @type {Integer (Int32)}
     */
    static Committed => 0

    /**
     * A change event occurs each time the user navigates to a new selection in the combo box.
     * @type {Integer (Int32)}
     */
    static Always => 1
}
