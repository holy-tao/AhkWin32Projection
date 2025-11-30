#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkDivisionUnit extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_Strokes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_DivisionType => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_RecognizedString => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionUnit_RotationTransform => 4
}
