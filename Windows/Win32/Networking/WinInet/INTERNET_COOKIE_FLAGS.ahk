#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_COOKIE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_HTTPONLY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_THIRD_PARTY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_RESTRICTED_ZONE => 131072
}
