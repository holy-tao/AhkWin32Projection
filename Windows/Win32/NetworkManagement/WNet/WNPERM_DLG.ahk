#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class WNPERM_DLG extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERM_DLG_PERM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERM_DLG_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERM_DLG_OWNER => 2
}
