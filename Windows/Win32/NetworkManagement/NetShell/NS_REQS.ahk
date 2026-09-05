#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the number of events.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ne-netsh-ns_reqs
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
class NS_REQS extends Win32Enum {

    /**
     * Native name: NS_REQ_ZERO
     * @type {Integer (Int32)}
     */
    static REQ_ZERO => 0

    /**
     * Native name: NS_REQ_PRESENT
     * @type {Integer (Int32)}
     */
    static REQ_PRESENT => 1

    /**
     * Native name: NS_REQ_ALLOW_MULTIPLE
     * @type {Integer (Int32)}
     */
    static REQ_ALLOW_MULTIPLE => 2

    /**
     * Native name: NS_REQ_ONE_OR_MORE
     * @type {Integer (Int32)}
     */
    static REQ_ONE_OR_MORE => 3
}
