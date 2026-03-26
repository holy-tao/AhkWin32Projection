#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class WEBAUTHN_PLUGIN_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_PLUGIN_REQUEST_TYPE_CTAP2_CBOR => 1
}
