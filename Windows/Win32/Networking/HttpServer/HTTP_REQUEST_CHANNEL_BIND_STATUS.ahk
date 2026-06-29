#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_BINDING_BASE.ahk" { HTTP_SERVICE_BINDING_BASE }

/**
 * HTTP_REQUEST_CHANNEL_BIND_STATUS.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_channel_bind_status
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_CHANNEL_BIND_STATUS {
    #StructPack 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_w">HTTP_SERVICE_BINDING_W</a> structure cast to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> structure containing the service name  from the client.  This is populated if the request's Channel Binding Token (CBT) is not configured to retrieve service names.
     */
    ServiceName : HTTP_SERVICE_BINDING_BASE.Ptr

    /**
     * A pointer to a buffer that contains the secure channel endpoint binding.
     */
    ChannelToken : IntPtr

    /**
     * The length of the <b>ChannelToken</b> buffer in bytes.
     */
    ChannelTokenSize : UInt32

    /**
     * Reserved
     */
    Flags : UInt32

}
