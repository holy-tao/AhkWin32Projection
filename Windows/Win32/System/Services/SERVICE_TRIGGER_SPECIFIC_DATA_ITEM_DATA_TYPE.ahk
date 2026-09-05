#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE extends Win32Enum {

    /**
     * Native name: SERVICE_TRIGGER_DATA_TYPE_BINARY
     * @type {Integer (UInt32)}
     */
    static BINARY => 1

    /**
     * Native name: SERVICE_TRIGGER_DATA_TYPE_STRING
     * @type {Integer (UInt32)}
     */
    static STRING => 2

    /**
     * Native name: SERVICE_TRIGGER_DATA_TYPE_LEVEL
     * @type {Integer (UInt32)}
     */
    static LEVEL => 3

    /**
     * Native name: SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY
     * @type {Integer (UInt32)}
     */
    static KEYWORD_ANY => 4

    /**
     * Native name: SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL
     * @type {Integer (UInt32)}
     */
    static KEYWORD_ALL => 5
}
