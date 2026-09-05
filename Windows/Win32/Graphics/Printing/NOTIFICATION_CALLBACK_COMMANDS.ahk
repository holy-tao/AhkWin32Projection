#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class NOTIFICATION_CALLBACK_COMMANDS extends Win32Enum {

    /**
     * Native name: NOTIFICATION_COMMAND_NOTIFY
     * @type {Integer (Int32)}
     */
    static COMMAND_NOTIFY => 0

    /**
     * Native name: NOTIFICATION_COMMAND_CONTEXT_ACQUIRE
     * @type {Integer (Int32)}
     */
    static COMMAND_CONTEXT_ACQUIRE => 1

    /**
     * Native name: NOTIFICATION_COMMAND_CONTEXT_RELEASE
     * @type {Integer (Int32)}
     */
    static COMMAND_CONTEXT_RELEASE => 2
}
