#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The abstract base type for all certificate credential types.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERT_CREDENTIAL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The type ID that indicates which of the certificate credential
     * subtypes this certificate credential is.
     * @type {Integer}
     */
    credentialType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
