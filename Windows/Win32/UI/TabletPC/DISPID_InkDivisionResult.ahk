#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkDivisionResult extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionResult_Strokes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivisionResult_ResultByType => 2
}
