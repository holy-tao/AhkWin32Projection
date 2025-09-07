#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WM_AETYPE enumeration specifies the permissions for an entry in an IP address access list.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wm_aetype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_AETYPE{

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
