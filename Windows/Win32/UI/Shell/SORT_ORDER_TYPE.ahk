#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SORT_ORDER_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SOT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SOT_IGNORE_FOLDERNESS => 1
}
