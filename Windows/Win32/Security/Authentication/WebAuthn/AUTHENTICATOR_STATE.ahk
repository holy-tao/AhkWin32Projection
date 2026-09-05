#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class AUTHENTICATOR_STATE extends Win32Enum {

    /**
     * Native name: AuthenticatorState_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Native name: AuthenticatorState_Enabled
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
