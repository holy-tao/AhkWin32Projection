#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Influences how a line box height is calculated
 * @remarks
 * How the TextLineBounds values influence line height calculations for adjacent lines is best shown through illustrations. The first illustration for each value shows a single line and the second shows two adjacent lines and their bounds.
 * + Yellow areas represent the areas that are outside of a [TextBlock](../windows.ui.xaml.controls/textblock.md) outer boundary, and would thus be masked if there was adjacent content (text or otherwise).
 * + The red line is the text cap height, which text ascenders might go above. The upper-case "Â" character in the illustrations has an ascender.
 * + The green line is the text baseline, which text descenders might go below. The lower-case "j" character in the illustrations has a descender.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.textlinebounds
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TextLineBounds extends Win32Enum{

    /**
     * Uses normal line box height calculation, this is the default.
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Top of line box height is the cap height from the font.
     * @type {Integer (Int32)}
     */
    static TrimToCapHeight => 1

    /**
     * Bottom of line box height is the text baseline.
     * @type {Integer (Int32)}
     */
    static TrimToBaseline => 2

    /**
     * Top of line box height is the cap height from the font, bottom of line box height is the text baseline.
     * @type {Integer (Int32)}
     */
    static Tight => 3
}
