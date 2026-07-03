#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_URLACL_KEY.ahk" { HTTP_SERVICE_CONFIG_URLACL_KEY }
#Import ".\HTTP_SERVICE_CONFIG_URLACL_PARAM.ahk" { HTTP_SERVICE_CONFIG_URLACL_PARAM }

/**
 * Used to add a new record to the URL reservation store or retrieve an existing record from it.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_URLACL_SET {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_key">HTTP_SERVICE_CONFIG_URLACL_KEY</a> structure that identifies the URL reservation record.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_URLACL_KEY

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_param">HTTP_SERVICE_CONFIG_URLACL_PARAM</a> structure that holds the contents of the specified URL reservation record.
     */
    ParamDesc : HTTP_SERVICE_CONFIG_URLACL_PARAM

}
