#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TRIGGER_ACTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_ACTION_SERVICE_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_ACTION_SERVICE_STOP => 2
}
