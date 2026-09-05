#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleAlignmentBaseline extends Win32Enum {

    /**
     * Native name: styleAlignmentBaselineNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleAlignmentBaselineAfterEdge
     * @type {Integer (Int32)}
     */
    static AfterEdge => 1

    /**
     * Native name: styleAlignmentBaselineAlphabetic
     * @type {Integer (Int32)}
     */
    static Alphabetic => 2

    /**
     * Native name: styleAlignmentBaselineAuto
     * @type {Integer (Int32)}
     */
    static Auto => 3

    /**
     * Native name: styleAlignmentBaselineBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 4

    /**
     * Native name: styleAlignmentBaselineBeforeEdge
     * @type {Integer (Int32)}
     */
    static BeforeEdge => 5

    /**
     * Native name: styleAlignmentBaselineCentral
     * @type {Integer (Int32)}
     */
    static Central => 6

    /**
     * Native name: styleAlignmentBaselineHanging
     * @type {Integer (Int32)}
     */
    static Hanging => 7

    /**
     * Native name: styleAlignmentBaselineMathematical
     * @type {Integer (Int32)}
     */
    static Mathematical => 8

    /**
     * Native name: styleAlignmentBaselineMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 9

    /**
     * Native name: styleAlignmentBaselineTextAfterEdge
     * @type {Integer (Int32)}
     */
    static TextAfterEdge => 10

    /**
     * Native name: styleAlignmentBaselineTextBeforeEdge
     * @type {Integer (Int32)}
     */
    static TextBeforeEdge => 11

    /**
     * Native name: styleAlignmentBaselineIdeographic
     * @type {Integer (Int32)}
     */
    static Ideographic => 12

    /**
     * Native name: styleAlignmentBaseline_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
