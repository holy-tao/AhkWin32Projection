#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkDivisionUnit extends Win32Enum {

    /**
     * Native name: DISPID_IInkDivisionUnit_Strokes
     * @type {Integer (Int32)}
     */
    static IInkDivisionUnit_Strokes => 1

    /**
     * Native name: DISPID_IInkDivisionUnit_DivisionType
     * @type {Integer (Int32)}
     */
    static IInkDivisionUnit_DivisionType => 2

    /**
     * Native name: DISPID_IInkDivisionUnit_RecognizedString
     * @type {Integer (Int32)}
     */
    static IInkDivisionUnit_RecognizedString => 3

    /**
     * Native name: DISPID_IInkDivisionUnit_RotationTransform
     * @type {Integer (Int32)}
     */
    static IInkDivisionUnit_RotationTransform => 4
}
