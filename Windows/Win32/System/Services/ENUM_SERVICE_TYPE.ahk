#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class ENUM_SERVICE_TYPE extends Win32BitflagEnum {

    /**
     * Native name: SERVICE_DRIVER
     * @type {Integer (UInt32)}
     */
    static DRIVER => 11

    /**
     * Native name: SERVICE_KERNEL_DRIVER
     * @type {Integer (UInt32)}
     */
    static KERNEL_DRIVER => 1

    /**
     * Native name: SERVICE_WIN32
     * @type {Integer (UInt32)}
     */
    static WIN32 => 48

    /**
     * Native name: SERVICE_WIN32_SHARE_PROCESS
     * @type {Integer (UInt32)}
     */
    static WIN32_SHARE_PROCESS => 32

    /**
     * Native name: SERVICE_ADAPTER
     * @type {Integer (UInt32)}
     */
    static ADAPTER => 4

    /**
     * Native name: SERVICE_FILE_SYSTEM_DRIVER
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_DRIVER => 2

    /**
     * Native name: SERVICE_RECOGNIZER_DRIVER
     * @type {Integer (UInt32)}
     */
    static RECOGNIZER_DRIVER => 8

    /**
     * Native name: SERVICE_WIN32_OWN_PROCESS
     * @type {Integer (UInt32)}
     */
    static WIN32_OWN_PROCESS => 16

    /**
     * Native name: SERVICE_USER_OWN_PROCESS
     * @type {Integer (UInt32)}
     */
    static USER_OWN_PROCESS => 80

    /**
     * Native name: SERVICE_USER_SHARE_PROCESS
     * @type {Integer (UInt32)}
     */
    static USER_SHARE_PROCESS => 96
}
