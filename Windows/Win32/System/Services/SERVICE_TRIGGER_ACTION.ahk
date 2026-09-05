#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_TRIGGER_ACTION extends Win32Enum {

    /**
     * Native name: SERVICE_TRIGGER_ACTION_SERVICE_START
     * @type {Integer (UInt32)}
     */
    static SERVICE_START => 1

    /**
     * Native name: SERVICE_TRIGGER_ACTION_SERVICE_STOP
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP => 2
}
