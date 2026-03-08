#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Uses system and per-user proxy settings (including the Internet Explorer proxy configuration) to determine which proxy/proxies to use. Automatically attempts to handle failover between multiple proxies, different proxy configurations per interface, and authentication. Supported in Windows 8.1 and newer.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpopen
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_ACCESS_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ACCESS_TYPE_NO_PROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ACCESS_TYPE_DEFAULT_PROXY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ACCESS_TYPE_NAMED_PROXY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY => 4
}
