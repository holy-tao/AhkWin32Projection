#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify where in the XAML visual tree a ContentDialog is rooted.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogplacement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogPlacement extends Win32Enum{

    /**
     * The dialog is rooted in the PopupRoot element of the XAML Window.
     * @type {Integer (Int32)}
     */
    static Popup => 0

    /**
     * If the dialog has a parent element, the dialog is rooted in the parent's visual tree. Otherwise, it falls back to the **Popup** behavior.
     * @type {Integer (Int32)}
     */
    static InPlace => 1
}
