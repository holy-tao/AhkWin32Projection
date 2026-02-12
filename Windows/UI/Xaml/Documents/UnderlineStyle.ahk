#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the look of the underline used for an element.
 * @remarks
 * This enumeration provides values for the [Hyperlink.UnderlineStyle](hyperlink_underlinestyle.md) property. For more info, see the Examples and Remarks sections of the [Hyperlink](hyperlink.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.underlinestyle
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class UnderlineStyle extends Win32Enum{

    /**
     * The element is not underlined.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The element is underlined with a single, solid line.
     * @type {Integer (Int32)}
     */
    static Single => 1
}
