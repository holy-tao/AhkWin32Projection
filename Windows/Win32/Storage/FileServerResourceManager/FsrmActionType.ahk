#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the actions that can be triggered in response to a quota or file screen event (for example, a quota is exceeded or a file violates a file screen).
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmactiontype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmActionType extends Win32Enum {

    /**
     * The action is of an unknown type. Do not use this value to specify an action type.
     * Native name: FsrmActionType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Log an event to the Application event log.
     * Native name: FsrmActionType_EventLog
     * @type {Integer (Int32)}
     */
    static EventLog => 1

    /**
     * Send an email message.
     * Native name: FsrmActionType_Email
     * @type {Integer (Int32)}
     */
    static Email => 2

    /**
     * Execute a command or script.
     * Native name: FsrmActionType_Command
     * @type {Integer (Int32)}
     */
    static Command => 3

    /**
     * Generate a report.
     * Native name: FsrmActionType_Report
     * @type {Integer (Int32)}
     */
    static Report => 4
}
