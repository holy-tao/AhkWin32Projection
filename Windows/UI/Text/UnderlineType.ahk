#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of character underlining.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.underlinetype
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class UnderlineType extends Win32Enum{

    /**
     * No underline type is defined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Characters are not underlined.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * A single solid line.
     * @type {Integer (Int32)}
     */
    static Single => 2

    /**
     * Underline words, but not the spaces between words.
     * @type {Integer (Int32)}
     */
    static Words => 3

    /**
     * Two solid double lines.
     * @type {Integer (Int32)}
     */
    static Double => 4

    /**
     * A dotted line.
     * @type {Integer (Int32)}
     */
    static Dotted => 5

    /**
     * A dashed line.
     * @type {Integer (Int32)}
     */
    static Dash => 6

    /**
     * Alternating dashes and dots.
     * @type {Integer (Int32)}
     */
    static DashDot => 7

    /**
     * Single dashes, each followed by two dots.
     * @type {Integer (Int32)}
     */
    static DashDotDot => 8

    /**
     * A wavy line.
     * @type {Integer (Int32)}
     */
    static Wave => 9

    /**
     * A thick solid line.
     * @type {Integer (Int32)}
     */
    static Thick => 10

    /**
     * A thin solid line.
     * @type {Integer (Int32)}
     */
    static Thin => 11

    /**
     * Two wavy lines.
     * @type {Integer (Int32)}
     */
    static DoubleWave => 12

    /**
     * A thick wavy line.
     * @type {Integer (Int32)}
     */
    static HeavyWave => 13

    /**
     * Long dashes.
     * @type {Integer (Int32)}
     */
    static LongDash => 14

    /**
     * Thick dashes.
     * @type {Integer (Int32)}
     */
    static ThickDash => 15

    /**
     * Thick, alternating dashes and dots.
     * @type {Integer (Int32)}
     */
    static ThickDashDot => 16

    /**
     * Thick single dashes, each followed by two thick dots.
     * @type {Integer (Int32)}
     */
    static ThickDashDotDot => 17

    /**
     * A thick dotted line.
     * @type {Integer (Int32)}
     */
    static ThickDotted => 18

    /**
     * Thick long dashes.
     * @type {Integer (Int32)}
     */
    static ThickLongDash => 19
}
