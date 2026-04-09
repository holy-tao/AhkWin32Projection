#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class AUTHENTICATOR_STATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AuthenticatorState_Disabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static AuthenticatorState_Enabled => 1
}
