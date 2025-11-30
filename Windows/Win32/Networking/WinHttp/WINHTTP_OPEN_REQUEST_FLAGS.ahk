#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_OPEN_REQUEST_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_BYPASS_PROXY_CACHE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_DISABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_DISABLE_QUERY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_PERCENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_NULL_CODEPAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_REFRESH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE => 8388608
}
