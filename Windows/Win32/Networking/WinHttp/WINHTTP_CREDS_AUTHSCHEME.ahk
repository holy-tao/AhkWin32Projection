#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_CREDS_AUTHSCHEME extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_NEGOTIATE => 16
}
