#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_OPEN_REQUEST_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: WINHTTP_FLAG_BYPASS_PROXY_CACHE
     * @type {Integer (UInt32)}
     */
    static FLAG_BYPASS_PROXY_CACHE => 256

    /**
     * Native name: WINHTTP_FLAG_ESCAPE_DISABLE
     * @type {Integer (UInt32)}
     */
    static FLAG_ESCAPE_DISABLE => 64

    /**
     * Native name: WINHTTP_FLAG_ESCAPE_DISABLE_QUERY
     * @type {Integer (UInt32)}
     */
    static FLAG_ESCAPE_DISABLE_QUERY => 128

    /**
     * Native name: WINHTTP_FLAG_ESCAPE_PERCENT
     * @type {Integer (UInt32)}
     */
    static FLAG_ESCAPE_PERCENT => 4

    /**
     * Native name: WINHTTP_FLAG_NULL_CODEPAGE
     * @type {Integer (UInt32)}
     */
    static FLAG_NULL_CODEPAGE => 8

    /**
     * Native name: WINHTTP_FLAG_REFRESH
     * @type {Integer (UInt32)}
     */
    static FLAG_REFRESH => 256

    /**
     * Native name: WINHTTP_FLAG_SECURE
     * @type {Integer (UInt32)}
     */
    static FLAG_SECURE => 8388608
}
