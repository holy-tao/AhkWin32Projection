#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the level of nesting in the IMessageFilter::MessagePending method.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-pendingtype
 * @namespace Windows.Win32.System.Com
 */
class PENDINGTYPE extends Win32Enum {

    /**
     * Top-level call.
     * Native name: PENDINGTYPE_TOPLEVEL
     * @type {Integer (Int32)}
     */
    static TOPLEVEL => 1

    /**
     * Nested call.
     * Native name: PENDINGTYPE_NESTED
     * @type {Integer (Int32)}
     */
    static NESTED => 2
}
