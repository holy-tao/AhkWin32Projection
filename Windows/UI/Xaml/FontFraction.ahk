#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes a fraction style value for the [Typography.Fraction](/uwp/api/windows.ui.xaml.documents.typography.fraction) attached property.
 * @remarks
 * This enumeration is used by the [Typography.Fraction](/uwp/api/windows.ui.xaml.documents.typography.fraction) attached property.
 * 
 * Generally, Microsoft OpenType fonts support styles for fractions, including slashed and stacked.
 * 
 * A slashed style is also known as a diagonal style. Usually the slashed style does have a baseline offset between the two numerals with the first appearing higher than the second, but exactly how large that offset is can depend on the font.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fontfraction
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontFraction extends Win32Enum{

    /**
     * Default style is used.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Slashed fraction style is used.
     * @type {Integer (Int32)}
     */
    static Stacked => 1

    /**
     * Stacked fraction style is used.
     * @type {Integer (Int32)}
     */
    static Slashed => 2
}
