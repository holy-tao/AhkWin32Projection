#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The abstract base type for all SAML authenticators used on the server side to validate incoming SAML tokens.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_saml_authenticator
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SAML_AUTHENTICATOR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The type id that indicates the SAML authenticator subtype of this authenticator.
     * @type {Integer}
     */
    authenticatorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
