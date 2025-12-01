#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specified the usage type for the socket.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ne-mstcpip-socket_usage_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_USAGE_TYPE extends Win32Enum{

    /**
     * The usage type is critical to the system.
     * @type {Integer (Int32)}
     */
    static SYSTEM_CRITICAL_SOCKET => 1
}
