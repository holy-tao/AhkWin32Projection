#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the display state of an element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visibility
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Visibility extends Win32Enum{

    /**
     * Display the element.
     * @type {Integer (Int32)}
     */
    static Visible => 0

    /**
     * Do not display the element, and do not reserve space for it in layout.
     * @type {Integer (Int32)}
     */
    static Collapsed => 1
}
