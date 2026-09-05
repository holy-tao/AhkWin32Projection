#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the context in which the error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ne-bits-bg_error_context
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
class BG_ERROR_CONTEXT extends Win32Enum {

    /**
     * An error has not occurred.
     * Native name: BG_ERROR_CONTEXT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The error context is unknown.
     * Native name: BG_ERROR_CONTEXT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 1

    /**
     * The transfer queue manager generated the error.
     * Native name: BG_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER
     * @type {Integer (Int32)}
     */
    static GENERAL_QUEUE_MANAGER => 2

    /**
     * The error was generated while the queue manager was notifying the client of an event.
     * Native name: BG_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static QUEUE_MANAGER_NOTIFICATION => 3

    /**
     * The error was related to the specified local file. For example, permission was denied, or the volume was unavailable.
     * Native name: BG_ERROR_CONTEXT_LOCAL_FILE
     * @type {Integer (Int32)}
     */
    static LOCAL_FILE => 4

    /**
     * The error was related to the specified remote file. For example, the URL was not accessible.
     * Native name: BG_ERROR_CONTEXT_REMOTE_FILE
     * @type {Integer (Int32)}
     */
    static REMOTE_FILE => 5

    /**
     * The transport layer generated the error. These errors are general transport failures (these errors are not specific to the remote file).
     * Native name: BG_ERROR_CONTEXT_GENERAL_TRANSPORT
     * @type {Integer (Int32)}
     */
    static GENERAL_TRANSPORT => 6

    /**
     * The server application to which BITS passed the upload file generated an error while processing the upload file. 
     * 
     * **BITS 1.2 and earlier:** Not supported.
     * Native name: BG_ERROR_CONTEXT_REMOTE_APPLICATION
     * @type {Integer (Int32)}
     */
    static REMOTE_APPLICATION => 7

    /**
     * Native name: BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK
     * @type {Integer (Int32)}
     */
    static SERVER_CERTIFICATE_CALLBACK => 8
}
