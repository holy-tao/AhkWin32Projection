#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SCHANNEL_SESSION_TOKEN_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SSL_SESSION_ENABLE_RECONNECTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSL_SESSION_DISABLE_RECONNECTS => 2
}
