#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_PRIORITY_HINT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SocketPriorityHintVeryLow => 0

    /**
     * @type {Integer (Int32)}
     */
    static SocketPriorityHintLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static SocketPriorityHintNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static SocketMaximumPriorityHintType => 3
}
