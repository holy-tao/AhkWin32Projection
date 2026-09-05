#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the OverlineStyle, StrikethroughStyle, and UnderlineStyle text attributes.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-textdecorationlinestyle
 * @namespace Windows.Win32.UI.Accessibility
 */
class TextDecorationLineStyle extends Win32Enum {

    /**
     * No line style.
     * Native name: TextDecorationLineStyle_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A single solid line.
     * Native name: TextDecorationLineStyle_Single
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Only words (not spaces) are underlined.
     * Native name: TextDecorationLineStyle_WordsOnly
     * @type {Integer (Int32)}
     */
    static WordsOnly => 2

    /**
     * A double line.
     * Native name: TextDecorationLineStyle_Double
     * @type {Integer (Int32)}
     */
    static Double => 3

    /**
     * A dotted line.
     * Native name: TextDecorationLineStyle_Dot
     * @type {Integer (Int32)}
     */
    static Dot => 4

    /**
     * A dashed line.
     * Native name: TextDecorationLineStyle_Dash
     * @type {Integer (Int32)}
     */
    static Dash => 5

    /**
     * Alternating dashes and dots.
     * Native name: TextDecorationLineStyle_DashDot
     * @type {Integer (Int32)}
     */
    static DashDot => 6

    /**
     * A dash followed by two dots.
     * Native name: TextDecorationLineStyle_DashDotDot
     * @type {Integer (Int32)}
     */
    static DashDotDot => 7

    /**
     * A wavy line.
     * Native name: TextDecorationLineStyle_Wavy
     * @type {Integer (Int32)}
     */
    static Wavy => 8

    /**
     * A thick single line.
     * Native name: TextDecorationLineStyle_ThickSingle
     * @type {Integer (Int32)}
     */
    static ThickSingle => 9

    /**
     * A double wavy line.
     * Native name: TextDecorationLineStyle_DoubleWavy
     * @type {Integer (Int32)}
     */
    static DoubleWavy => 11

    /**
     * A thick wavy line.
     * Native name: TextDecorationLineStyle_ThickWavy
     * @type {Integer (Int32)}
     */
    static ThickWavy => 12

    /**
     * Long dashes.
     * Native name: TextDecorationLineStyle_LongDash
     * @type {Integer (Int32)}
     */
    static LongDash => 13

    /**
     * A thick dashed line.
     * Native name: TextDecorationLineStyle_ThickDash
     * @type {Integer (Int32)}
     */
    static ThickDash => 14

    /**
     * Thick dashes alternating with thick dots.
     * Native name: TextDecorationLineStyle_ThickDashDot
     * @type {Integer (Int32)}
     */
    static ThickDashDot => 15

    /**
     * A thick dash followed by two thick dots.
     * Native name: TextDecorationLineStyle_ThickDashDotDot
     * @type {Integer (Int32)}
     */
    static ThickDashDotDot => 16

    /**
     * A thick dotted line.
     * Native name: TextDecorationLineStyle_ThickDot
     * @type {Integer (Int32)}
     */
    static ThickDot => 17

    /**
     * Thick long dashes.
     * Native name: TextDecorationLineStyle_ThickLongDash
     * @type {Integer (Int32)}
     */
    static ThickLongDash => 18

    /**
     * A line style not represented by another value.
     * Native name: TextDecorationLineStyle_Other
     * @type {Integer (Int32)}
     */
    static Other => -1
}
