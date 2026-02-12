#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the style of checkbox shown to select an item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresentercheckmode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ListViewItemPresenterCheckMode extends Win32Enum{

    /**
     * The checkbox in shown inline with the content of the list item.
     * @type {Integer (Int32)}
     */
    static Inline => 0

    /**
     * The checkbox is shown over the content of the list item.
     * @type {Integer (Int32)}
     */
    static Overlay => 1
}
