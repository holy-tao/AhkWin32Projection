#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the various types of callbacks used on placeholder files or folders.
 * @remarks
 * 
 * These are not APIs provided by the library, but rather callbacks that a sync provider must implement in order to service requests from the platform.  As necessary, the platform will ask the library instance running inside the sync provider process to invoke the appropriate callback routine.
 * 
 * 
 * Callback routines will be invoked in an arbitrary thread (part of a thread pool).  Multiple callbacks can occur simultaneously, in different threads, and it is the responsibility of the sync provider code to implement any necessary synchronization to make this work reliably. All callbacks are asynchronous. Asynchronous user requests that trigger the callbacks are pended and the control is returned to the user application.
 * 
 * 
 * Every callback request has a fixed 60 second timeout. A valid operation on any pending requests from the sync provider resets the timers of all pending requests.
 * 
 * 
 * All callback functions have the same prototype with two arguments: a CF_CALLBACK_INFO structure and a CF_CALLBACK_PARAMETER structure.
 * 
 * 
 * Callback routines have no return value.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_type
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_TYPE{

    /**
     * Callback to satisfy an I/O request, or a placeholder hydration request.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_FETCH_DATA => 0

    /**
     * Callback to validate placeholder data.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_VALIDATE_DATA => 1

    /**
     * Callback to cancel an ongoing placeholder hydration.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_CANCEL_FETCH_DATA => 2

    /**
     * Callback to request information about the contents of placeholder files.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_FETCH_PLACEHOLDERS => 3

    /**
     * Callback to cancel a request for the contents of placeholder files.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_CANCEL_FETCH_PLACEHOLDERS => 4

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots has been successfully opened for read/write/delete access.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_FILE_OPEN_COMPLETION => 5

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots that has been previously opened for read/write/delete access is now closed.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_FILE_CLOSE_COMPLETION => 6

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots is about to be dehydrated.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE => 7

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots has been successfully dehydrated.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE_COMPLETION => 8

    /**
     * Callback  to inform the sync provider that a placeholder under one of its sync roots is about to be deleted.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_DELETE => 9

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots has been successfully deleted.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_DELETE_COMPLETION => 10

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots is about to be renamed or moved.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_RENAME => 11

    /**
     * Callback to inform the sync provider that a placeholder under one of its sync roots has been successfully renamed or moved.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NOTIFY_RENAME_COMPLETION => 12

    /**
     * No callback type.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_TYPE_NONE => -1
}
