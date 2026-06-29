#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HTTP_REQUEST_PROPERTY_STREAM_ERROR structure represents an HTTP/2 or HTTP/3 stream error code.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_property_stream_error
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_PROPERTY_STREAM_ERROR {
    #StructPack 4

    /**
     * The protocol stream error code.
     */
    ErrorCode : UInt32

}
