#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides a mechanism for selecting glyphs of different width styles.
 * @remarks
 * This enumeration is used by the [Typography.EastAsianWidths](/uwp/api/windows.ui.xaml.documents.typography.eastasianwidths) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.fonteastasianwidths
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FontEastAsianWidths extends Win32Enum{

    /**
     * Default width style.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Replaces uniform width glyphs with full width (usually em) glyphs.
     * @type {Integer (Int32)}
     */
    static Full => 1

    /**
     * Replaces uniform width glyphs with half width (half em) glyphs
     * @type {Integer (Int32)}
     */
    static Half => 2

    /**
     * Replaces uniform width glyphs with proportionally spaced glyphs.
     * @type {Integer (Int32)}
     */
    static Proportional => 3

    /**
     * Replaces uniform width glyphs with one-quarter width (one-quarter em) glyphs.
     * @type {Integer (Int32)}
     */
    static Quarter => 4

    /**
     * Replaces uniform width glyphs with one-third width (one-third em) glyphs.
     * @type {Integer (Int32)}
     */
    static Third => 5
}
