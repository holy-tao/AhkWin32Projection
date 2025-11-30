#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class TREE_SEC_INFO extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET_KEEP_EXPLICIT => 3
}
