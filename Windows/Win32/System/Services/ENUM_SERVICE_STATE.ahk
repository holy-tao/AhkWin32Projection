#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class ENUM_SERVICE_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STATE_ALL => 3
}
