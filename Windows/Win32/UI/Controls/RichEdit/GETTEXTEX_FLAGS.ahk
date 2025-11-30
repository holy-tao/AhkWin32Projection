#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GETTEXTEX_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GT_NOHIDDENTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GT_RAWTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GT_SELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GT_USECRLF => 1
}
