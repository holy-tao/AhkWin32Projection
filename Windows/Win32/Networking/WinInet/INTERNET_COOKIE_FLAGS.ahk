#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_COOKIE_FLAGS extends Win32Enum {

    /**
     * Native name: INTERNET_COOKIE_HTTPONLY
     * @type {Integer (UInt32)}
     */
    static HTTPONLY => 8192

    /**
     * Native name: INTERNET_COOKIE_THIRD_PARTY
     * @type {Integer (UInt32)}
     */
    static THIRD_PARTY => 16

    /**
     * Native name: INTERNET_FLAG_RESTRICTED_ZONE
     * @type {Integer (UInt32)}
     */
    static FLAG_RESTRICTED_ZONE => 131072
}
