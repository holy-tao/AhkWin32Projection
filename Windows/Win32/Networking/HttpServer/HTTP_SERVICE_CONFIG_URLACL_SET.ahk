#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to add a new record to the URL reservation store or retrieve an existing record from it.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_set
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_URLACL_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_key">HTTP_SERVICE_CONFIG_URLACL_KEY</a> structure that identifies the URL reservation record.
     * @type {Pointer<Char>}
     */
    KeyDesc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_param">HTTP_SERVICE_CONFIG_URLACL_PARAM</a> structure that holds the contents of the specified URL reservation record.
     * @type {Pointer<Char>}
     */
    ParamDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
