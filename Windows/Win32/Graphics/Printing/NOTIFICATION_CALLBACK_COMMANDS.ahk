#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class NOTIFICATION_CALLBACK_COMMANDS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_COMMAND_NOTIFY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_COMMAND_CONTEXT_ACQUIRE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_COMMAND_CONTEXT_RELEASE => 2
}
