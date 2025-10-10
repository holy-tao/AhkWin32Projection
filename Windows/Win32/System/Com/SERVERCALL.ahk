#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the status of server call.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-servercall
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class SERVERCALL{

    /**
     * The object may be able to process the call.
     * @type {Integer (Int32)}
     */
    static SERVERCALL_ISHANDLED => 0

    /**
     * The object cannot handle the call due to an unforeseen problem, such as network unavailability.
     * @type {Integer (Int32)}
     */
    static SERVERCALL_REJECTED => 1

    /**
     * The object cannot handle the call at this time. For example, an application might return this value when it is in a user-controlled modal state.
     * @type {Integer (Int32)}
     */
    static SERVERCALL_RETRYLATER => 2
}
