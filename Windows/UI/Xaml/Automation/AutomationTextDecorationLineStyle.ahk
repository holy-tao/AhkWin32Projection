#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the line style of text decorations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationtextdecorationlinestyle
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationTextDecorationLineStyle extends Win32Enum{

    /**
     * No text decoration.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Single line.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Words only.
     * @type {Integer (Int32)}
     */
    static WordsOnly => 2

    /**
     * Double line.
     * @type {Integer (Int32)}
     */
    static Double => 3

    /**
     * Dotted line.
     * @type {Integer (Int32)}
     */
    static Dot => 4

    /**
     * Dashed line.
     * @type {Integer (Int32)}
     */
    static Dash => 5

    /**
     * Dash-dot line.
     * @type {Integer (Int32)}
     */
    static DashDot => 6

    /**
     * Dash-dot-dot line.
     * @type {Integer (Int32)}
     */
    static DashDotDot => 7

    /**
     * Wavy line.
     * @type {Integer (Int32)}
     */
    static Wavy => 8

    /**
     * Single thick line.
     * @type {Integer (Int32)}
     */
    static ThickSingle => 9

    /**
     * Double wavy line.
     * @type {Integer (Int32)}
     */
    static DoubleWavy => 10

    /**
     * Thick wavy line.
     * @type {Integer (Int32)}
     */
    static ThickWavy => 11

    /**
     * Long dashed line.
     * @type {Integer (Int32)}
     */
    static LongDash => 12

    /**
     * Thick dashed line.
     * @type {Integer (Int32)}
     */
    static ThickDash => 13

    /**
     * Thick dash-dot line.
     * @type {Integer (Int32)}
     */
    static ThickDashDot => 14

    /**
     * Thick dash-dot-dot line.
     * @type {Integer (Int32)}
     */
    static ThickDashDotDot => 15

    /**
     * Thick dotted line.
     * @type {Integer (Int32)}
     */
    static ThickDot => 16

    /**
     * Thick long dashed line.
     * @type {Integer (Int32)}
     */
    static ThickLongDash => 17

    /**
     * Other line.
     * @type {Integer (Int32)}
     */
    static Other => 18
}
