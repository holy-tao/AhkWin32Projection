#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a UI theme that should be used for individual [UIElement](uielement.md) parts of an app UI.
 * @remarks
 * This enumeration is used as a value by the [RequestedTheme](frameworkelement_requestedtheme.md) property.
 * 
 * 
 * 
 * > [!NOTE]
 * > On Windows, setting [RequestedTheme](application_requestedtheme.md) to Default will always result in "Dark" being the theme. On Windows Phone, using the Default value will result in a query for the system theme, as set by the user.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementtheme
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementTheme extends Win32Enum{

    /**
     * Use the [Application.RequestedTheme](application_requestedtheme.md) value for the element. This is the default.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Use the **Light** default theme.
     * @type {Integer (Int32)}
     */
    static Light => 1

    /**
     * Use the **Dark** default theme.
     * @type {Integer (Int32)}
     */
    static Dark => 2
}
