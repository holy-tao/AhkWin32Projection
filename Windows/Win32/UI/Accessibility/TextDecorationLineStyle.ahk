#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the OverlineStyle, StrikethroughStyle, and UnderlineStyle text attributes.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-textdecorationlinestyle
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TextDecorationLineStyle{

    /**
     * No line style.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_None => 0

    /**
     * A single solid line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Single => 1

    /**
     * Only words (not spaces) are underlined.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_WordsOnly => 2

    /**
     * A double line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Double => 3

    /**
     * A dotted line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Dot => 4

    /**
     * A dashed line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Dash => 5

    /**
     * Alternating dashes and dots.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_DashDot => 6

    /**
     * A dash followed by two dots.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_DashDotDot => 7

    /**
     * A wavy line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Wavy => 8

    /**
     * A thick single line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickSingle => 9

    /**
     * A double wavy line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_DoubleWavy => 11

    /**
     * A thick wavy line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickWavy => 12

    /**
     * Long dashes.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_LongDash => 13

    /**
     * A thick dashed line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickDash => 14

    /**
     * Thick dashes alternating with thick dots.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickDashDot => 15

    /**
     * A thick dash followed by two thick dots.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickDashDotDot => 16

    /**
     * A thick dotted line.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickDot => 17

    /**
     * Thick long dashes.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_ThickLongDash => 18

    /**
     * A line style not represented by another value.
     * @type {Integer (Int32)}
     */
    static TextDecorationLineStyle_Other => -1
}
