#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the call types used by IMessageFilter::HandleInComingCall.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-calltype
 * @namespace Windows.Win32.System.Com
 */
class CALLTYPE extends Win32Enum {

    /**
     * A top-level call has arrived and the object is not currently waiting for a reply from a previous outgoing call. Calls of this type should always be handled.
     * Native name: CALLTYPE_TOPLEVEL
     * @type {Integer (Int32)}
     */
    static TOPLEVEL => 1

    /**
     * A call has arrived bearing the same logical thread identifier as that of a previous outgoing call for which the object is still awaiting a reply. Calls of this type should always be handled.
     * Native name: CALLTYPE_NESTED
     * @type {Integer (Int32)}
     */
    static NESTED => 2

    /**
     * An asynchronous call has arrived. Calls of this type cannot be rejected. OLE always delivers calls of this type.
     * Native name: CALLTYPE_ASYNC
     * @type {Integer (Int32)}
     */
    static ASYNC => 3

    /**
     * A new top-level call has arrived with a new logical thread identifier and the object is currently waiting for a reply from a previous outgoing call. Calls of this type may be handled or rejected.
     * Native name: CALLTYPE_TOPLEVEL_CALLPENDING
     * @type {Integer (Int32)}
     */
    static TOPLEVEL_CALLPENDING => 4

    /**
     * An asynchronous call has arrived with a new logical thread identifier and the object is currently waiting for a reply from a previous outgoing call. Calls of this type cannot be rejected.
     * Native name: CALLTYPE_ASYNC_CALLPENDING
     * @type {Integer (Int32)}
     */
    static ASYNC_CALLPENDING => 5
}
