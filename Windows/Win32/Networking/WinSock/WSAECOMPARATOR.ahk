#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The Windows Sockets WSAECOMPARATOR enumeration type is used for version-comparison semantics in Windows Sockets 2.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ne-winsock2-wsaecomparator
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAECOMPARATOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
