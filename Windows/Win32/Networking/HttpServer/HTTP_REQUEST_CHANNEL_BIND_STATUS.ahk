#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * HTTP_REQUEST_CHANNEL_BIND_STATUS.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_channel_bind_status
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_CHANNEL_BIND_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_w">HTTP_SERVICE_BINDING_W</a> structure cast to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> structure containing the service name  from the client.  This is populated if the request's Channel Binding Token (CBT) is not configured to retrieve service names.
     * @type {Pointer<HTTP_SERVICE_BINDING_BASE>}
     */
    ServiceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a buffer that contains the secure channel endpoint binding.
     * @type {Pointer<Byte>}
     */
    ChannelToken {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length of the <b>ChannelToken</b> buffer in bytes.
     * @type {Integer}
     */
    ChannelTokenSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
