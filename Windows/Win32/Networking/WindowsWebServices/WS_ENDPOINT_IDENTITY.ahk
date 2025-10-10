#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The base type for all endpoint identities.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENDPOINT_IDENTITY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The selector for the type of the endpoint identity.
     * @type {Integer}
     */
    identityType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
