#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class PARAFORMAT_NUMBERING extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_BULLET => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_ARABIC => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_LCLETTER => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_UCLETTER => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_LCROMAN => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_UCROMAN => 6
}
