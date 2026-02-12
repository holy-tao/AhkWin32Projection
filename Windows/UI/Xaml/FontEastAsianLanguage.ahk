#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides a mechanism for selecting font-specific versions of glyphs for a specified East Asian writing system or language.
 * @remarks
 * This enumeration is used by the [Typography.EastAsianLanguage](/uwp/api/windows.ui.xaml.documents.typography.eastasianlanguage) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fonteastasianlanguage
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontEastAsianLanguage extends Win32Enum{

    /**
     * No font-specific glyph versions are applied.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Replaces default glyphs with the corresponding forms from the Hojo Kanji specification.
     * @type {Integer (Int32)}
     */
    static HojoKanji => 1

    /**
     * Replaces default Japanese glyphs with the corresponding forms from the JIS04 specification.
     * @type {Integer (Int32)}
     */
    static Jis04 => 2

    /**
     * Replaces default Japanese glyphs with the corresponding forms from the JIS78 specification.
     * @type {Integer (Int32)}
     */
    static Jis78 => 3

    /**
     * Replaces default Japanese glyphs with the corresponding forms from the JIS83 specification.
     * @type {Integer (Int32)}
     */
    static Jis83 => 4

    /**
     * Replaces default Japanese glyphs with the corresponding forms from the JIS90 specification.
     * @type {Integer (Int32)}
     */
    static Jis90 => 5

    /**
     * Replaces default glyphs with the corresponding forms from the NLC Kanji specification.
     * @type {Integer (Int32)}
     */
    static NlcKanji => 6

    /**
     * Replaces traditional Chinese or Japanese forms with their corresponding simplified forms.
     * @type {Integer (Int32)}
     */
    static Simplified => 7

    /**
     * Replaces simplified Chinese or Japanese forms with their corresponding traditional forms.
     * @type {Integer (Int32)}
     */
    static Traditional => 8

    /**
     * Replaces simplified Kanji forms with their corresponding traditional forms. This glyph set is explicitly limited to the traditional forms considered proper for use in personal names.
     * @type {Integer (Int32)}
     */
    static TraditionalNames => 9
}
