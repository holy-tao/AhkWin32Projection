#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the context in which the error occurred.
 * @see https://docs.microsoft.com/windows/win32/api//bits/ne-bits-bg_error_context
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_ERROR_CONTEXT{

    /**
     * An error has not occurred.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_NONE => 0

    /**
     * The error context is unknown.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_UNKNOWN => 1

    /**
     * The transfer queue manager generated the error.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER => 2

    /**
     * The error was generated while the queue manager was notifying the client of an event.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION => 3

    /**
     * The error was related to the specified local file. For example, permission was denied, or the volume was unavailable.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_LOCAL_FILE => 4

    /**
     * The error was related to the specified remote file. For example, the URL was not accessible.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_REMOTE_FILE => 5

    /**
     * The transport layer generated the error. These errors are general transport failures (these errors are not specific to the remote file).
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_GENERAL_TRANSPORT => 6

    /**
     * The server application to which BITS passed the upload file generated an error while processing the upload file. 
 * 
 * **BITS 1.2 and earlier:** Not supported.
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_REMOTE_APPLICATION => 7

    /**
     * @type {Integer (Int32)}
     */
    static BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK => 8
}
