#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE extends Win32Enum {

    /**
     * Native name: PerformUserVerification
     * @type {Integer (Int32)}
     */
    static UserVerification => 1

    /**
     * @type {Integer (Int32)}
     */
    static GetUserVerificationCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static GetPublicKey => 3
}
