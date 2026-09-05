#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_CREDS_AUTHSCHEME extends Win32Enum {

    /**
     * Native name: WINHTTP_AUTH_SCHEME_BASIC
     * @type {Integer (UInt32)}
     */
    static AUTH_SCHEME_BASIC => 1

    /**
     * Native name: WINHTTP_AUTH_SCHEME_NTLM
     * @type {Integer (UInt32)}
     */
    static AUTH_SCHEME_NTLM => 2

    /**
     * Native name: WINHTTP_AUTH_SCHEME_NEGOTIATE
     * @type {Integer (UInt32)}
     */
    static AUTH_SCHEME_NEGOTIATE => 16
}
