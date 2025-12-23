#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about a mapping between a WS_ENDPOINT_ADDRESS and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_address_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENDPOINT_ADDRESS_DESCRIPTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The WS-Addressing version to use when serializing the endpoint address.
     * @type {Integer}
     */
    addressingVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
