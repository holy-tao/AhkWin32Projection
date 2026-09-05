#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */
class TBS_COMMAND_PRIORITY extends Win32Enum {

    /**
     * Native name: TBS_COMMAND_PRIORITY_LOW
     * @type {Integer (UInt32)}
     */
    static LOW => 100

    /**
     * Native name: TBS_COMMAND_PRIORITY_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 200

    /**
     * Native name: TBS_COMMAND_PRIORITY_SYSTEM
     * @type {Integer (UInt32)}
     */
    static SYSTEM => 400

    /**
     * Native name: TBS_COMMAND_PRIORITY_HIGH
     * @type {Integer (UInt32)}
     */
    static HIGH => 300

    /**
     * Native name: TBS_COMMAND_PRIORITY_MAX
     * @type {Integer (UInt32)}
     */
    static MAX => 2147483648
}
