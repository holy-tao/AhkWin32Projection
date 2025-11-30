#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_RESTORE_KEY_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REG_FORCE_RESTORE => 8

    /**
     * @type {Integer (Int32)}
     */
    static REG_WHOLE_HIVE_VOLATILE => 1
}
