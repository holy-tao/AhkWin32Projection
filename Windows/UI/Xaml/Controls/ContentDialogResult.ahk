#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies identifiers to indicate the return value of a [ContentDialog](contentdialog.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogresult
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogResult extends Win32Enum{

    /**
     * No button was tapped.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The primary button was tapped by the user.
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * The secondary button was tapped by the user.
     * @type {Integer (Int32)}
     */
    static Secondary => 2
}
