#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to specified the usage type for the socket.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ne-mstcpip-socket_usage_type
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_USAGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The usage type is critical to the system.
     * @type {Integer (Int32)}
     */
    static SYSTEM_CRITICAL_SOCKET => 1
}
