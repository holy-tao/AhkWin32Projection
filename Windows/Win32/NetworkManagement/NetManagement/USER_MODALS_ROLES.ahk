#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class USER_MODALS_ROLES extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_STANDALONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_MEMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_BACKUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_ROLE_PRIMARY => 3
}
