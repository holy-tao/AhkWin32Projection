#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about all endpoints that were read from metadata documents.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_metadata_endpoints
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_METADATA_ENDPOINTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of endpoints.
     * @type {Pointer<WS_METADATA_ENDPOINT>}
     */
    endpoints {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the endpoints array.
     * @type {Integer}
     */
    endpointCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
