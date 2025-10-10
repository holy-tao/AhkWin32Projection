#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the level of nesting in the IMessageFilter::MessagePending method.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-pendingtype
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class PENDINGTYPE{

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
