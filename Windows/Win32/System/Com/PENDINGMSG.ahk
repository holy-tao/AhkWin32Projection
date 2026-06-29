#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the return values for the IMessageFilter::MessagePending method.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-pendingmsg
 * @namespace Windows.Win32.System.Com
 */
export default struct PENDINGMSG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
