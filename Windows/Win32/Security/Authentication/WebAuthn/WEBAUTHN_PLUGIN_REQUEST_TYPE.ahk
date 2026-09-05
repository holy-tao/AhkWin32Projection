#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_PLUGIN_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: WEBAUTHN_PLUGIN_REQUEST_TYPE_CTAP2_CBOR
     * @type {Integer (Int32)}
     */
    static CTAP2_CBOR => 1
}
