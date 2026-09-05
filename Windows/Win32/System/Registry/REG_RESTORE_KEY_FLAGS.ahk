#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_RESTORE_KEY_FLAGS extends Win32Enum {

    /**
     * Native name: REG_FORCE_RESTORE
     * @type {Integer (Int32)}
     */
    static FORCE_RESTORE => 8

    /**
     * Native name: REG_WHOLE_HIVE_VOLATILE
     * @type {Integer (Int32)}
     */
    static WHOLE_HIVE_VOLATILE => 1
}
