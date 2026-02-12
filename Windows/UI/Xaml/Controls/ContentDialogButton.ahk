#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the default button on a content dialog.
 * @remarks
 * This enumeration is used by the [ContentDialog.DefaultButton](contentdialog_defaultbutton.md) property.
 * The default button responds to the Enter key and has a different visual style.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogButton extends Win32Enum{

    /**
     * No button is specified as the default.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The primary button is the default.
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * The secondary button is the default.
     * @type {Integer (Int32)}
     */
    static Secondary => 2

    /**
     * The close button is the default.
     * @type {Integer (Int32)}
     */
    static Close => 3
}
