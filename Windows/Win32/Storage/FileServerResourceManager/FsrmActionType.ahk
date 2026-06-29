#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the actions that can be triggered in response to a quota or file screen event (for example, a quota is exceeded or a file violates a file screen).
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmactiontype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmActionType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The action is of an unknown type. Do not use this value to specify an action type.
     * @type {Integer (Int32)}
     */
    static FsrmActionType_Unknown => 0

    /**
     * Log an event to the Application event log.
     * @type {Integer (Int32)}
     */
    static FsrmActionType_EventLog => 1

    /**
     * Send an email message.
     * @type {Integer (Int32)}
     */
    static FsrmActionType_Email => 2

    /**
     * Execute a command or script.
     * @type {Integer (Int32)}
     */
    static FsrmActionType_Command => 3

    /**
     * Generate a report.
     * @type {Integer (Int32)}
     */
    static FsrmActionType_Report => 4
}
