#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes a font variant value for the [Typography.Variants](/uwp/api/windows.ui.xaml.documents.typography.variants) attached property.
 * @remarks
 * This enumeration is used by the [Typography.Variants](/uwp/api/windows.ui.xaml.documents.typography.variants) attached property.
 * 
 * Some fonts might support a subset of variant values, or ignore the setting completely.
 * 
 * Some fonts might also algorithmically approximate a font form instead of supporting [Typography.Variants](/uwp/api/windows.ui.xaml.documents.typography.variants).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fontvariants
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontVariants extends Win32Enum{

    /**
     * Default font behavior. Font scaling and positioning is normal.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Replaces a default glyph with a superscript glyph. Superscript is commonly used for footnotes.
     * @type {Integer (Int32)}
     */
    static Superscript => 1

    /**
     * Replaces a default glyph with a subscript glyph.
     * @type {Integer (Int32)}
     */
    static Subscript => 2

    /**
     * Replaces a default glyph with an ordinal glyph, or it might combine glyph substitution with positioning adjustments for proper placement. Ordinal forms are normally associated with numeric notation of an ordinal word, such as "1st" for "first".
     * @type {Integer (Int32)}
     */
    static Ordinal => 3

    /**
     * Replaces a default glyph with an inferior glyph, or it might combine glyph substitution with positioning adjustments for proper placement. Inferior forms are typically used in chemical formulas or mathematical notation.
     * @type {Integer (Int32)}
     */
    static Inferior => 4

    /**
     * Replaces a default glyph with a smaller Japanese Kana glyph. This is used to clarify the meaning of Kanji, which might be unfamiliar to the reader.
     * @type {Integer (Int32)}
     */
    static Ruby => 5
}
