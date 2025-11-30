#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the return values for the IMessageFilter::MessagePending method.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-pendingmsg
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class PENDINGMSG extends Win32Enum{

    /**
     * Cancel the outgoing call.
     * @type {Integer (Int32)}
     */
    static PENDINGMSG_CANCELCALL => 0

    /**
     * Wait for the return and don't dispatch the message.
     * @type {Integer (Int32)}
     */
    static PENDINGMSG_WAITNOPROCESS => 1

    /**
     * Wait and dispatch the message.
     * @type {Integer (Int32)}
     */
    static PENDINGMSG_WAITDEFPROCESS => 2
}
