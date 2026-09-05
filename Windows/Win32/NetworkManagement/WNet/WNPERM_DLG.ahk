#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
class WNPERM_DLG extends Win32Enum {

    /**
     * Native name: WNPERM_DLG_PERM
     * @type {Integer (UInt32)}
     */
    static PERM => 0

    /**
     * Native name: WNPERM_DLG_AUDIT
     * @type {Integer (UInt32)}
     */
    static AUDIT => 1

    /**
     * Native name: WNPERM_DLG_OWNER
     * @type {Integer (UInt32)}
     */
    static OWNER => 2
}
