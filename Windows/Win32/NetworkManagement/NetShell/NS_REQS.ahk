#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the number of events.
 * @see https://docs.microsoft.com/windows/win32/api//netsh/ne-netsh-ns_reqs
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_REQS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_ZERO => 0

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_PRESENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_ALLOW_MULTIPLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_ONE_OR_MORE => 3
}
