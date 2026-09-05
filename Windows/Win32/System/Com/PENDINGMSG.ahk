#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the return values for the IMessageFilter::MessagePending method.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-pendingmsg
 * @namespace Windows.Win32.System.Com
 */
class PENDINGMSG extends Win32Enum {

    /**
     * Cancel the outgoing call.
     * Native name: PENDINGMSG_CANCELCALL
     * @type {Integer (Int32)}
     */
    static CANCELCALL => 0

    /**
     * Wait for the return and don't dispatch the message.
     * Native name: PENDINGMSG_WAITNOPROCESS
     * @type {Integer (Int32)}
     */
    static WAITNOPROCESS => 1

    /**
     * Wait and dispatch the message.
     * Native name: PENDINGMSG_WAITDEFPROCESS
     * @type {Integer (Int32)}
     */
    static WAITDEFPROCESS => 2
}
