#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_CREATE_KEY_DISPOSITION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static REG_CREATED_NEW_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPENED_EXISTING_KEY => 2
}
