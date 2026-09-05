#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the status of server call.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-servercall
 * @namespace Windows.Win32.System.Com
 */
class SERVERCALL extends Win32Enum {

    /**
     * The object may be able to process the call.
     * Native name: SERVERCALL_ISHANDLED
     * @type {Integer (Int32)}
     */
    static ISHANDLED => 0

    /**
     * The object cannot handle the call due to an unforeseen problem, such as network unavailability.
     * Native name: SERVERCALL_REJECTED
     * @type {Integer (Int32)}
     */
    static REJECTED => 1

    /**
     * The object cannot handle the call at this time. For example, an application might return this value when it is in a user-controlled modal state.
     * Native name: SERVERCALL_RETRYLATER
     * @type {Integer (Int32)}
     */
    static RETRYLATER => 2
}
