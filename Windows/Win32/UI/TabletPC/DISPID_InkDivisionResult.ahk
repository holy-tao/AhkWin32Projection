#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkDivisionResult extends Win32Enum {

    /**
     * Native name: DISPID_IInkDivisionResult_Strokes
     * @type {Integer (Int32)}
     */
    static IInkDivisionResult_Strokes => 1

    /**
     * Native name: DISPID_IInkDivisionResult_ResultByType
     * @type {Integer (Int32)}
     */
    static IInkDivisionResult_ResultByType => 2
}
