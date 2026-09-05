#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class TREE_SEC_INFO extends Win32Enum {

    /**
     * Native name: TREE_SEC_INFO_SET
     * @type {Integer (UInt32)}
     */
    static SET => 1

    /**
     * Native name: TREE_SEC_INFO_RESET
     * @type {Integer (UInt32)}
     */
    static RESET => 2

    /**
     * Native name: TREE_SEC_INFO_RESET_KEEP_EXPLICIT
     * @type {Integer (UInt32)}
     */
    static RESET_KEEP_EXPLICIT => 3
}
