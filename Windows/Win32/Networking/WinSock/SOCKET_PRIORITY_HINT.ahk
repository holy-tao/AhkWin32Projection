#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKET_PRIORITY_HINT extends Win32Enum {

    /**
     * Native name: SocketPriorityHintVeryLow
     * @type {Integer (Int32)}
     */
    static VeryLow => 0

    /**
     * Native name: SocketPriorityHintLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: SocketPriorityHintNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Native name: SocketMaximumPriorityHintType
     * @type {Integer (Int32)}
     */
    static MaximumPriorityHintType => 3
}
