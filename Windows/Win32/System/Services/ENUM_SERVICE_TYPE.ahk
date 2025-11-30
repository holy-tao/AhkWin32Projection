#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class ENUM_SERVICE_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DRIVER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_KERNEL_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_WIN32 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_WIN32_SHARE_PROCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ADAPTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_FILE_SYSTEM_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RECOGNIZER_DRIVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_WIN32_OWN_PROCESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_USER_OWN_PROCESS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_USER_SHARE_PROCESS => 96
}
