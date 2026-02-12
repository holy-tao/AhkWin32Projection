#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the degree to which a font has been stretched, compared to the normal aspect ratio of that font.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontstretch
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FontStretch extends Win32Enum{

    /**
     * No defined font stretch.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * An ultra-condensed font stretch (50% of normal).
     * @type {Integer (Int32)}
     */
    static UltraCondensed => 1

    /**
     * An extra-condensed font stretch (62.5% of normal).
     * @type {Integer (Int32)}
     */
    static ExtraCondensed => 2

    /**
     * A condensed font stretch (75% of normal).
     * @type {Integer (Int32)}
     */
    static Condensed => 3

    /**
     * A semi-condensed font stretch (87.5% of normal).
     * @type {Integer (Int32)}
     */
    static SemiCondensed => 4

    /**
     * The normal font stretch that all other font stretch values relate to (100%).
     * @type {Integer (Int32)}
     */
    static Normal => 5

    /**
     * A semi-expanded font stretch (112.5% of normal).
     * @type {Integer (Int32)}
     */
    static SemiExpanded => 6

    /**
     * An expanded font stretch (125% of normal).
     * @type {Integer (Int32)}
     */
    static Expanded => 7

    /**
     * An extra-expanded font stretch (150% of normal).
     * @type {Integer (Int32)}
     */
    static ExtraExpanded => 8

    /**
     * An ultra-expanded font stretch (200% of normal).
     * @type {Integer (Int32)}
     */
    static UltraExpanded => 9
}
