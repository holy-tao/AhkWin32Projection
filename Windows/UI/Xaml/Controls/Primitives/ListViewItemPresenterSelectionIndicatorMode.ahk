#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the selection indicator is shown on a list view item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.listviewitempresenterselectionindicatormode
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ListViewItemPresenterSelectionIndicatorMode extends Win32Enum{

    /**
     * The selection indicator is shown inline with the list view item content.
     * @type {Integer (Int32)}
     */
    static Inline => 0

    /**
     * The selection indicator is shown overlaying the list view item content.
     * @type {Integer (Int32)}
     */
    static Overlay => 1
}
