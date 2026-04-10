#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The Windows Sockets WSAECOMPARATOR enumeration type is used for version-comparison semantics in Windows Sockets 2.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ne-winsock2-wsaecomparator
 * @namespace Windows.Win32.Networking.WinSock
 */
class WSAECOMPARATOR extends Win32Enum {

    /**
     * Used for determining whether version values are equal.
     * @type {Integer (Int32)}
     */
    static COMP_EQUAL => 0

    /**
     * Used for determining whether a version value is no less than a specified value.
     * @type {Integer (Int32)}
     */
    static COMP_NOTLESS => 1
}
