#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the capital letter style value for the [Typography.Capitals](/uwp/api/windows.ui.xaml.documents.typography.capitals) attached property.
 * @remarks
 * This enumeration is used by the [Typography.Capitals](/uwp/api/windows.ui.xaml.documents.typography.capitals) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fontcapitals
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontCapitals extends Win32Enum{

    /**
     * Capital letters render normally.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Both capital and lowercase letters are replaced with a glyph form of an uppercase letter with the same approximate height.
     * @type {Integer (Int32)}
     */
    static AllSmallCaps => 1

    /**
     * Lowercase letters are replaced with a glyph form of an uppercase letter with the same approximate height.
     * @type {Integer (Int32)}
     */
    static SmallCaps => 2

    /**
     * Both capital and lowercase letters are replaced with a glyph form of an uppercase letter with the same approximate height. Petite capitals are smaller than small capitals.
     * @type {Integer (Int32)}
     */
    static AllPetiteCaps => 3

    /**
     * Lowercase letters are replaced with a glyph form of an uppercase letter with the same approximate height. Petite capitals are smaller than small capitals.
     * @type {Integer (Int32)}
     */
    static PetiteCaps => 4

    /**
     * Capital letters display in unicase. Unicase fonts render both uppercase and lowercase letters in a mixture of uppercase and lowercase glyphs determined by the type designer.
     * @type {Integer (Int32)}
     */
    static Unicase => 5

    /**
     * Glyph forms are substituted with a typographic form specifically designed for titles.
     * @type {Integer (Int32)}
     */
    static Titling => 6
}
