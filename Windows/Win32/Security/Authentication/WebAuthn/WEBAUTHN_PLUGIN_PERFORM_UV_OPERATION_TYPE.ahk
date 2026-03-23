#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PerformUserVerification => 1

    /**
     * @type {Integer (Int32)}
     */
    static GetUserVerificationCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static GetPublicKey => 3
}
