#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the call types used by IMessageFilter::HandleInComingCall.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-calltype
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CALLTYPE extends Win32Enum{

    /**
     * A top-level call has arrived and the object is not currently waiting for a reply from a previous outgoing call. Calls of this type should always be handled.
     * @type {Integer (Int32)}
     */
    static CALLTYPE_TOPLEVEL => 1

    /**
     * A call has arrived bearing the same logical thread identifier as that of a previous outgoing call for which the object is still awaiting a reply. Calls of this type should always be handled.
     * @type {Integer (Int32)}
     */
    static CALLTYPE_NESTED => 2

    /**
     * An asynchronous call has arrived. Calls of this type cannot be rejected. OLE always delivers calls of this type.
     * @type {Integer (Int32)}
     */
    static CALLTYPE_ASYNC => 3

    /**
     * A new top-level call has arrived with a new logical thread identifier and the object is currently waiting for a reply from a previous outgoing call. Calls of this type may be handled or rejected.
     * @type {Integer (Int32)}
     */
    static CALLTYPE_TOPLEVEL_CALLPENDING => 4

    /**
     * An asynchronous call has arrived with a new logical thread identifier and the object is currently waiting for a reply from a previous outgoing call. Calls of this type cannot be rejected.
     * @type {Integer (Int32)}
     */
    static CALLTYPE_ASYNC_CALLPENDING => 5
}
