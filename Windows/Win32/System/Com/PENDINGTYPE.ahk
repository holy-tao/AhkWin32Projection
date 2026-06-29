#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the level of nesting in the IMessageFilter::MessagePending method.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-pendingtype
 * @namespace Windows.Win32.System.Com
 */
export default struct PENDINGTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Top-level call.
     * @type {Integer (Int32)}
     */
    static PENDINGTYPE_TOPLEVEL => 1

    /**
     * Nested call.
     * @type {Integer (Int32)}
     */
    static PENDINGTYPE_NESTED => 2
}
