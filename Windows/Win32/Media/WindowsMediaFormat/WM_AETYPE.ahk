#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_AETYPE enumeration specifies the permissions for an entry in an IP address access list.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wm_aetype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_AETYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * IP addresses that match the access entry are allowed to connect to the network sink.
     * @type {Integer (Int32)}
     */
    static WM_AETYPE_INCLUDE => 105

    /**
     * IP addresses that match the access entry are not allowed to connect to the network sink.
     * @type {Integer (Int32)}
     */
    static WM_AETYPE_EXCLUDE => 101
}
