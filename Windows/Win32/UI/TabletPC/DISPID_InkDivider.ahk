#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkDivider extends Win32Enum {

    /**
     * Native name: DISPID_IInkDivider_Strokes
     * @type {Integer (Int32)}
     */
    static IInkDivider_Strokes => 1

    /**
     * Native name: DISPID_IInkDivider_RecognizerContext
     * @type {Integer (Int32)}
     */
    static IInkDivider_RecognizerContext => 2

    /**
     * Native name: DISPID_IInkDivider_LineHeight
     * @type {Integer (Int32)}
     */
    static IInkDivider_LineHeight => 3

    /**
     * Native name: DISPID_IInkDivider_Divide
     * @type {Integer (Int32)}
     */
    static IInkDivider_Divide => 4
}
