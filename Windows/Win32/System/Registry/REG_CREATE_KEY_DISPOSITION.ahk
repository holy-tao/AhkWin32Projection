#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_CREATE_KEY_DISPOSITION extends Win32Enum {

    /**
     * Native name: REG_CREATED_NEW_KEY
     * @type {Integer (UInt32)}
     */
    static CREATED_NEW_KEY => 1

    /**
     * Native name: REG_OPENED_EXISTING_KEY
     * @type {Integer (UInt32)}
     */
    static OPENED_EXISTING_KEY => 2
}
