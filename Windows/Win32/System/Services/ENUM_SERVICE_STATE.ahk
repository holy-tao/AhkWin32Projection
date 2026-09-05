#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class ENUM_SERVICE_STATE extends Win32Enum {

    /**
     * Native name: SERVICE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static ACTIVE => 1

    /**
     * Native name: SERVICE_INACTIVE
     * @type {Integer (UInt32)}
     */
    static INACTIVE => 2

    /**
     * Native name: SERVICE_STATE_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 3
}
