#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the numeral alignment value for the [Typography.NumeralAlignment](/uwp/api/windows.ui.xaml.documents.typography.numeralalignment) attached property.
 * @remarks
 * This enumeration is used by the [Typography.NumeralAlignment](/uwp/api/windows.ui.xaml.documents.typography.numeralalignment) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fontnumeralalignment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontNumeralAlignment extends Win32Enum{

    /**
     * Default numeral alignment is used.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Proportional width alignment is used.
     * @type {Integer (Int32)}
     */
    static Proportional => 1

    /**
     * Tabular alignment is used.
     * @type {Integer (Int32)}
     */
    static Tabular => 2
}
