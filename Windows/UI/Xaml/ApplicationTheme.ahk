#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Declares the theme preference for an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.applicationtheme
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ApplicationTheme extends Win32Enum{

    /**
     * Use the **Light** default theme.
     * @type {Integer (Int32)}
     */
    static Light => 0

    /**
     * Use the **Dark** default theme.
     * @type {Integer (Int32)}
     */
    static Dark => 1
}
