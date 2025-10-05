#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HTTP_REQUEST_PROPERTY_STREAM_ERROR structure represents an HTTP/2 or HTTP/3 stream error code.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_property_stream_error
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_PROPERTY_STREAM_ERROR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The protocol stream error code.
     * @type {Integer}
     */
    ErrorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
