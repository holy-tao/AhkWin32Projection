#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes a numeral style value for the [Typography.NumeralStyle](/uwp/api/windows.ui.xaml.documents.typography.numeralstyle) attached property.
 * @remarks
 * This enumeration is used by the [Typography.NumeralStyle](/uwp/api/windows.ui.xaml.documents.typography.numeralstyle) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fontnumeralstyle
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontNumeralStyle extends Win32Enum{

    /**
     * Default numeral style is used.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Lining numeral style is used. Replaces default glyphs with numeric forms of even height.
     * @type {Integer (Int32)}
     */
    static Lining => 1

    /**
     * Old style numeral style is used. Replaces default glyphs with a figure style that matches lowercase letters in height and color.
     * @type {Integer (Int32)}
     */
    static OldStyle => 2
}
