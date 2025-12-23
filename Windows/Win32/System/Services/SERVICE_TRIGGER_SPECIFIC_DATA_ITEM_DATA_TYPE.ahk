#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_BINARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_LEVEL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL => 5
}
