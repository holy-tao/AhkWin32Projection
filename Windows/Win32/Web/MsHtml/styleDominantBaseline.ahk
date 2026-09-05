#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleDominantBaseline extends Win32Enum {

    /**
     * Native name: styleDominantBaselineNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleDominantBaselineAlphabetic
     * @type {Integer (Int32)}
     */
    static Alphabetic => 1

    /**
     * Native name: styleDominantBaselineAuto
     * @type {Integer (Int32)}
     */
    static Auto => 2

    /**
     * Native name: styleDominantBaselineCentral
     * @type {Integer (Int32)}
     */
    static Central => 3

    /**
     * Native name: styleDominantBaselineHanging
     * @type {Integer (Int32)}
     */
    static Hanging => 4

    /**
     * Native name: styleDominantBaselineIdeographic
     * @type {Integer (Int32)}
     */
    static Ideographic => 5

    /**
     * Native name: styleDominantBaselineMathematical
     * @type {Integer (Int32)}
     */
    static Mathematical => 6

    /**
     * Native name: styleDominantBaselineMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 7

    /**
     * Native name: styleDominantBaselineNoChange
     * @type {Integer (Int32)}
     */
    static NoChange => 8

    /**
     * Native name: styleDominantBaselineResetSize
     * @type {Integer (Int32)}
     */
    static ResetSize => 9

    /**
     * Native name: styleDominantBaselineTextAfterEdge
     * @type {Integer (Int32)}
     */
    static TextAfterEdge => 10

    /**
     * Native name: styleDominantBaselineTextBeforeEdge
     * @type {Integer (Int32)}
     */
    static TextBeforeEdge => 11

    /**
     * Native name: styleDominantBaselineUseScript
     * @type {Integer (Int32)}
     */
    static UseScript => 12

    /**
     * Native name: styleDominantBaseline_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
