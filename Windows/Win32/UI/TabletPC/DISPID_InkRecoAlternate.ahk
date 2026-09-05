#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecoAlternate extends Win32Enum {

    /**
     * Native name: DISPID_InkRecoAlternate_String
     * @type {Integer (Int32)}
     */
    static String => 1

    /**
     * Native name: DISPID_InkRecoAlternate_LineNumber
     * @type {Integer (Int32)}
     */
    static LineNumber => 2

    /**
     * Native name: DISPID_InkRecoAlternate_Baseline
     * @type {Integer (Int32)}
     */
    static Baseline => 3

    /**
     * Native name: DISPID_InkRecoAlternate_Midline
     * @type {Integer (Int32)}
     */
    static Midline => 4

    /**
     * Native name: DISPID_InkRecoAlternate_Ascender
     * @type {Integer (Int32)}
     */
    static Ascender => 5

    /**
     * Native name: DISPID_InkRecoAlternate_Descender
     * @type {Integer (Int32)}
     */
    static Descender => 6

    /**
     * Native name: DISPID_InkRecoAlternate_Confidence
     * @type {Integer (Int32)}
     */
    static Confidence => 7

    /**
     * Native name: DISPID_InkRecoAlternate_Strokes
     * @type {Integer (Int32)}
     */
    static Strokes => 8

    /**
     * Native name: DISPID_InkRecoAlternate_GetStrokesFromStrokeRanges
     * @type {Integer (Int32)}
     */
    static GetStrokesFromStrokeRanges => 9

    /**
     * Native name: DISPID_InkRecoAlternate_GetStrokesFromTextRange
     * @type {Integer (Int32)}
     */
    static GetStrokesFromTextRange => 10

    /**
     * Native name: DISPID_InkRecoAlternate_GetTextRangeFromStrokes
     * @type {Integer (Int32)}
     */
    static GetTextRangeFromStrokes => 11

    /**
     * Native name: DISPID_InkRecoAlternate_GetPropertyValue
     * @type {Integer (Int32)}
     */
    static GetPropertyValue => 12

    /**
     * Native name: DISPID_InkRecoAlternate_LineAlternates
     * @type {Integer (Int32)}
     */
    static LineAlternates => 13

    /**
     * Native name: DISPID_InkRecoAlternate_ConfidenceAlternates
     * @type {Integer (Int32)}
     */
    static ConfidenceAlternates => 14

    /**
     * Native name: DISPID_InkRecoAlternate_AlternatesWithConstantPropertyValues
     * @type {Integer (Int32)}
     */
    static AlternatesWithConstantPropertyValues => 15
}
