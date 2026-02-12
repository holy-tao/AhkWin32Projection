#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines constants that specify the content layout direction (for text and UI elements) most appropriate for a language.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.languagelayoutdirection
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class LanguageLayoutDirection extends Win32Enum{

    /**
     * Indicates a content layout direction of left to right.
     * @type {Integer (Int32)}
     */
    static Ltr => 0

    /**
     * Indicates a content layout direction of right to left (for example, for Arabic or other RTL languages).
     * @type {Integer (Int32)}
     */
    static Rtl => 1

    /**
     * Indicates a content layout direction that flows from the top to the bottom of the page; the first top-to-bottom column of content is on the left, and columns are added from left to right.
     * @type {Integer (Int32)}
     */
    static TtbLtr => 2

    /**
     * Indicates a content layout direction that flows from the top to the bottom of the page; the first top-to-bottom column of content is on the right, and columns are added from right to left.
     * @type {Integer (Int32)}
     */
    static TtbRtl => 3
}
