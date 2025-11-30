#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GETTEXTLENGTHEX_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_USECRLF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_PRECISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_NUMCHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_NUMBYTES => 16
}
